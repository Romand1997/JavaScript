<%@page import="Class.*" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 12.12.2022
  Time: 14:10
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
<div class="d-flex justify-content-center row">
    <div class="col-3">
        <%
            if (request.getParameter("editFullname") != null) {
        %>
        <div input-group>
            <form action="/ProfileServlet" method="post">
                <label for="fullName" class="mt-3 mb-1">
                    FullName:
                </label>
                <div class="mb-3">
                    <input type="text" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="fullName" id="fullName" value="<%=user.getFullName()%>" required>
                </div>
                <div class=" mt-3 modal-footer d-flex justify-content-evenly">
                    <button class="btn btn-success">Save</button>
                </div>
            </form>
        </div>
        <%
        } else if (request.getParameter("editEmail") != null) {
        %>
        <div input-group>
            <form action="/ProfileServlet" method="post">
                <label for="email" class="mt-3 mb-1">
                    Email:
                </label>
                <div class="mb-3">
                    <input type="email" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="email" id="email" value="<%=user.getEmail()%>" required>
                </div>
                <%
                    if (request.getParameter("errorEmail") != null) {
                %>
                <div id="emailHelp" class="form-text text-danger">user with this email is already registered</div>
                <%
                    }
                %>
                <div class=" mt-3 modal-footer d-flex justify-content-evenly">
                    <button class="btn btn-success">Save</button>
                </div>
            </form>
        </div>
        <%
        } else if (request.getParameter("editPassword") != null) {
        %>
        <div input-group>
            <form action="/ProfileServlet" method="post">
                <label for="oldPassword" class="mt-3 mb-1">
                    Old Password:
                </label>
                <div class="mb-3">
                    <input type="password" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="oldPassword" id="OldPassword" required>
                </div>
                <%
                    if (request.getParameter("errorOldPassword") != null) {
                %>
                <div id="emailHelp" class="mb-0 form-text text-danger">Incorrect old password</div>
                <%
                    }
                %>
                <label for="newPassword" class="mt-3 mb-1">
                    New Password:
                </label>
                <div class="mb-3">
                    <input type="password" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="newPassword" id="newPassword" required>
                </div>
                <label for="repeatNewPassword" class="mt-3 mb-1">
                    Repeat New Password:
                </label>
                <div class="mb-3">
                    <input type="password" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="repeatNewPassword" id="repeatNewPassword" required>
                </div>
                <%
                    if (request.getParameter("passwordsNotSame") != null) {
                %>
                <div id="emailHelp" class="mb-0 form-text text-danger">Passwords are not same</div>
                <%
                    }
                %>
                <div class=" mt-3 modal-footer d-flex justify-content-evenly">
                    <button class="btn btn-success">Save</button>
                </div>
            </form>
        </div>
        <%
        } else {
            if (request.getParameter("successfuly")!=null){
        %>
        <h3 class="text-success">Profile edited successfully!</h3>
        <%
            }
        %>
        <div class="d-flex">
            <div>
                <label for="fullName2" class="mt-3 mb-1">
                    FullName:
                </label>
                <div class="mb-3">
                    <input type="text" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="fullName" id="fullName2" value="<%=user.getFullName()%>" readonly>
                </div>
            </div>
            <div class=" ms-4 mt-5">
                <a href="/ProfileServlet?editFullname" class="btn btn-primary">Edit Fullname</a>
            </div>
        </div>
        <div class="d-flex">
            <div>
                <label for="email2" class="mt-3 mb-1">
                    Email:
                </label>
                <div class="mb-3">
                    <input type="text" class="form-control" aria-label="Вводит полное имя"
                           aria-describedby="inputGroup-sizing-default"
                           name="email" id="email2" value="<%=user.getEmail()%>" readonly>
                </div>
            </div>
            <div class=" ms-4 mt-5">
                <a href="/ProfileServlet?editEmail" class="btn btn-primary ps-4 pe-4">Edit Email</a>
            </div>
        </div>
        <div class="d-flex">
            <div>
                <label for="password" class="mt-3 mb-1">
                    Password:
                </label>
                <div class="mb-3">
                    <input type="password" class="form-control" aria-label="Вводит password"
                           aria-describedby="inputGroup-sizing-default"
                           name="password" id="password" value="tut nichego net" readonly>
                </div>
            </div>
            <div class=" ms-4 mt-5">
                <a href="/ProfileServlet?editPassword" class="btn btn-primary">Edit Password</a>
            </div>
        </div>
        <form method="post" action="/LoginServlet">
            <div class="d-flex justify-content-evenly mt-3">
                <a href="/home" class="btn btn-secondary">
                    Close
                </a>
                <button class="btn btn-warning">Logout</button>
            </div>
        </form>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
