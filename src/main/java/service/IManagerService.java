package service;

import model.Comment;
import model.Post;
import model.User;

import java.util.List;

public interface IManagerService {
    public List<User> getAllUsers();

    public boolean checkExistEmail(String email) ;

    public boolean checkExistUsername(String username);

    public boolean createUser(User user);

    public boolean addUser(User user);

    public boolean updateUser(User user);

    public boolean deleteUser(int userId);


}
