<div class="content d-flex justify-content-center">
    <div class="card" style="width: 18rem;">
        <div class="d-flex justify-content-center">
        <h5 class="modal-title" id="exampleModalLabel">Login Page</h5>
        </div>
        <form method="post" action="/home">
            <div class="container" input-group>
                <label for="emailOfInput" class="mt-3 mb-1">
                    Email
                </label>
                <div >
                    <input type="text" class="form-control" aria-label="Вводит e-mail"
                           aria-describedby="emailHelp"
                           name="email" id="emailOfInput" required>
                </div>
                <% if(request.getParameter("errorEmail")!=null){
                %>
                    <div id="emailHelp" class="form-text text-danger">Incorrect email</div>
                <%
                    }
                %>

                <label for="passwordOfInput" class="mt-3 mb-1">
                    Password
                </label>
                <div>
                    <input type="password" class="form-control" aria-label="Вводит password"
                           aria-describedby="PasswordHelp"
                           name="password" id="passwordOfInput" required>
                </div>
                <% if(request.getParameter("errorPassword")!=null){
                %>
                    <div id="PasswordHelp" class="form-text text-danger">Incorrect password</div>
                <%
                    }
                %>
            </div>
            <div class=" d-flex justify-content-evenly mt-3">
                <a href="/home" class="ps-4 pe-4 btn btn-secondary">
                    Close
                </a>
                <button class="ps-4 pe-4 btn btn-success">Login</button>
            </div>
            <div class="mt-1 text-center">
                <a href="/RegistrationServlet">Registration</a>
            </div>
        </form>
    </div>
</div>