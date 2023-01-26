package Manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Class.*;

public class BrandManager {
    public static void deleteBrand(int id){
        try { PreparedStatement statement = connection.prepareStatement("" +
                "delete from brands where id =?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void updateBrand(Brand brand){
        try {PreparedStatement statement = connection.prepareStatement("" +
                "update brands set name = ?, country = ? " +
                "where id = ? ");
            statement.setString(1, brand.getName());
            statement.setString(2, brand.getCountry());
            statement.setInt(3, brand.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void addBrand(Brand brand){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "Insert Into brands (name, country) values (?, ?)");
            statement.setString(1, brand.getName());
            statement.setString(2, brand.getCountry());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static Brand getBrandById(int id){
            Brand brand = new Brand();
            try { PreparedStatement statement  = connection.prepareStatement("" +
                "select * from brands where id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                brand.setId(id);
                brand.setName(resultSet.getString("name"));
                brand.setCountry(resultSet.getString("country"));
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return brand;
    }
    public static ArrayList<Brand> getAllBrands(){
        ArrayList <Brand> brands = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from brands order by name");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Brand brand = new Brand();
                brand.setId(resultSet.getInt("id"));
                brand.setName(resultSet.getString("name"));
                brand.setCountry(resultSet.getString("country"));
                brands.add(brand);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return brands;
    }
    private static Connection connection;
    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection= DriverManager.getConnection("jdbc:postgresql://localhost:5432/newDatabase",
                    "postgres", "postgres");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

}
