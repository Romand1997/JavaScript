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
import java.util.spi.AbstractResourceBundleProvider;

@WebServlet(name = "BrandAdminServlet", value = "/BrandAdminServlet")
public class BrandAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user!=null){
            if (user.getEmail().equals("admin@gmail.com")){
                request.setAttribute("items", ItemManager.getAllItems());
                request.setAttribute("brands", BrandManager.getAllBrands());
                request.setAttribute("categories", CategoryManager.getAllcategories());
                if (request.getParameter("idOfBrand")!=null) {
                    Brand brand = BrandManager.getBrandById(Integer.parseInt(request.getParameter("" +
                            "idOfBrand")));
                    request.setAttribute("detailsOfBrand", brand);
                }
                request.getRequestDispatcher("/JSP/viewAllBrands.jsp").forward(request,response);
            } else response.sendRedirect("/home");
        } else response.sendRedirect("/home");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user!=null&&user.getEmail().equals("admin@gmail.com")) {
            try {
                if (request.getParameter("flag")!=null) {
                    Brand brand = new Brand();
                    brand.setName(request.getParameter("nameOfBrand"));
                    brand.setCountry(request.getParameter("country"));
                    BrandManager.addBrand(brand);
                } else if (request.getParameter("idOfBrandForUpdate")!=null){
                    Brand brand = new Brand();
                    brand.setId(Integer.parseInt(request.getParameter("idOfBrandForUpdate")));
                    brand.setName(request.getParameter("nameOfBrand"));
                    brand.setCountry(request.getParameter("country"));
                    BrandManager.updateBrand(brand);
                } else if(request.getParameter("idOfBrandForDelete")!=null){
                    BrandManager.deleteBrand(Integer.parseInt(request.getParameter("idOfBrandForDelete")));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("/BrandAdminServlet");
        } else response.sendRedirect("/home");
    }
}
