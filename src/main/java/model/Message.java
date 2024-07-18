package model;

public class Message {
    private int id;
    private String content;
    private String createdDate;
    private int idUser;

    public Message() {}

    public Message(int id, String content, String createdDate, int idUser) {
        this.id = id;
        this.content = content;
        this.createdDate = createdDate;
        this.idUser = idUser;
    }

    public Message(int id, String content, String createdDate) {
        this.id = id;
        this.content = content;
        this.createdDate = createdDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
