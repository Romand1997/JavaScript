package Servlets;

import Manager.*;
import Class.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Item> items = ItemManager.getAllItems();
        if (items!=null)
            request.setAttribute("items", items);
        ArrayList<Category> categories = CategoryManager.getAllcategories();    //для поиска по категориям в навбаре
        if (categories!=null)                                                   //
            request.setAttribute("categories", categories);                  //
        request.getRequestDispatcher("/JSP/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        User user = UserManager.searchUserByEmailAndPassword(email);
       if (user!=null) {
           if (user.getPassword().equals(password)) {
               request.getSession().setAttribute("user", user);
               response.sendRedirect("/home");
           } else {
               response.sendRedirect("/LoginServlet?errorPassword");
           }
       } else {
           response.sendRedirect("/LoginServlet?errorEmail");
       }
    }
}
