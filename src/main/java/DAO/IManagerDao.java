package DAO;

import model.User;

import java.util.List;

public interface IManagerDao {
    public List<User> getAllUsers();

    public boolean checkExistEmail(String email) ;

    public boolean checkExistUsername(String username);

    public boolean createUser(User user);

    public boolean addUser(User user);

    public boolean updateUser(User user);

    public boolean deleteUser(int userId);



}
