package model;

public class Post {
    private int id;
    private String title;
    private String content;
    private int status;
    private int numberComment;
    private int idUser; // Thêm trường idUser vào đây

    public Post() {}

    public Post(int id, String title, String content, int status, int numberComment, int idUser) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.status = status;
        this.numberComment = numberComment;
        this.idUser = idUser; // Cập nhật constructor để khởi tạo idUser
    }

    public Post(int id, String title, String content,int idUser) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.idUser = idUser; // Cập nhật constructor để khởi tạo idUser
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getNumberComment() {
        return numberComment;
    }

    public void setNumberComment(int numberComment) {
        this.numberComment = numberComment;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
