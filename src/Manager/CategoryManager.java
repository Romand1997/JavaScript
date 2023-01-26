package Manager;

import java.sql.*;
import java.util.ArrayList;
import java.util.EmptyStackException;

import Class.*;

public class CategoryManager {
    public static void deleteCategory(int id){
        try { PreparedStatement statement = connection.prepareStatement("" +
                "delete from categories where id =?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static  void updateCategory(Category category){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "update categories set nameofcategory = ? " +
                    "where id = ?");
            statement.setString(1, category.getNameOfCategory());
            statement.setInt(2, category.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void addCategory(Category category){
        try {PreparedStatement statement = connection.prepareStatement("" +
                "insert into categories (nameofcategory) values (?)");
            statement.setString(1, category.getNameOfCategory());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static Category getCategoryById(int id){
        Category category = new Category();
        try { PreparedStatement statement  = connection.prepareStatement("" +
                "select * from categories where id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                category.setId(id);
                category.setNameOfCategory(resultSet.getString("nameofcategory"));
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return category;
    }
    public static ArrayList<Category> getAllcategories(){
        ArrayList<Category> categories = new ArrayList();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * from categories ORDER BY nameofcategory");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setNameOfCategory(resultSet.getString("nameofcategory"));
                categories.add(category);
            }
        } catch (Exception e){
           e.printStackTrace();
        }
        return categories;
    }

    private static Connection connection;
    static {
        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/newDatabase",
                    "postgres", "postgres");
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
