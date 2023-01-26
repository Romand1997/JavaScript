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
                    <a class="nav-link active" aria-current="page" href="/AdminPanelServlet">AdminPanel</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <% ArrayList <Item> itemsInCart = (ArrayList<Item>) request.getSession().getAttribute("itemsForCart");
                        if (itemsInCart!=null){
                    %>
                    <a class="nav-link active" href="/CartServlet"><%="Cart ("+itemsInCart.size()+" items)"%></a>
                    <%
                        } else {
                    %>
                    <a class="nav-link active" href="/CartServlet">Cart</a>
                    <%
                        }
                    %>
                </li>
                <%
                        }
                    }
                    if (user==null) {
                %>
                <li class="nav-item">
                    <% ArrayList <Item> itemsInCart = (ArrayList<Item>) request.getSession().getAttribute("itemsForCart");
                        if (itemsInCart!=null){
                    %>
                    <a class="nav-link active" href="/CartServlet"><%="Cart ("+itemsInCart.size()+" items)"%></a>
                    <%
                    } else {
                    %>
                    <a class="nav-link active" href="/CartServlet">Cart</a>
                    <%
                        }
                    %>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/LoginServlet">SignIn</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link active" href="/ProfileServlet">Profile/<%=user.getFullName()%></a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>

<%--<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">--%>
<%--    <div class="offcanvas-header">--%>
<%--        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Закрыть"></button>--%>
<%--    </div>--%>
<%--    <div class="offcanvas-body">--%>
<%--        <ul class="nav flex-column">--%>
<%--            <li><%@include file="addItem.jsp"%></li>--%>
<%--            <li class="nav-item dropend">--%>
<%--                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" aria-expanded="true" style="width: 10rem">Adding</a>--%>
<%--                <ul class="dropdown-menu">--%>
<%--&lt;%&ndash;                    <li><%@include file="addItem.jsp"%></li>&ndash;%&gt;--%>
<%--                    <li><%@include file="addBrand.jsp"%></li>--%>
<%--                    <li><%@include file="addCategory.jsp"%></li>--%>

<%--                </ul>--%>
<%--            </li>--%>
<%--            <li class="nav-item dropend">--%>
<%--                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" aria-expanded="false" style="width: 10rem">Adding</a>--%>
<%--                <ul class="dropdown-menu">--%>
<%--                    <li><a class="dropdown-item" href="#">Действие</a></li>--%>
<%--                    <li><a class="dropdown-item" href="#">Другое действие</a></li>--%>
<%--                    <li><a class="dropdown-item" href="#">Что-то еще здесь</a></li>--%>
<%--                    <li><hr class="dropdown-divider"></li>--%>
<%--                    <li><a class="dropdown-item" href="#">Отделенная ссылка</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--        </ul>--%>

<%--    </div>--%>
<%--</div>--%>



<%--        <div class="dropdown mt-3">--%>
<%--            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                Ссылка выпадающего списка--%>
<%--            </a>--%>
<%--            <ul class="dropdown-menu">--%>
<%--                <li><a class="dropdown-item" href="#">Действие</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Другое действие</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Что-то еще здесь</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="dropdown mt-3">--%>
<%--            <a class="btn btn-secondary dropdown-toggle" href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                Ссылка выпадающего списка--%>
<%--            </a>--%>
<%--            <ul class="dropdown-menu">--%>
<%--                <li><a class="dropdown-item" href="#">Действие</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Другое действие</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Что-то еще здесь</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>

    </div>
</div>








<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<nav class="navbar navbar-expand-lg bg-light">--%>
<%--    <div class="container-fluid d-flex justify-content-beetwen">--%>
<%--        <div class=" d-flex">--%>
<%--            <a class="navbar-brand" href="/home">BitLab Shop</a>--%>
<%--            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            </button>--%>
<%--            <div class="collapse navbar-collapse" id="navbarScroll">--%>
<%--                <ul class="navbar-nav  my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" aria-current="page" href="/home">Home</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">New Sales</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item dropdown">--%>
<%--                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                            By Category--%>
<%--                        </a>--%>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <%--%>
<%--                               ArrayList <Category> categories = (ArrayList<Category>) request.getAttribute("categories");--%>
<%--                               if (categories!=null){--%>
<%--                                   for (Category category : categories){--%>
<%--                            %>--%>
<%--                            <li>--%>
<%--                                <a class="dropdown-item" href="/ItemsbyCategoryServlet?category=<%=category.getId()%>">--%>
<%--                                    <%=category.getNameOfCategory()%>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <%--%>
<%--                                  }--%>
<%--                                }--%>
<%--                            %>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="d-flex navbar-expand">--%>
<%--            <ul class="navbar-nav  my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">--%>

<%--                <%  User user = (User) request.getSession().getAttribute("user");--%>
<%--                    if (user!=null){--%>
<%--                        if (user.getEmail().equals("admin@gmail.com")){--%>
<%--                %>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="/AdminPanelServlet">Admin panel</a>--%>
<%--                </li>--%>
<%--&lt;%&ndash;                <%@include file="adminPanelList.jsp"%>&ndash;%&gt;--%>
<%--                <%--%>
<%--                        } else {--%>
<%--                %>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="/AdminPanelServlet">Cart</a>--%>
<%--                </li>--%>
<%--                <%--%>
<%--                        }--%>
<%--                    }--%>
<%--                    if (user==null) {--%>
<%--                %>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="/AdminPanelServlet">Cart</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="/LoginServlet">SignIn</a>--%>
<%--                </li>--%>
<%--                <%--%>
<%--                } else {--%>
<%--                %>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="/LoginServlet">Logout/<%=user.getFullName()%></a>--%>
<%--                </li>--%>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

