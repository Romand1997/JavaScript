<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 07.12.2022
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid d-flex justify-content-between">
        <div class="d-flex">
            <a class="navbar-brand" href="/home">Bitlab Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Переключатель навигации">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/home">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Search By Category
                        </a>
                        <ul class="dropdown-menu">
                            <%
                                ArrayList <Category> categories = (ArrayList<Category>) request.getAttribute("categories");
                                if (categories!=null){
                                    for (Category category : categories){
                            %>
                            <li>
                                <a class="dropdown-item" href="/ItemsbyCategoryServlet?category=<%=category.getId()%>">
                                    <%=category.getNameOfCategory()%>
                                </a>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="d-flex navbar-expand">
            <ul class="navbar-nav">
                <%  User user = (User) request.getSession().getAttribute("user");
                    if (user!=null){
                        if (user.getEmail().equals("admin@gmail.com")){
                %>
                    <li class="nav-item">
                        <a class="nav-link active" data-bs-toggle="offcanvas"
                           href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                            Admin Panel
                        </a>
                    </li>
                <%
                        } else {
                %>
                    <li class="nav-item">
                        <a class="nav-link active" href="/AdminPanelServlet">Cart</a>
                    </li>
                <%
                        }
                    }
                    if (user==null) {
                %>
                    <li class="nav-item">
                        <a class="nav-link active" href="/AdminPanelServlet">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/LoginServlet">SignIn</a>
                    </li>
                <%
                    } else {
                %>
                    <li class="nav-item">
                        <a class="nav-link active" href="/LoginServlet">Logout/<%=user.getFullName()%></a>
                    </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>




<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Закрыть"></button>
    </div>
    <div class="offcanvas-body">
        <div>
            Какой-то текст в качестве заполнителя. В реальной жизни у вас могут быть элементы, которые Вы выбрали. Нравится, текст, изображения, списки и т. д.
        </div>
        <div class="dropdown mt-3">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
                Кнопка раскрывающегося списка
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <li><a class="dropdown-item" href="#">Действие</a></li>
                <li><a class="dropdown-item" href="#">Другое действие</a></li>
                <li><a class="dropdown-item" href="#">Что-то еще здесь</a></li>
            </ul>
        </div>
    </div>
</div>