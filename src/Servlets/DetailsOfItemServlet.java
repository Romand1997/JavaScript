package Servlets;

import Class.*;
import Manager.CategoryManager;
import Manager.ItemManager;
import Manager.ReviewManager;
import Manager.UserManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DetailsOfItemServlet", value = "/DetailsOfItemServlet")
public class DetailsOfItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories = CategoryManager.getAllcategories();    //для поиска по категориям в навбаре
        if (categories != null)                                                   //
            request.setAttribute("categories", categories);                  //
        if (request.getParameter("idOfItemForDetails") != null) {
            Item item = ItemManager.getItemById(Integer.parseInt(request.getParameter("idOfItemForDetails")));
            request.setAttribute("itemForDetails", item);
            ArrayList<Review> reviews = ReviewManager.getReviewsByIdOfItem
                    (Integer.parseInt(request.getParameter("idOfItemForDetails")));
            request.setAttribute("reviews", reviews);
        }
        request.getRequestDispatcher("/JSP/detailsOfItem.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            try {
                if (request.getParameter("addingReview") != null && request.getParameter("content") != null) {
                    Review review = new Review();
                    review.setContent(request.getParameter("content"));
                    review.setIdOfItem(Integer.parseInt(request.getParameter("idOfItemForReview")));
                    User user = new User();
                    user.setId(((User) request.getSession().getAttribute("user")).getId());
                    review.setUser(user);
                    ReviewManager.addReview(review);
                } else if (request.getParameter("idOfReviewForEdit") != null) {
                    if (ReviewManager.getReviewById(Integer.parseInt(request.getParameter("idOfReviewForEdit")))
                            .getUser().getEmail().equals(((User) request.getSession().getAttribute("user")).getEmail())     //узнаём пользователь который пытается изменить отзыв и пользователь который
                            || ((User) request.getSession().getAttribute("user")).getEmail().equals("admin@gmail.com")) {  // оставил этот отзыв один и тот же человек или нет
                        Review review = new Review();
                        review.setId(Integer.parseInt(request.getParameter("idOfReviewForEdit")));
                        review.setContent(request.getParameter("contentOfReview"));
                        ReviewManager.updateReview(review);
                    }
                } else if (request.getParameter("idOfReviewForDelete") != null) {
                    if (ReviewManager.getReviewById(Integer.parseInt(request.getParameter("idOfReviewForDelete")))
                        .getUser().getEmail().equals(((User) request.getSession().getAttribute("user")).getEmail())     //узнаём пользователь который пытается изменить отзыв и пользователь который
                        || ((User) request.getSession().getAttribute("user")).getEmail().equals("admin@gmail.com")) {   // оставил этот отзыв один и тот же человек или нет
                        ReviewManager.deleteReviewById(Integer.parseInt(request.getParameter("idOfReviewForDelete")));
                    }
                }
                Item item = ItemManager.getItemById(Integer.parseInt(request.getParameter("idOfItemForReview")));
                request.setAttribute("itemForDetails", item);
                ArrayList<Review> reviews = ReviewManager.getReviewsByIdOfItem
                        (Integer.parseInt(request.getParameter("idOfItemForReview")));
                request.setAttribute("reviews", reviews);
                ArrayList<Category> categories = CategoryManager.getAllcategories();    //для поиска по категориям в навбаре
                if (categories != null)                                                   //
                    request.setAttribute("categories", categories);                  //
                request.getRequestDispatcher("/JSP/detailsOfItem.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
