<%@page import="Class.*" %>
<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 02.12.2022
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<%@include file="NavBar.jsp"%>
<div class="conteiner mt-5">
<%--    <% User user = (User) session.getAttribute("user");--%>
<%--        String flag = (String) request.getAttribute("flag");--%>
<%--        if (user!=null){--%>
<%--    %>--%>
<%--        <h2>Hello <%=user.getFullName()%>--%>
<%--        </h2>--%>
<%--    <%--%>
<%--        } else if (flag!=null){--%>
<%--    %>--%>
<%--    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">--%>
<%--        <strong>Wrong Password or Email!</strong> Вам следует проверить некоторые из этих полей ниже:--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Закрыть"></button>--%>
<%--    </div>--%>
    <%
    if (user!=null){
    %>
    <div class="content d-flex justify-content-center">
        <div class="card" style="width: 18rem;">
            <div class="d-flex justify-content-center">
                <h5 class="mt-2"><%=user.getFullName()%></h5>
            </div>
            <form method="post" action="/LoginServlet">
                <div class="container" input-group>
                    <label for="emailOfInput" class="mt-3 mb-1">
                        Email
                    </label>
                    <div >
                        <input type="email" class="form-control" aria-label="Вводит e-mail"
                               aria-describedby="emailHelp"
                               name="email" id="emailOfInput" value="<%=user.getEmail()%>" required>
                    </div>

                    <label for="passwordOfInput" class="mt-3 mb-1">
                        Password
                    </label>
                    <div>
                        <input type="password" class="form-control" aria-label="Вводит password"
                               aria-describedby="PasswordHelp"
                               name="password" id="passwordOfInput">
                    </div>

                </div>
                <div class="d-flex justify-content-evenly mt-3">
                    <a href="/home" class="btn btn-secondary">
                        Close
                    </a>
                    <button class="btn btn-warning">Logout</button>
                </div>
            </form>
        </div>
    </div>
    <%
    } else{
    %>
    <%@include file="CardSignIn.jsp"%>
    <%
    }
    %>

<%--    <%--%>
<%--        } else {--%>
<%--    %>--%>
<%--    <%@include file="CardSignIn.jsp"%>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
</div>
</body>
</html>
