package service.Impl;

import DAO.ICommunityDao;
import DAO.impl.CommunityDAOImpl;
import model.Comment;
import model.Post;
import service.ICommunityService;

import java.util.List;

public class ComunityServiceImpl implements ICommunityService {
    ICommunityDao i = new CommunityDAOImpl();
    @Override
    public void addComment(Comment comment) {
        i.addComment(comment);
    }

    @Override
    public void updateComment(Comment comment) {
        i.updateComment(comment);
    }

    @Override
    public void deleteComment(int id) {
        i.deleteComment(id);
    }

    @Override
    public List<Comment> getCommentById(int id) {
        return  i.getCommentById(id);

    }

    @Override
    public void addPost(Post post) {
        i.addPost(post);
    }

    @Override
    public void updatePost(Post post) {
        i.updatePost(post);
    }

    @Override
    public void deletePost(int id) {
        i.deletePost(id);
    }

    @Override
    public Post getPostById(int id) {
        return i.getPostById(id);
    }

    @Override
    public List<Post> getAllPosts() {
        return i.getAllPosts();
    }

    @Override
    public List<Post> getPostsByUserId(int userId){
        return i.getPostsByUserId(userId);
    }
}
