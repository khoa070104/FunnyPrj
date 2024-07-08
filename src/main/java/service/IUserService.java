package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll(); // hàm lay toàn bo User
    User findOne(int id); // hàm lấy 01 đối tượng User theo ID
    User findOne(String username); // hàm lấy 01 đối tượng User theo usernames
    User findOneByEmail(String email);
    void insert(User user); // hàm này thêm dữ liệu mới cho User
    void update(User user); // hàm này cập nhật 1 đối tượng User
    void updatestatus(User user); //hàm này dùng active tài khoản
    void delete(int id); // hàm này xóa 1 đối tượng User
    boolean register(String email, String password, String username, String fullname, String code);
    User login(String email, String password);
    User checkEmail(String email);
    User checkUsername(String username);
}
