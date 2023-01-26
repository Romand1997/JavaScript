<%@ page import="java.util.ArrayList" %>
<%@ page import="Class.*" %>
<%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 09.12.2022
  Time: 21:36
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
    Item item = (Item) request.getAttribute("itemForDetails");
    if (item != null) {
%>
<div class="container">
    <div class="d-flex justify-content-center">
        <div>
            <div class="mt-4 col-4">
                <div class="card text-center" style="width: 60rem;">
                    <div class="card-header">
                        <h5 class="card-title"><%=item.getName() + " $" + item.getPrice()%>
                        </h5>
                    </div>
                    <div class="card-body pb-0">
                        <form action="/CartServlet" method="post">
                            <input type="hidden" name="idOfItemForCart" value="<%=item.getId()%>">
                            <button href="#" class="ps-5 pe-5 btn btn-success">Buy Now</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="mt-2">
                <div class="card" style="width: 60rem;">
                    <div class="card-header bg-white">
                        <h4>characteristics of <%=item.getName()%></h4>
                    </div>
                    <div class="card-body">

                    </div>
                </div>
            </div>
            <div class="mt-2">
                <div class="card" style="width: 60rem;">
                    <div class="card-header bg-white">
                        <h4>Description</h4>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><%=item.getDescription()%>
                        </p>
                    </div>
                </div>
            </div>
            <div class="mt-2">
                <div class="card" style="width: 60rem;">
                    <div class="card-header bg-white d-flex justify-content-between">
                        <h4>Reviews</h4>
                        <% if (session.getAttribute("user")!=null)
                            {
                        %>
                        <div>
                            <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addReview">
                                Add new review
                            </a>
                            <!-- Модальное окно -->
                            <div class="modal fade" id="addReview" tabindex="-1" aria-labelledby="addReviewLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addCategoryLabel">Add your review</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container" input-group>
                                                <form action="/DetailsOfItemServlet" method="post">
                                                    <div class="mb-3">
                                                        <input type="hidden" name="addingReview">
                                                        <input type="hidden" name="idOfItemForReview" value="<%=item.getId()%>">
                                                        <textarea class="form-control" aria-label="Вводит отзыв"
                                                                  name="content"
                                                                  id="content"></textarea>
                                                    </div>
                                                    <div class="modal-footer d-flex justify-content-evenly">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                            Закрыть
                                                        </button>
                                                        <button class="btn btn-success">Add</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        if (request.getAttribute("reviews")==null){
                    %>
                    <%
                        } else {
                            ArrayList <Review> reviews = (ArrayList<Review>) request.getAttribute("reviews");
                            for (Review review : reviews){
                    %>
                    <div class="card-body">
                        <div class="mt-2">
                            <div class="card mb-3" style="width: 58rem;">
                                <div class="card-header bg-white">
                                    <h6><%=review.getUser().getFullName()%> at <%=review.getDateOfPublic()%></h6>
                                </div>
                                <div class="card-body">
                                    <%=review.getContent()%>
                                </div>
                                <%
                                    if (session.getAttribute("user")!=null){
                                    if (review.getUser().getEmail().
                                            equals(((User) session.getAttribute("user")).getEmail())||
                                            ((User) session.getAttribute("user")).getEmail().equals("admin@gmail.com")){
                                %>
                                <div class="d-flex justify-content-end mb-0 me-3">
                                    <div class="me-3">
                                    <!-- Кнопка-триггер модального окна -->
                                    <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#confirmDelete<%=review.getId()%>">
                                        Delete
                                    </button>
                                        <!-- Модальное окно -->
                                    <div class="modal fade" id="confirmDelete<%=review.getId()%>" tabindex="-1"
                                         aria-labelledby="confirmDeleteLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    You want to delete your review? </br>
                                                    Are You Shure?
                                                </div>
                                                <div class="modal-footer d-flex justify-content-evenly">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                                                    <form class="me-3" action="/DetailsOfItemServlet" method="post">
                                                        <input type="hidden" name="idOfItemForReview" value="<%=item.getId()%>">
                                                        <input type="hidden" name="idOfReviewForDelete" value="<%=review.getId()%>">
                                                        <button class="btn btn-danger">Delete</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="ms-3 me-3">
                                    <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#confirmReview<%=review.getId()%>">
                                        Edit
                                    </button>
                                    <!-- Модальное окно -->
                                        <form class="me-3" action="/DetailsOfItemServlet" method="post">
                                            <div class="modal fade" id="confirmReview<%=review.getId()%>" tabindex="-1"
                                                 aria-labelledby="confirmReviewLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <div class="container" input-group>
                                                                <div class="mb-3">
                                                                    <textarea class="form-control" aria-label="Вводит содержание отзыва"
                                                                           aria-describedby="inputGroup-sizing-default"
                                                                           name="contentOfReview" id="contentOfReview" required><%=review.getContent()%>
                                                                    </textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer d-flex justify-content-evenly">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                                                            <input type="hidden" name="idOfItemForReview" value="<%=item.getId()%>">
                                                            <input type="hidden" name="idOfReviewForEdit" value="<%=review.getId()%>">
                                                            <button class="btn btn-success">Save Editing</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
<%--                                    <form  class="ms-3" action="/DetailsOfItemServlet" method="post">--%>
<%--                                        <input type="hidden" name="idOfReviewForEdit" value="<%=review.getId()%>">--%>
<%--                                        <button class="dropdown-item">edit</button>--%>
<%--                                    </form>--%>
                                </div>
                                <%
                                    }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        }
                    %>
                </div>
            </div>

        </div>
    </div>
</div>
<%
    }
%>
</body>
</html>
