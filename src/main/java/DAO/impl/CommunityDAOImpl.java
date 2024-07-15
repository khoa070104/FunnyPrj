package DAO.impl;

import DAO.DBConnect;
import DAO.ICommunityDao;
import model.Comment;
import model.Post;

import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

public class CommunityDAOImpl extends DBConnect implements ICommunityDao {

    public void addComment(Comment comment)  {
        String sql = "INSERT INTO tblComment (message, createdDate, id_user, id_post) VALUES (?, ?, ?, ?)";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setNString(1, comment.getMessage());
            stmt.setString(2, comment.getCreatedDate());
            stmt.setInt(3, comment.getIdUser());
            stmt.setInt(4, comment.getIdPost());
            stmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateComment(Comment comment)  {
        String sql = "UPDATE tblComment SET message = ?, createdDate = ? WHERE id = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setNString(1, comment.getMessage());
            stmt.setString(2, comment.getCreatedDate());
            stmt.setInt(3, comment.getId());
            stmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void deleteComment(int id) {
        String sql = "DELETE FROM tblComment WHERE id = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
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
                        rs.getNString("message"),
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

    public void addPost(Post post) {
        String sql = "INSERT INTO tblPost (title, content, status, numberComment, id_user) VALUES (?, ?, ?, ?, ?)";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setNString(1, post.getTitle());
            stmt.setNString(2, post.getContent());
            stmt.setInt(3, 1);
            stmt.setInt(4, 0);
            stmt.setInt(5, post.getIdUser());
            stmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updatePost(Post post)  {
        String sql = "UPDATE tblPost SET title = ?, content = ?, id_user = ? WHERE id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setNString(1, post.getTitle());
            stmt.setNString(2, post.getContent());
            stmt.setInt(3, post.getIdUser());
            stmt.setInt(4, post.getId());
            stmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void deletePost(int id) {
        String sql = "DELETE FROM tblPost WHERE id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public Post getPostById(int id)  {
        String sql = "SELECT * FROM tblPost WHERE id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Post(
                        rs.getInt("id"),
                        rs.getNString("title"),
                        rs.getNString("content"),
                        rs.getInt("status"),
                        rs.getInt("numberComment"),
                        rs.getInt("id_user")
                );
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public List<Post> getAllPosts() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM tblPost";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("id"),
                        rs.getNString("title"),
                        rs.getNString("content"),
                        rs.getInt("status"),
                        rs.getInt("numberComment"),
                        rs.getInt("id_user")
                );
                posts.add(post);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return posts;
    }



}