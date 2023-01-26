package Servlets;

import Class.*;
import Manager.CategoryManager;
import Manager.ItemManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories = CategoryManager.getAllcategories();    //для поиска по категориям в навбаре
        if (categories!=null)                                                   //
            request.setAttribute("categories", categories);                  //
        request.getRequestDispatcher("/JSP/Cart.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Item> items = new ArrayList<Item>();
        if (request.getParameter("idOfItemForDelete")!=null){
            items = (ArrayList<Item>) request.getSession().getAttribute("itemsForCart");
            items.remove(Integer.parseInt(request.getParameter("idOfItemForDelete")));
            request.getSession().setAttribute("itemsForCart", items);
            response.sendRedirect("/CartServlet");
        } else {
            if (request.getSession().getAttribute("itemsForCart") != null) {
                items = (ArrayList<Item>) request.getSession().getAttribute("itemsForCart");
                if (request.getParameter("idOfItemForCart") != null)
                    items.add(ItemManager.getItemById(Integer.parseInt(request.getParameter("idOfItemForCart"))));
            } else {
                if (request.getParameter("idOfItemForCart") != null)
                    items.add(ItemManager.getItemById(Integer.parseInt(request.getParameter("idOfItemForCart"))));
            }
            request.getSession().setAttribute("itemsForCart", items);
            response.sendRedirect("/home");
        }
    }
}
