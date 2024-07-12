package DAO.impl;

import DAO.DBConnect;
import model.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

    public class AvatarDAOImpl extends DBConnect {
    public static List<User> Users = new ArrayList<>();

    public User findbyId(){
        return null;
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

    public int save(User user) {
        Users.add(user);
        return 1;
    }

    public List<User> getAll() {

        return Users;
    }
}
