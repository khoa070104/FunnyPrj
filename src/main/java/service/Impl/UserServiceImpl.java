package service.Impl;

import DAO.IUserDao;
import DAO.impl.UserDaoImpl;
import model.User;
import service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
    IUserDao u = new UserDaoImpl();
    
    @Override
    public void updateAvatar(User user) {
        u.updateAvatar(user);
    }


    @Override
    public User findOneByEmail(String email) {
        return u.findOneByEmail(email);
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public User findOne(int id) {
        return u.findOne( id);
    }

    @Override
    public User findOne(String username) {
        return u.findOne(username);
    }

    @Override
    public void insert(User user) {

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void updatestatus(User user) {
        u.updatestatus(user);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public User checkEmail(String email) {
        return u.checkEmail(email);
    }

    @Override
    public User checkUsername(String username) {
        return null;
    }

    @Override
    public boolean register(String email, String password, String username, String fullname, String code, String pic) {
        if (u.checkExistEmail(email))
            return false;
        if (u.checkExistUsername(username)) {
            return false;
        }
        u.insertregister(new User(username, email, fullname, password, 0, 2, code,pic));
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
    @Override
    public void updateProfile(User user) {
        u.updateProfile(user);
    }
    public static void main(String[] args) {
        User user = new UserServiceImpl().login("Mamgh789@gmail.com", "1");
        System.out.println(user);
    }

    @Override
    public boolean register(String email, String password, String username, String fullname, String code, String pic, int status) {
        if (u.checkExistEmail(email))
            return false;
        if (u.checkExistUsername(username)) {
            return false;
        } //(String username, String email, String fullName, String password, String avatar, String phone, int role, int status,  String code)
        u.insertregister(new User(username, email, fullname, password, pic, "NULL", 2,status,code));
        return true;
    }

    @Override
    public List<User> getUserByEmail(String search) {
        return u.getUserByEmail(search);
    }

    @Override
    public List<User> getAllUsers() {
        return u.getAllUsers();
    }
}