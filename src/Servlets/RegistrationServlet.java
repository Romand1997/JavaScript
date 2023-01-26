package Servlets;

import Class.*;
import Manager.UserManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RegistrationServlet", value = "/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/JSP/registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user")==null){
            User user = new User();
            try{ String email = request.getParameter("email");
                String fullName = request.getParameter("fullName");
                String password = request.getParameter("password");
                String repeatPassword = request.getParameter("repeatPassword");
                if (UserManager.searchUserByEmailAndPassword(email)==null){
                   if (password.equals(repeatPassword)){
                       user.setEmail(email);
                       user.setFullName(fullName);
                       user.setPassword(password);
                       UserManager.addUser(user);
                       request.getSession().setAttribute("user", UserManager.searchUserByEmailAndPassword(email));
                       response.sendRedirect("/home?successfuly");
                   } else {
                       response.sendRedirect("/RegistrationServlet?errorPassword");
                   }
                } else {
                    response.sendRedirect("/RegistrationServlet?errorEmail");
                }

            } catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
