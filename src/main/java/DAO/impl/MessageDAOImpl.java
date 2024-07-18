package DAO.impl;

import DAO.DBConnect;
import model.Message;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MessageDAOImpl extends DBConnect {

    public void addMessage(Message message) {
        String sql = "INSERT INTO tblMessage (message, createdDate, id_user) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, message.getContent());
            stmt.setString(2, message.getCreatedDate());
            stmt.setInt(3, message.getIdUser());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteMessage(int id) {
        String sql = "DELETE FROM tblMessage WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Message> getAllMessages() {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM tblMessage ORDER BY createdDate ASC"; // Sắp xếp theo thời gian tăng dần (cũ nhất đến mới nhất)
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setContent(rs.getString("message"));
                message.setCreatedDate(rs.getString("createdDate"));
                message.setIdUser(rs.getInt("id_user"));
                messages.add(message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messages;
    }


//    public Message getMessageById(int id) {
//        Message message = null;
//        String sql = "SELECT * FROM tblMessage WHERE id = ?";
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setInt(1, id);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                message = new Message();
//                message.setId(rs.getInt("id"));
//                message.setContent(rs.getString("message"));
//                message.setCreatedDate(rs.getString("createdDate"));
//                message.setIdUser(rs.getInt("id_user"));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return message;
//    }



}