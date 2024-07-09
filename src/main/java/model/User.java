package model;

public class User {
    /*
    * id bigint IDENTITY(1,1) primary key,
	username nvarchar(30),
	email nvarchar(30),
	fullName nvarchar(30),
	password nvarchar(30),
	avatar varchar(50),
	phone varchar(30),
	role varchar(1) ,
	status BIT DEFAULT 0 ,
	code varchar(6),
    * */
    private int id,status,role;
    private String username, email, fullName, password, avatar, phone, code,roles;

    public User() {
    }

    public User(int id,String username, String email, String fullName, String password, String avatar, String phone, int role, int status,  String code) {
        this.id = id;
        this.status = status;
        this.role = role;
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.avatar = avatar;
        this.phone = phone;
        this.code = code;
    }

    public User(String username, String email, String fullName, String password, String code) {
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.code = code;
        this.status =0;
    }

    public User(String username, String email, String fullname, String password, int status, int role, String code) {
        this.username = username;
        this.email = email;
        this.fullName = fullname;
        this.password = password;
        this.status = status;
        this.role = role;
        this.code = code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
}
