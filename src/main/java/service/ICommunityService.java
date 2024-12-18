package service;

import model.Comment;
import model.Message;
import model.Post;

import java.util.List;

public interface ICommunityService {
    public void addComment(Comment comment);
    public void updateComment(Comment comment);
    public void deleteComment(int id);
    public List<Comment> getCommentById(int id);
    public void addPost(Post post);
    public void updatePost(Post post);
    public void deletePost(int id);
    public Post getPostById(int id);
    public List<Post> getAllPosts();
    public List<Post> getPostsByUserId(int userId);
    public void addMessage(Message message) ;
    public void deleteMessage(int id) ;
    public List<Message> getAllMessages() ;
    public void deleteCommentsByPostId(int postId);

}
