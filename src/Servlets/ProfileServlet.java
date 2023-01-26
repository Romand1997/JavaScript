package Servlets;

import Class.*;
import Manager.CategoryManager;
import Manager.UserManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories = CategoryManager.getAllcategories();    //для поиска по категориям в навбаре
        if (categories!=null)                                                   //
            request.setAttribute("categories", categories);                  //
        if (request.getSession().getAttribute("user")!=null){
            request.getRequestDispatcher("/JSP/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String redirect = "/ProfileServlet?successfuly";
        if (user !=null){
            if (request.getParameter("fullName")!=null){
                user.setFullName(request.getParameter("fullName"));
                UserManager.updateUserFullname(user);
            } else if(request.getParameter("email")!=null){
                if (UserManager.searchUserByEmailAndPassword(request.getParameter("email"))==null){
                    user.setEmail(request.getParameter("email"));
                    UserManager.updateUserEmail(user);
                } else {
                    redirect = "/ProfileServlet?editEmail&errorEmail";
                }

            } else if(request.getParameter("oldPassword")!=null&&
                    request.getParameter("newPassword")!=null&&
                    request.getParameter("repeatNewPassword")!=null){
                if (request.getParameter("oldPassword").equals(user.getPassword())){
                    if (request.getParameter("newPassword").equals(request.getParameter("repeatNewPassword"))){
                        user.setPassword(request.getParameter("newPassword"));
                        UserManager.updateUserPassword(user);
                    } else {
                        redirect = "/ProfileServlet?editPassword&passwordsNotSame";
                    }
                } else {
                    redirect = "/ProfileServlet?editPassword&errorOldPassword";
                }
            }
            response.sendRedirect(redirect);
        } else {
            response.sendRedirect("/home");
        }
    }
}
