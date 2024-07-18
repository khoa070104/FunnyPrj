package controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Message;
import DAO.impl.MessageDAOImpl;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = {"/listmessage", "/deleteMessage", "/createMessage"})
public class MessageServlet extends HttpServlet {
    MessageDAOImpl messageDAO = new MessageDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getServletPath();
        if (url.contains("listmessage")) {
            getListMessage(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getServletPath();
        if  (url.contains("deleteMessage")) {
            postDeleteMessage(request, response);
        } else if (url.contains("createMessage")) {
            postCreateMessage(request, response);
        }
    }

    protected void getListMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Message> messages = messageDAO.getAllMessages();
        HttpSession session = request.getSession();
        if (session.getAttribute("messages") != null) {
            session.removeAttribute("messages");
        }
        session.setAttribute("messages", messages);
        request.getRequestDispatcher("/message.jsp").forward(request, response);
    }

    protected void postDeleteMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int messageId = Integer.parseInt(request.getParameter("messageId"));
        messageDAO.deleteMessage(messageId);
        response.sendRedirect(request.getContextPath() + "/listmessage");
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

        messageDAO.addMessage(newMessage);
        response.sendRedirect(request.getContextPath() + "/listmessage");
    }
}
