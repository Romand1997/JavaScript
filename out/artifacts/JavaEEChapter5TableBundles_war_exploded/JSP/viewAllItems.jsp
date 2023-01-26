<%@page import="Class.*" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 02.12.2022
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
<%@include file="NavBar.jsp" %>
<div class="ms-2 me-5 ">
    <div class="row">
        <div class="bg-light col-3 ">
            <table class="table table-borderless table-hover" >
                <thead>
                    <tr>
                        <th class=" fs-5 text-center border-top border-bottom">Admin Panel</th>
                    </tr>
                </thead>
                <thead>
                <tr>
                    <th class="text-center border-bottom">Adding</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%@include file="addItem.jsp"%></td>
                    </tr>
                    <tr>
                        <td><%@include file="addBrand.jsp"%></td>
                    </tr>
                    <tr>
                        <td><%@include file="addCategory.jsp"%></td>
                    </tr>
                </tbody>
                <thead>
                <tr>
                    <th class="text-center border-bottom">View</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <a class="dropdown-item" href="/ItemAdminServlet"> All Items </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class="dropdown-item" href="/BrandAdminServlet"> All Brands </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class="dropdown-item" href="/CategoryAdminServlet"> All Categories </a>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
        <div class="col-9">
            <% Item item = (Item) request.getAttribute("detailsOfItem");
                if (item!=null){
            %>
            <div class="container " input-group>
                <p class="text-center">Public by <%=item.getUser().getFullName()+" ("+item.getUser().getEmail()+") at "
                +item.getDateOfPublic()%></p>
                <form action="/ItemAdminServlet?idOfItemForUpdate=<%=item.getId()%>" method="post">
                    <label for="nameOfInput" class="mt-3 mb-1">
                        Name:
                    </label>
                    <div class="mb-3">
                        <input type="text" class="form-control" aria-label="Вводит название товара"
                               aria-describedby="inputGroup-sizing-default"
                               name="name" id="nameOfInput" value="<%=item.getName()%>" required>
                    </div>
                    <label for="nameOfBrand" class="mb-1">
                        Brand:
                    </label>
                    <div class="mb-3">
                        <select class="form-select" aria-label="Вводит название Brand-a" id="nameOfBrand"
                                name="brand">
                            <%
                                if (brands!=null){
                                    for (Brand brand : brands){
                            %>
                            <option <%=item.getBrand().getId()==brand.getId()?"selected":""%>
                                    value="<%=brand.getId()%>"><%=brand.getName()+" " +
                                    ""+brand.getCountry()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <label for="nameOfBrand" class="mb-1">
                        Category:
                    </label>
                    <div class="mb-3">
                        <select class="form-select" aria-label="Выбирает категорию" id="nameOfСategory"
                                name="category">
                            <%
                                if (categories!=null){
                                    for (Category category : categories){
                            %>
                            <option <%=item.getCategory().getId()==category.getId()?"selected":""%>
                                    value="<%=category.getId()%>"><%=category.getNameOfCategory()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <label for="price" class="mb-1">
                        Price:
                    </label>
                    <div class="mb-3">
                        <input type="number" class="form-control" aria-label="Вводит цену товара"
                               aria-describedby="inputGroup-sizing-default"
                               name="price" id="price" value="<%=item.getPrice()%>" required>
                    </div>
                    <label for="descriptionOfInput" class="mb-1">
                        Description:
                    </label>
                    <div class="mb-3">
                                <textarea class="form-control" aria-label="Вводит содержание товара"
                                          name="description"
                                          id="descriptionOfInput"><%=item.getDescription()%></textarea>
                    </div>
                    <div class="modal-footer d-flex justify-content-evenly">
                        <a  class="btn btn-secondary" href ="/ItemAdminServlet">
                            Закрыть
                        </a>
                        <button class="btn btn-primary">Сохранить изменения</button>
                    </div>
                </form>
            </div>
            <%
            } else {
            %>
        <table class=" mt-3  table  text-center">
            <thead style="background-color: #e3fce1">
            <tr>
                <th scope="col">
                    ID
                </th>
                <th scope="col">
                    Name
                </th>
                <th scope="col">
                    Brand
                </th>
                <th scope="col">
                    Price
                </th>
                <th scope="col">
                    Description
                </th>
                <th scope="col">
                    Category
                </th>
                <th scope="col">
                    Date of Public
                </th>
                <th scope="col">
                    Admin
                </th>
                <th scope="col">
                    Details
                </th>
                <th scope="col">
                    Delete
                </th>
            </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
                    if (items != null) {
                        for (Item novItem : items) {
                            if (novItem.getBrand()!=null){
                %>
                <tr>
                    <td scope="row">
                        <%=novItem.getId()%>
                    </td>
                    <td scope="row">
                        <%=novItem.getName()%>
                    </td>
                    <td scope="row">
                        <%=novItem.getBrand().getName()+" "+novItem.getBrand().getCountry()%>
                    </td>
                    <td scope="row">
                        <%=novItem.getPrice()%>
                    </td>
                    <td scope="row">
                        <%=novItem.getDescription()%>
                    </td>
                    <td scope="row">
                        <%="("+novItem.getCategory().getId()+") "+novItem.getCategory().getNameOfCategory()%>
                    </td>
                    <td scope="row">
                        <%=novItem.getDateOfPublic()%>
                    </td>
                    <td scope="row">
                        <%=novItem.getUser().getFullName()+" ("+novItem.getUser().getEmail()+")"%>
                    </td>
                    <td scope="row">
                        <a type="button" class="btn btn-primary"
                           href="/ItemAdminServlet?idOfItem=<%=novItem.getId()%>">Details</a>
                    </td>
                    <td scope="row">
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#confirmDelete<%=novItem.getId()%>">
                            Delete
                        </button>

                        <!-- Модальное окно -->
                        <div class="modal fade" id="confirmDelete<%=novItem.getId()%>" tabindex="-1"
                             aria-labelledby="confirmDeleteLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        You want to delete <%=novItem.getName()%> </br>
                                        Are You Shure?
                                    </div>
                                    <div class="modal-footer d-flex justify-content-evenly">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Back
                                        </button>
                                        <form action="/CategoryAdminServlet?idOfCategoryForDelete=<%=novItem.getId()%>"
                                              method="post">
                                            <button class="btn btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>

                    <%
                            }
                        }

                    %>
                </tr>
            </tbody>
        </table>
                    <%
                        } else {
                    %>
            </tbody>
        </table>
        </div>
        <div class="container">
            <h2 class="text-color-danger">Error DataBase</h2>
        </div>
        <%
            }
            }
        %>
    </div>
</div>
</body>
</html>
