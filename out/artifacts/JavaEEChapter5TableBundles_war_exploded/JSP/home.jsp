<%@ page import="java.util.ArrayList"%>
<%@ page import="Class.*"%><%--
  Created by IntelliJ IDEA.
  User: danov
  Date: 30.11.2022
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <title>Shop</title>
</head>
<body>

    <%@include file="NavBar.jsp"%>

    <div class=" d-flex justify-content-center">
        <div class="col-8 text-center">
            <%
                if(request.getParameter("successfuly")!=null){
            %>
            <h1 class="text-success">Registration completed successfully</h1>
            <%
                }
            %>
            <h1> Welcome to BITLAB SHOP</h1>
            <h6 class="nav-link"> Electronic devices with high quality and service</h6>
            <div class="row text-center">
                <% ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
                if (items!=null){
                    for (Item item :items){
                %>
                    <div class="mt-3 mb-3 d-flex justify-content-center col-4">
                        <a href="DetailsOfItemServlet?idOfItemForDetails=<%=item.getId()%>"
                           style="text-decoration: none; color: black">
                            <div class="card text-center" style="width: 18rem;">
                                <div class="card-header">
                                    <h5 class="card-title"><%=item.getName()+" ("+item.getBrand().getName()+
                                            " "+item.getBrand().getCountry()+")"%></h5>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">$<%=item.getPrice()%></h5>
                                    <p class="card-text"><%=item.getDescription()%></p>
                                    <form action="/CartServlet" method="post">
                                        <input type="hidden" name="idOfItemForCart" value="<%=item.getId()%>">
                                    <button href="#" class="btn btn-success">Buy Now</button>
                                    </form>
                                </div>
                            </div>
                        </a>
                    </div>
                <%
                    }
                } else {
                %>
                <h2 class="text-danger">ERROR OF DATABASE</h2><br>
                <h2 class="text-danger">TRY TO BACK TO HOME PAGE</h2>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    </div>
    </div>
</body>
</html>
