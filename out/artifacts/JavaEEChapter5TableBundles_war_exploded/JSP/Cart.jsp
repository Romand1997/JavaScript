<%@ page import="java.util.ArrayList" %>
<%@ page import="Class.*" %>
<%@ page import="org.w3c.dom.ls.LSOutput" %>
<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 09.12.2022
  Time: 12:41
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
<%
    ArrayList<Item> items = (ArrayList<Item>) session.getAttribute("itemsForCart");
        if (items != null && items.size()!=0) {
%>
<%System.out.print(items.size());%>
<table class=" mt-3  table  text-center">
    <thead style="background-color: #e3fce1">
    <tr>
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
            Details
        </th>
        <th scope="col">
            Delete
        </th>
    </tr>
    </thead>
    <tbody>
    <%
            for (int i=0; i<items.size();i++) {
                if (items.get(i).getBrand() != null) {
    %>
    <tr>
        <td scope="row">
            <%=items.get(i).getName()%>
        </td>
        <td scope="row">
            <%=items.get(i).getBrand().getName() + " " + items.get(i).getBrand().getCountry()%>
        </td>
        <td scope="row">
            <%=items.get(i).getPrice()%>
        </td>
        <td scope="row">
            <%=items.get(i).getDescription()%>
        </td>
        <td scope="row">
            <%="(" + items.get(i).getCategory().getId() + ") " + items.get(i).getCategory().getNameOfCategory()%>
        </td>
        <td scope="row">
            <input type="hidden" name="idOfItemForDetails" value="<%=items.get(i).getId()%>">
            <a type="button" class="btn btn-primary"
               href="/DetailsOfItemServlet?idOfItemForDetails=<%=items.get(i).getId()%>">Details</a>
        </td>
        <td scope="row">
            <!-- Кнопка-триггер модального окна -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                    data-bs-target="#confirmDelete<%=items.get(i).getId()%>">
                Delete
            </button>

            <!-- Модальное окно -->
            <div class="modal fade" id="confirmDelete<%=items.get(i).getId()%>" tabindex="-1"
                 aria-labelledby="confirmDeleteLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            You want to delete <%=items.get(i).getName()%> </br>
                            Are You Shure?
                        </div>
                        <div class="modal-footer d-flex justify-content-evenly">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                            <form action="/CartServlet" method="post">
                                <input type="hidden" name = "idOfItemForDelete" value="<%=i%>">
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
<div class="container text-center mt-3">
    <a href="/home" class="btn btn-success btn-lg">Back to Shop</a>
</div>
<%
    } else {
%>
    <div class="container text-center mt-3">
        <h2>Your card is empty</h2><br>
        <h2> You can contine shopping by one click</h2><br>
        <a href="/home" class="btn btn-success btn-lg">Back to Shop</a>
    </div>
<%
    }
%>
</body>
</html>
