package Servlets;
import Class.*;
import Manager.CategoryManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories = CategoryManager.getAllcategories();    //для поиска по категориям в навбаре
        if (categories!=null)                                                   //
            request.setAttribute("categories", categories);                  //
        request.getRequestDispatcher("/JSP/signinwindow.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")!=null) {
            request.getSession().removeAttribute("user");
        }
        if (request.getSession().getAttribute("itemsForCart")!=null) {
            request.getSession().removeAttribute("itemsForCart");
        }
        response.sendRedirect("/home");
    }
}
