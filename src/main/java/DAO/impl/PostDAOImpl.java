package DAO.impl;

import DAO.DBConnect;
import model.Post;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAOImpl extends DBConnect {

    public void addPost(Post post) throws SQLException {
        String sql = "INSERT INTO tblPost (title, content, status, numberComment, id_user) VALUES (?, ?, ?, ?, ?)";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setInt(3, 1);
            stmt.setInt(4, 0);
            stmt.setInt(5, post.getIdUser());
            stmt.executeUpdate();
        }
    }

    public void updatePost(Post post) throws SQLException {
        String sql = "UPDATE tblPost SET title = ?, content = ?, id_user = ? WHERE id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setInt(3, post.getIdUser());
            stmt.setInt(4, post.getId());
            stmt.executeUpdate();
        }
    }

    public void deletePost(int id) throws SQLException {
        String sql = "DELETE FROM tblPost WHERE id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public Post getPostById(int id) throws SQLException {
        String sql = "SELECT * FROM tblPost WHERE id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("numberComment"),
                        rs.getInt("id_user")
                );
            }
        }
        return null;
    }

    public List<Post> getAllPosts() throws SQLException {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM tblPost";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("numberComment"),
                        rs.getInt("id_user")
                );
                posts.add(post);
            }
        }
        return posts;
    }
}
