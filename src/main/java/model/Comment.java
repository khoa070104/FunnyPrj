package model;

import java.time.LocalDateTime;

public class Comment {
    private int id;
    private String message;
    private String createdDate;
    private int idUser;
    private int idPost;

    public Comment() {}

    public Comment(int id, String message, String createdDate, int idUser, int idPost) {
        this.id = id;
        this.message = message;
        this.createdDate = createdDate;
        this.idUser = idUser;
        this.idPost = idPost;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }
}

