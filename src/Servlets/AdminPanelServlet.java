package Servlets;

import Class.Brand;
import Class.Category;
import Class.Item;
import Class.User;
import Manager.BrandManager;
import Manager.CategoryManager;
import Manager.ItemManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminPanelServlet", value = "/AdminPanelServlet")
public class AdminPanelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user!=null){
            if (user.getEmail().equals("admin@gmail.com")){
                request.setAttribute("items", ItemManager.getAllItems());
                request.setAttribute("brands", BrandManager.getAllBrands());
                request.setAttribute("categories", CategoryManager.getAllcategories());
                request.getRequestDispatcher("/JSP/AdminPanel.jsp").forward(request,response);
            } else response.sendRedirect("/home");

        } else response.sendRedirect("/home");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        if (user!=null) {
            switch (request.getParameter("flag")){

                case "item":
                    try{
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
                    } catch (Exception e){
                        e.printStackTrace();
                    }
                    break;
                case "brand":
                    try{
                        Brand brand = new Brand();
                        brand.setName(request.getParameter("nameOfBrand"));
                        brand.setCountry(request.getParameter("country"));
                        BrandManager.addBrand(brand);
                    } catch (Exception e){
                        e.printStackTrace();
                    }
                    break;
                case "category":
                    try{
                        Category category = new Category();
                        category.setNameOfCategory(request.getParameter("nameOfCategory"));
                        CategoryManager.addCategory(category);
                    } catch (Exception e){
                        e.printStackTrace();
                    }
                    break;
            }

            response.sendRedirect("/AdminPanelServlet");
        }
    }
}
