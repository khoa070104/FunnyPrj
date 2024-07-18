package DAO.impl;

import DAO.DBConnect;
import DAO.IUserDao;
import model.User;

import java.sql.*;
import java.util.*;

public class UserDaoImpl extends DBConnect implements IUserDao {

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                users.add(new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    @Override
    public User findOneByEmail(String email) {
        String sql = "SELECT * FROM tblUsers WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public User findOne(int id) {
        String sql = "SELECT * FROM tblUsers WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User findOne(String username) {
        String sql = "SELECT * FROM tblUsers WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return null;
    }

    @Override
    public void insert(User user) {

    }

    @Override
    public void insertregister(User user) {
        String sql = "INSERT INTO tblUsers(username,email,fullName,password,role,status,code,avatar) VALUES(?,?,?,?,?,?,?,?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getPassword());
            stmt.setInt(5, user.getRole());
            stmt.setInt(6, user.getStatus());
            stmt.setString(7, user.getCode());
            stmt.setString(8, user.getAvatar());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void update(User user) {
        String sql ="UPDATE tblUsers SET password=? WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getEmail());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    @Override
    public void updateProfile(User user) {
        String sql = "UPDATE tblUsers SET phone=?, fullName=? WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            String phone = user.getPhone().isEmpty() ? "" : user.getPhone();
            String fullname = user.getFullName().isEmpty() ? "NaN" : user.getFullName();
            stmt.setNString(1, phone);
            stmt.setNString(2, fullname);
            stmt.setNString(3, user.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void updatestatus(User user) {
        String sql ="UPDATE tblUsers SET status = ?,code=? WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, user.getStatus());
            stmt.setString(2, user.getCode());
            stmt.setString(3, user.getEmail());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public boolean checkExistEmail(String email) {
        boolean duplicate = false;
        String sql = "SELECT * FROM tblUsers WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                duplicate = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();}
        return duplicate;
    }

    @Override
    public boolean checkExistUsername(String username) {
        boolean duplicate = false;
        String sql = "SELECT * FROM tblUsers WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                duplicate = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return duplicate;
    }



    public void updateAvatar(User user) {
        String sql = "UPDATE tblUsers SET avatar=? WHERE username=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getAvatar());
            stmt.setString(2, user.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public static void main(String[] args) {
        new UserDaoImpl().updateProfile(new User("1","admin","admin"));

    }
    // User(String username, String fullname, String phone)
    public User checkEmail(String email){
        User duplicate = null;
        String sql = "SELECT * FROM tblUsers WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                duplicate = new User(rs.getString(2),rs.getString(4),rs.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();}
        return duplicate;
    }
    public List<User> getUserByEmail(String search) {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers WHERE email LIKE ? or username LIKE ? ";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + search + "%");
            stmt.setString(2, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String mail = rs.getString("email");
                String fullName = rs.getString("fullName");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                String phone = rs.getString("phone");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                String code = rs.getString("code");

                User user = new User(id, username, mail, fullName, password, avatar, phone, role, status, code);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String fullName = rs.getString("fullName");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                String phone = rs.getString("phone");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                String code = rs.getString("code");

                User user = new User(id, username, email, fullName, password, avatar, phone, role, status, code);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
