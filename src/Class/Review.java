package Class;

import java.sql.Timestamp;

public class Review {
    private int id;
    private  User user;
    private int idOfItem;
    private String content;
    private Timestamp dateOfPublic;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getIdOfItem() {
        return idOfItem;
    }

    public void setIdOfItem(int idOfItem) {
        this.idOfItem = idOfItem;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDateOfPublic() {
        return dateOfPublic;
    }

    public void setDateOfPublic(Timestamp dateOfPublic) {
        this.dateOfPublic = dateOfPublic;
    }
}
