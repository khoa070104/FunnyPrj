package service.Impl;

import DAO.impl.UserDaoImpl;
import model.User;
import service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
    UserDaoImpl userDao = new UserDaoImpl();

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public User findOne(int id) {
        return userDao.findOne( id);
    }

    @Override
    public User findOne(String username) {
        return userDao.findOne(username);
    }

    @Override
    public void insert(User user) {

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void updatestatus(User user) {
        userDao.updatestatus(user);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public User checkEmail(String email) {
        return null;
    }

    @Override
    public User checkUsername(String username) {
        return null;
    }

    @Override
    public boolean register(String email, String password, String username, String fullname, String code) {
        if (userDao.checkExistEmail(email))
            return false;
        if (userDao.checkExistUsername(username)) {
            return false;
        }
        userDao.insertregister(new User(username, email, fullname, password, 0, 2, code));
        return true;
    }
    @Override
    public User login(String username, String password) {
        User user = this.findOne(username);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }
    public static void main(String[] args) {
        User user = new UserServiceImpl().login("Mamgh789@gmail.com", "1");
        System.out.println(user);
    }
}