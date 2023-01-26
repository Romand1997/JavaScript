package Servlets;

import Class.*;
import Manager.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ItemAdminServlet", value = "/ItemAdminServlet")
public class ItemAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null && user.getEmail().equals("admin@gmail.com")) {
            request.setAttribute("items", ItemManager.getAllItems());
            request.setAttribute("brands", BrandManager.getAllBrands());
            request.setAttribute("categories", CategoryManager.getAllcategories());
            if (request.getParameter("idOfItem") != null) {
                System.out.println("yes");
                Item item = ItemManager.getItemById(Integer.parseInt(request.getParameter("" +
                        "idOfItem")));
                request.setAttribute("detailsOfItem", item);
            }
            request.getRequestDispatcher("/JSP/viewAllItems.jsp").forward(request, response);
        }
        else response.sendRedirect("/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null && user.getEmail().equals("admin@gmail.com")) {
            try {
                if (request.getParameter("flag") != null) {
                    Item item = new Item();
                    item.setName(request.getParameter("name"));
                    String idOfCategory = request.getParameter("category");
                    item.setCategory(CategoryManager.getCategoryById(Integer.parseInt(idOfCategory)));
                    String idOfBrand = request.getParameter("brand");
                    item.setBrand((BrandManager.getBrandById(Integer.parseInt(idOfBrand))));
                    String price = request.getParameter("price");
                    item.setPrice(Double.parseDouble(price));
                    item.setDescription(request.getParameter("description"));
                    item.setUser((User) request.getSession().getAttribute("user"));
                    ItemManager.addItem(item);
                } else if (request.getParameter("idOfItemForUpdate") != null) {
                    Item item = null;
                    Category category = null;
                    Brand brand = null;
                    item = new Item();
                    brand = new Brand();
                    category = new Category();
                    item.setId(Long.parseLong(request.getParameter("idOfItemForUpdate")));
                    item.setName(request.getParameter("name"));
                    if (request.getParameter("brand") != null) {
                        brand = BrandManager.getBrandById(Integer.parseInt(request.getParameter("" +
                                "brand")));
                    }
                    if (request.getParameter("category") != null) {
                        category = CategoryManager.getCategoryById(Integer.parseInt(request.getParameter("" +
                                "category")));
                    }
                    item.setBrand(brand);
                    item.setCategory(category);
                    item.setPrice(Double.parseDouble(request.getParameter("price")));
                    item.setDescription(request.getParameter("description"));
                    ItemManager.updateItem(item);
                } else if (request.getParameter("idOfItemForDelete") != null) {
                    ItemManager.deleteItem(Integer.parseInt(request.getParameter("idOfItemForDelete")));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("/ItemAdminServlet");
        } else
            response.sendRedirect("/home");
    }
}
