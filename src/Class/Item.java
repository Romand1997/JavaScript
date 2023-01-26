package Class;

import java.sql.Timestamp;

public class Item {
    private Long id;
    private String name;
    private Brand brand;
    private String description;
    private double price;
    private Category category;
    private Timestamp dateOfPublic;
    private User user;


    public Timestamp getDateOfPublic() {
        return dateOfPublic;
    }

    public void setDateOfPublic(Timestamp dateOfPublic) {
        this.dateOfPublic = dateOfPublic;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }
    public void setBrand(Brand brand) {
        this.brand = brand;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
