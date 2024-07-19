package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Comment;
import model.Message;
import model.Post;
import service.ICommunityService;
import service.Impl.ComunityServiceImpl;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/listpost","/admin/updateComment",
        "/admin/EditPost","/admin/deletePost","/admin/deleteComment","/admin/CreatePost",
        "/admin/listcomment","/admin/listmessage", "/admin/deleteMessage", "/admin/createMessage"})
public class CommunityController extends HttpServlet {
    ICommunityService i = new ComunityServiceImpl() ;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getServletPath();
        if(url.contains("listpost")) {
            getListPost(request, response);
        } else if(url.contains("listcomment")) {
            getCmt(request, response);
        } else if (url.contains("listmessage")) {
            getListMessage(request, response);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getServletPath();
        if(url.contains("updateComment")) {
            postUpdateComment(request, response);
        } else if(url.contains("EditPost")) {
            postEditPost(request, response);
        } else if(url.contains("deletePost")) {
            postDeletePost(request, response);
        } else if(url.contains("deleteComment")) {
            postDelCmt(request, response);
        } else if(url.contains("CreatePost")) {
            postCreatePost(request, response);
        } else if(url.contains("listcomment")) {
            postCmt(request, response);
        } else if  (url.contains("deleteMessage")) {
            postDeleteMessage(request, response);
        } else if (url.contains("createMessage")) {
            postCreateMessage(request, response);
        }
    }
    protected void getListPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> posts = null;
        posts = i.getAllPosts();
        HttpSession session = request.getSession();
        if(session.getAttribute("posts") != null) {
            session.removeAttribute("posts");
        }
        session.setAttribute("posts", posts);
        request.getRequestDispatcher("admin_post.jsp").forward(request, response);
    }
    protected void postUpdateComment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int commentId = Integer.parseInt(request.getParameter("commentId"));
        String message = request.getParameter("message");
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String formattedDateTime = now.format(formatter);

        Comment updatedComment = new Comment();
        updatedComment.setId(commentId);
        updatedComment.setMessage(message);
        updatedComment.setCreatedDate(formattedDateTime);
        i.updateComment(updatedComment);
        int postId = Integer.parseInt(request.getParameter("postId"));
        response.sendRedirect(request.getContextPath() + "/admin/listcomment?id=" + postId);

    }
    protected void postEditPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        int userId = Integer.parseInt(request.getParameter("idUser"));
        Post updatedPost = new Post(postId, title, content, userId);
        i.updatePost(updatedPost);
        response.sendRedirect(request.getContextPath() + "/admin/listpost");

    }
    protected void postDeletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        i.deletePost(postId);
        response.sendRedirect(request.getContextPath() + "/admin/listpost");

    }
    protected void postDelCmt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int commentId = Integer.parseInt(request.getParameter("commentId"));
        i.deleteComment(commentId);
        int postId = Integer.parseInt(request.getParameter("postId")); // Lấy postId từ request
        response.sendRedirect(request.getContextPath() + "/admin/listcomment?id=" + postId);

    }
    protected void postCreatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        Post newPost = new Post();
        newPost.setTitle(title);
        newPost.setContent(content);
        newPost.setIdUser(idUser);
        i.addPost(newPost);
        response.sendRedirect(request.getContextPath() + "/admin/listpost");     // Redirect to the post list page

    }
    protected void getCmt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id_raw = request.getParameter("id");
        Post p = new Post();
        List<Comment> comments = null;
        try {
            int id = Integer.parseInt(id_raw);
            comments = i.getCommentById(id);
            p = i.getPostById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("comments") != null) {
            session.removeAttribute("comments");
        }
        if(session.getAttribute("post") != null) {
            session.removeAttribute("post");
        }
        session.setAttribute("post",p);
        session.setAttribute("comments", comments);
        request.getRequestDispatcher("admin_comment.jsp").forward(request, response);
    }
    protected void postCmt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LocalDateTime now = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        String message = request.getParameter("message");
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idPost = Integer.parseInt(request.getParameter("idPost"));

        Comment newComment = new Comment();
        newComment.setMessage(message);
        newComment.setCreatedDate(formattedDateTime);
        newComment.setIdUser(idUser);
        newComment.setIdPost(idPost);
        i.addComment(newComment);
        int postId = Integer.parseInt(request.getParameter("idPost"));
        response.sendRedirect(request.getContextPath() + "/admin/listcomment?id=" + postId);

    }
    protected void getListMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Message> messages = i.getAllMessages();
        HttpSession session = request.getSession();
        if (session.getAttribute("messages") != null) {
            session.removeAttribute("messages");
        }
        session.setAttribute("messages", messages);
        request.getRequestDispatcher("admin_community.jsp").forward(request, response);
    }

    protected void postDeleteMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int messageId = Integer.parseInt(request.getParameter("messageId"));
        i.deleteMessage(messageId);
        response.sendRedirect(request.getContextPath() + "/admin/listmessage");
    }

    protected void postCreateMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        int idUser = Integer.parseInt(request.getParameter("idUser"));

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String formattedDateTime = now.format(formatter);

        Message newMessage = new Message();
        newMessage.setContent(content);
        newMessage.setCreatedDate(formattedDateTime);
        newMessage.setIdUser(idUser);

        i.addMessage(newMessage);
        response.sendRedirect(request.getContextPath() + "/admin/listmessage");
    }
}
