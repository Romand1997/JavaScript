package Manager;

import Class.*;

import java.nio.file.attribute.UserPrincipalLookupService;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserManager {
    public  static void updateUserFullname(User user){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "update users set name = ? where id = ?");
            statement.setString(1, user.getFullName());
            statement.setLong(2, user.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public  static void updateUserEmail(User user){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "update users set email = ? where id = ?");
            statement.setString(1, user.getEmail());
            statement.setLong(2, user.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public  static void updateUserPassword(User user){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "update users set password = ? where id = ?");
            statement.setString(1, user.getPassword());
            statement.setLong(2, user.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void addUser(User user){
        try{
            PreparedStatement statement = connection.prepareStatement(" " +
                    "insert into users (name, email, password) values (?, ?, ?)");
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static User getUserById(int id){
        User user=null;
        try{
            PreparedStatement statement = connection.prepareStatement(" " +
                    "SELECT * FROM users WHERE id=?");
            statement.setLong(1, id);
            ResultSet resultSet =statement.executeQuery();
            if(resultSet.next()){
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setFullName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public static User searchUserByEmailAndPassword(String email){
        User user=null;
        try{
            PreparedStatement statement = connection.prepareStatement(" " +
                    "SELECT * FROM users WHERE email=?");
            statement.setString(1, email);
            ResultSet resultSet =statement.executeQuery();
            if(resultSet.next()){
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setFullName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    private static Connection connection;
    static {
        try{
            Class.forName("org.postgresql.Driver");
            connection= DriverManager.getConnection("jdbc:postgresql://localhost:5432/newDatabase",
                    "postgres", "postgres");
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
