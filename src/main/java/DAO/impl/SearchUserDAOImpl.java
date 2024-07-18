package DAO.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.DBConnect;
import model.User;

public class SearchUserDAOImpl extends DBConnect {

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

