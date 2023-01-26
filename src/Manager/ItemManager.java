package Manager;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Class.*;
public class ItemManager {
    public static void deleteItem(int id){
        try { PreparedStatement statement = connection.prepareStatement("" +
                "delete from items where id =?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void updateItem(Item item){
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "update items set name = ?, description = ?, price = ?, brand = ?, category= ? " +
                    "where id = ?");
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());
            statement.setInt(4, item.getBrand().getId());
            statement.setInt(5, item.getCategory().getId());
            statement.setLong(6, item.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<Item> getItemsByIdOfCategory(int id){
        ArrayList <Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "select * from items where category = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Item item =new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                Brand brand = BrandManager.getBrandById(resultSet.getInt("brand"));
                Category category = CategoryManager.getCategoryById(resultSet.getInt("category"));
                item.setCategory(category);
                item.setBrand(brand);
                items.add(item);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return items;
    }
    public static void addItem(Item item){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO items (name, description, price, brand, category, dateofpublic, iduser) " +
                    "values (?, ?, ?, ?, ?, now(), ?)");
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());
            statement.setInt(4, item.getBrand().getId());
            statement.setInt(5, item.getCategory().getId());
            statement.setInt(6, Integer.parseInt(String.valueOf(item.getUser().getId())));
            statement.executeUpdate();
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static Item getItemById(int id){
        Item item = new Item();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT it.id, it.name, it.description, it.price, it.dateofpublic, br.id as idofbrand, br.name " +
                    "AS nameofbrand, br.country, cat.id as idofcategory, " +
                    "cat.nameofcategory, us.name as nameofuser, us.email, us.id as idofuser FROM items it " +
                    "INNER JOIN brands br ON br.id=it.brand " +
                    "INNER JOIN categories cat ON cat.id=it.category " +
                    "INNER JOIN users us ON us.id=it.iduser where it.id = ? ORDER BY it.category ");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                item.setDateOfPublic(resultSet.getTimestamp("dateofpublic"));
                Brand brand = new Brand();
                brand.setId(resultSet.getInt("idofbrand"));
                brand.setName(resultSet.getString("nameofbrand"));
                brand.setCountry(resultSet.getString("country"));
                Category category = new Category();
                category.setId(resultSet.getInt("idofcategory"));
                category.setNameOfCategory(resultSet.getString("nameofcategory"));
                User user = new User();
                user.setId(resultSet.getLong("idofuser"));
                user.setFullName(resultSet.getString("nameofuser"));
                user.setEmail(resultSet.getString("email"));
                item.setUser(user);
                item.setCategory(category);
                item.setBrand(brand);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return item;
    }
    public static ArrayList<Item> getAllItems(){
        ArrayList<Item>items=new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT it.id, it.name, it.description, it.price, it.dateofpublic, br.id as idofbrand, br.name " +
                    "AS nameofbrand, br.country, cat.id as idofcategory, " +
                    "cat.nameofcategory, us.name as nameofuser, us.email, us.id as idofuser FROM items it " +
                    "INNER JOIN brands br ON br.id=it.brand " +
                    "INNER JOIN categories cat ON cat.id=it.category " +
                    "INNER JOIN users us ON us.id=it.iduser ORDER BY it.category ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Item item =new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                item.setDateOfPublic(resultSet.getTimestamp("dateofpublic"));
                Brand brand = new Brand();
                brand.setId(resultSet.getInt("idofbrand"));
                brand.setName(resultSet.getString("nameofbrand"));
                brand.setCountry(resultSet.getString("country"));
                Category category = new Category();
                category.setId(resultSet.getInt("idofcategory"));
                category.setNameOfCategory(resultSet.getString("nameofcategory"));
                User user = new User();
                user.setId(resultSet.getLong("idofuser"));
                user.setFullName(resultSet.getString("nameofuser"));
                user.setEmail(resultSet.getString("email"));
                item.setUser(user);
                item.setCategory(category);
                item.setBrand(brand);
                items.add(item);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return items;
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
