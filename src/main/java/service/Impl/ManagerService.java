package service.Impl;

import DAO.IManagerDao;
import DAO.impl.ManagerDaoImp;
import model.User;
import service.IManagerService;

import java.util.List;

public class ManagerService implements IManagerService {
    private IManagerDao iManagerDao = new ManagerDaoImp();

    @Override
    public List<User> getAllUsers() {
        return iManagerDao.getAllUsers();
    }

    @Override
    public boolean checkExistEmail(String email) {
        return iManagerDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return iManagerDao.checkExistUsername(username);
    }

    @Override
    public boolean createUser(User user) {
        return iManagerDao.createUser(user);
    }

    @Override
    public boolean addUser(User user) {
        return iManagerDao.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return iManagerDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(int userId) {
        return iManagerDao.deleteUser(userId);
    }
}
