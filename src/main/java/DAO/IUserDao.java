package DAO;

import model.User;

import java.util.List;

public interface IUserDao {
    List<User> findAll(); // hàm lấy toàn bộ User
    User findOne(int id); // hàm lấy 01 đối tượng User theo ID
    User findOne(String username); // ham lay 01 đoi tuong User theo username
    void insert(User user); // hàm này thêm dữ liệu mới cho User
    void insertregister(User user); //hàm này dùng cho register
    void update(User user); // hàm này cập nhật 1 đối tượng User
    void updatestatus(User user); //hàm này dùng active tài khoản
    void delete(int id); // hàm này xóa 1 đối tượng User
    boolean checkExistEmail(String email); // hàm này kiểm tra email đã tồn tại chưa
    boolean checkExistUsername(String username); // hàm này kiểm tra username đã tồn tại chưa
}
