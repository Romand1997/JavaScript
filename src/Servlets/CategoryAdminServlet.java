package Servlets;

import Class.*;
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

@WebServlet(name = "CategoryAdminServlet", value = "/CategoryAdminServlet")
public class CategoryAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user!=null){
            if (user.getEmail().equals("admin@gmail.com")){
                request.setAttribute("items", ItemManager.getAllItems());
                request.setAttribute("brands", BrandManager.getAllBrands());
                request.setAttribute("categories", CategoryManager.getAllcategories());
                if (request.getParameter("idOfCategory")!=null) {
                    Category category = CategoryManager.getCategoryById(Integer.parseInt(request.getParameter("" +
                            "idOfCategory")));
                    request.setAttribute("detailsOfCategory", category);
                }
                request.getRequestDispatcher("/JSP/viewAllCategories.jsp").forward(request,response);
            } else response.sendRedirect("/home");
        } else response.sendRedirect("/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user!=null&&user.getEmail().equals("admin@gmail.com")) {
            try {
                if (request.getParameter("flag") != null) {
                    Category category = new Category();
                    category.setNameOfCategory(request.getParameter("nameOfCategory"));
                    CategoryManager.addCategory(category);
                } else if (request.getParameter("idOfCategoryForUpdate") != null) {
                    Category category = new Category();
                    category.setId(Integer.parseInt(request.getParameter("idOfCategoryForUpdate")));
                    category.setNameOfCategory(request.getParameter("nameOfCategory"));
                    CategoryManager.updateCategory(category);
                } else if (request.getParameter("idOfCategoryForDelete") != null) {
                    CategoryManager.deleteCategory(Integer.parseInt(request.getParameter("idOfCategoryForDelete")));
                }
            } catch (Exception e){
                e.printStackTrace();
            }
            response.sendRedirect("/CategoryAdminServlet");
        } else
            response.sendRedirect("/home");
    }
}
