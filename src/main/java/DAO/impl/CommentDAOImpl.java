package DAO.impl;

import DAO.DBConnect;
import model.Comment;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

public class CommentDAOImpl extends DBConnect {

    public void addComment(Comment comment) throws SQLException {
        String sql = "INSERT INTO tblComment (message, createdDate, id_user, id_post) VALUES (?, ?, ?, ?)";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, comment.getMessage());
            stmt.setString(2, comment.getCreatedDate());
            stmt.setInt(3, comment.getIdUser());
            stmt.setInt(4, comment.getIdPost());
            stmt.executeUpdate();
        }
    }

    public void updateComment(Comment comment) throws SQLException {
        String sql = "UPDATE tblComment SET message = ?, createdDate = ? WHERE id = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, comment.getMessage());
            stmt.setString(2, comment.getCreatedDate());
            stmt.setInt(3, comment.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteComment(int id) throws SQLException {
        String sql = "DELETE FROM tblComment WHERE id = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public List<Comment> getCommentById(int id) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM tblComment WHERE id_post = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                comments.add( new Comment(
                        rs.getInt("id"),
                        rs.getString("message"),
                        rs.getString("createdDate"),
                        rs.getInt("id_user"),
                        rs.getInt("id_post"))
                );
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }

    public List<Comment> getAllComments() throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM tblComment";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                comments.add(new Comment(
                        rs.getInt("id"),
                        rs.getString("message"),
                        rs.getString("createdDate"),
                        rs.getInt("id_user"),
                        rs.getInt("id_post")
                ));
            }
        }
        return comments;
    }

}
