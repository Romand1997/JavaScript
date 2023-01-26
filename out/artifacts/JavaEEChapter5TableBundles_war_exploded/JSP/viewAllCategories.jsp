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
            <table class="table table-borderless table-hover">
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
                    <td>
                        <%@include file="addItem.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%@include file="addBrand.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%@include file="addCategory.jsp" %>
                    </td>
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
            <%
                Category novCategory = (Category) request.getAttribute("detailsOfCategory");
                if (novCategory != null) {

            %>
            <div class="container" input-group>
                <form action="/CategoryAdminServlet?idOfCategoryForUpdate=<%=novCategory.getId()%>" method="post">
                    <label for="nameOfCategory" class="mt-3 mb-1">
                        Name:
                    </label>
                    <div class="mb-3">
                        <input type="text" class="form-control" aria-label="Вводит название товара"
                               aria-describedby="inputGroup-sizing-default"
                               name="nameOfCategory" id="nameOfCategory" value="<%=novCategory.getNameOfCategory()%>"
                               required>
                    </div>
                    <div class="modal-footer d-flex justify-content-evenly">
                        <a type="button" class="btn btn-secondary" href="/CategoryAdminServlet">
                            Закрыть
                        </a>
                        <button class="btn btn-primary">Сохранить изменения</button>
                    </div>
                </form>
            </div>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-10">
                    <table class=" mt-3  table  text-center">
                        <thead style="background-color: #e3fce1">
                        <tr>
                            <th scope="col">
                                ID
                            </th>
                            <th scope="col">
                                Name
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (categories != null) {
                                for (Category category : categories) {
                        %>
                        <tr>
                            <td scope="row">
                                <%=category.getId()%>
                            </td>
                            <td scope="row">
                                <%=category.getNameOfCategory()%>
                            </td>

                            <%
                                }
                            %>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-1">
                    <table class=" mt-3  table  text-center">
                        <thead style="background-color: #e3fce1">
                        <tr>
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
                            if (categories != null) {
                                for (Category category : categories) {
                        %>
                        <tr>
                            <td scope="row">
                                <a type="button" class="btn btn-primary"
                                   href="/CategoryAdminServlet?idOfCategory=<%=category.getId()%>">Details</a>
                            </td>
                            <td scope="row">
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#confirmDelete<%=category.getId()%>">
                                    Delete
                                </button>

                                <!-- Модальное окно -->
                                <div class="modal fade" id="confirmDelete<%=category.getId()%>" tabindex="-1"
                                     aria-labelledby="confirmDeleteLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                You want to delete Category (<%=category.getNameOfCategory()%>) </br>
                                                Are You Shure?
                                            </div>
                                            <div class="modal-footer d-flex justify-content-evenly">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Back
                                                </button>
                                                <form action="/CategoryAdminServlet?idOfCategoryForDelete=<%=category.getId()%>"
                                                      method="post">
                                                    <button class="btn btn-danger">Delete</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
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
