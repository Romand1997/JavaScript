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
<%--                <ul class="list-group list-group-flush">--%>
<%--                    <li class="fw-bold bg-secondary bg-opacity-25 list-group-item">Четвертый элемент</li>--%>
<%--                    <li class="bg-light list-group-item">--%>
<%--&lt;%&ndash;                        <%@include file="addItem.jsp"%>&ndash;%&gt;--%>
<%--                    </li>--%>
<%--                    <li class="bg-light list-group-item">--%>
<%--                        <%@include file="addBrand.jsp"%>--%>
<%--                    </li>--%>
<%--                    <li class="bg-light list-group-item">--%>
<%--                        <%@include file="addCategory.jsp"%>--%>
<%--                    </li>--%>
<%--                    <li class="bg-light list-group-item">Четвертый элемент</li>--%>
<%--                    <li class="bg-light list-group-item">И пятый</li>--%>
<%--                </ul>--%>

</div>
</body>
</html>
