package Manager;

import Class.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewManager {
    public static void deleteReviewById(int id){
        try { PreparedStatement statement = connection.prepareStatement("" +
                "delete from reviews where id = ?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static Review getReviewById(int id){
        Review review = new Review();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "select re.id, re.content, re.dateofpublic, it.id as idofitem, us.id as idofuser, " +
                    "us.name, us.email from reviews re " +
                    "inner join users us on re.idofuser = us.id " +
                    "inner join items it on re.idofitem = it.id " +
                    "where re.id = ? " +
                    "ORDER BY re.dateofpublic DESC ");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                review.setContent(resultSet.getString("content"));
                review.setId(resultSet.getInt("id"));
                review.setDateOfPublic(resultSet.getTimestamp("dateofpublic"));
                review.setIdOfItem(resultSet.getInt("idofitem"));
                User user = new User();
                user.setId(resultSet.getLong("idofitem"));
                user.setFullName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                review.setUser(user);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return review;
    }
    public static void updateReview(Review review){
        try { PreparedStatement statement = connection.prepareStatement("" +
                "update reviews set content = ? where id = ?");
            statement.setString(1, review.getContent());
            statement.setInt(2, review.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void addReview(Review review){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into reviews (idofuser, idofitem, content, dateofpublic) " +
                    "values (?, ?, ?, now())");
            statement.setLong(1, review.getUser().getId());
            statement.setInt(2, review.getIdOfItem());
            statement.setString(3, review.getContent());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<Review> getReviewsByIdOfItem(int id){
        ArrayList<Review> reviews = new ArrayList<Review>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "select re.id, re.content, re.dateofpublic, it.id as idofitem, us.id as idofuser, " +
                    "us.name, us.email from reviews re " +
                    "inner join users us on re.idofuser = us.id " +
                    "inner join items it on re.idofitem = it.id " +
                    "where it.id = ? " +
                    "ORDER BY re.dateofpublic DESC ");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Review review = new Review();
                review.setContent(resultSet.getString("content"));
                review.setId(resultSet.getInt("id"));
                review.setDateOfPublic(resultSet.getTimestamp("dateofpublic"));
                review.setIdOfItem(resultSet.getInt("idofitem"));
                User user = new User();
                user.setId(resultSet.getLong("idofitem"));
                user.setFullName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                review.setUser(user);
                reviews.add(review);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return reviews;
    }
    private static Connection connection;
    static {
        try { Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/newDatabase",
                    "postgres", "postgres");

        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
