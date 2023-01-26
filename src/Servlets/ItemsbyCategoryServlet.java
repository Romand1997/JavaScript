package Servlets;
import Class.*;
import Manager.CategoryManager;
import Manager.ItemManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ItemsbyCategoryServlet", value = "/ItemsbyCategoryServlet")
public class ItemsbyCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("category");
        ArrayList<Item> items = new ArrayList<Item>();
        try {
            items = ItemManager.getItemsByIdOfCategory(Integer.parseInt(id));
        } catch (Exception e){
            e.printStackTrace();
        }
        ArrayList <Category> categories = CategoryManager.getAllcategories();
        if (categories!=null)
            request.setAttribute("categories", categories);
        if (items!=null)
            request.setAttribute("items", items);
        request.getRequestDispatcher("/JSP/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
