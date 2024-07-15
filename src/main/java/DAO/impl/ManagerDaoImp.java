package DAO.impl;

import DAO.DBConnect;
import DAO.IManagerDao;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManagerDaoImp extends DBConnect implements IManagerDao {

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setFullName(rs.getString("fullName"));
                    user.setPassword(rs.getString("password"));
                    user.setAvatar(rs.getString("avatar"));
                    user.setPhone(rs.getString("phone"));
                    user.setRole(rs.getInt("role"));
                    user.setStatus(rs.getInt("status"));
                    user.setCode(rs.getString("code"));

                    userList.add(user);
                }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

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

    public boolean createUser(User user) {
        ManagerDaoImp editUserDAO = new ManagerDaoImp();
        if (editUserDAO.checkExistEmail(user.getEmail()))
            return false;
        if (editUserDAO.checkExistUsername(user.getUsername())) {
            return false;
        }
        editUserDAO.addUser(user);
        return true;
    }

    public boolean addUser(User user) {
        String sql = "INSERT INTO tblUsers (username, email, fullName, password, avatar, phone, role, status, code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getAvatar());
            stmt.setString(6, user.getPhone());
            stmt.setInt(7, user.getRole());
            stmt.setInt(8, user.getStatus());
            stmt.setString(9, user.getCode());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE tblUsers SET username = ?, email = ?, fullName = ?, password = ?, avatar = ?, phone = ?, role = ?, status = ?, code = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getAvatar());
            stmt.setString(6, user.getPhone());
            stmt.setInt(7, user.getRole());
            stmt.setInt(8, user.getStatus());
            stmt.setString(9, user.getCode());
            stmt.setInt(10, user.getId());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM tblUsers WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
