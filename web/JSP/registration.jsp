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
<div class="d-flex justify-content-center row">
    <div class="col-3" input-group>
        <form action="/RegistrationServlet" method="post">
            <label for="fullName" class="mt-3 mb-1">
                FullName:
            </label>
            <div class="mb-3">
                <input type="text" class="form-control" aria-label="Вводит полное имя"
                       aria-describedby="inputGroup-sizing-default"
                       name="fullName" id="fullName" required>
            </div>
            <label for="email" class="mb-1">
                E-mail:
            </label>
            <div class="mb-0">
                <input type="email" class="form-control" aria-label="Вводит e-mail"
                       aria-describedby="inputGroup-sizing-default"
                       name="email" id="email" required>
            </div>
            <%
                if(request.getParameter("errorEmail")!=null){
            %>
                <div id="emailHelp" class="form-text text-danger">user with this email is already registered</div>
            <%
                }
            %>
            <label for="password" class="mt-3 mb-1">
                Password:
            </label>
            <div class="mb-3">
                <input type="password" class="form-control" aria-label="Вводит password"
                       aria-describedby="inputGroup-sizing-default"
                       name="password" id="password" required>
            </div>
            <label for="repeatPassword" class="mb-1">
                Repeat your password:
            </label>
            <div class="mb-0">
                <input type="password" class="form-control" aria-label="Вводит password"
                       aria-describedby="inputGroup-sizing-default"
                       name="repeatPassword" id="repeatPassword" required>
            </div>
            <%
                if(request.getParameter("errorPassword")!=null){
            %>
                <div id="emailHelp" class="mb-0 form-text text-danger">Passwords are not same</div>
            <%
                }
            %>
            <div class=" mt-3 modal-footer d-flex justify-content-evenly">
                <a href="/home" class="btn btn-secondary" data-bs-dismiss="modal">
                    Закрыть
                </a>
                <button class="btn btn-primary">Registr</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
