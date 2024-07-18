package controller.web;

import DAO.IUserDao;
import DAO.impl.UserDaoImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;
import model.User;
import model.google.Constants;
import model.google.UserGoogle;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import service.ICommunityService;
import service.IUserService;
import service.Impl.ComunityServiceImpl;
import service.Impl.UserServiceImpl;
import utils.Email;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/profile","/update-profile","/LoginGoogle","/profileother","/searchUser"})
public class UserController extends HttpServlet {
    ICommunityService i = new ComunityServiceImpl() ;
    IUserService u = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("profile")){
            getProfile(request,response);
        } else if(url.contains("LoginGoogle")){
            getLoginWithGoogle(request,response);
        } else if(url.contains("profileother")){
            getProfileOther(request,response);
        } else if(url.contains("searchUser")){
            getSearchUser(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.contains("/update-profile")) {
            postUpdateProfile(request, response);
        } else if (url.contains("/searchUser")) {
            postSearchUser(request, response);
        }
    }

    protected void getProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        List<Post> posts = i.getPostsByUserId(u.getId());
        if(session.getAttribute("posts") != null) {
            session.removeAttribute("posts");
        }
        session.setAttribute("posts", posts);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    protected void postUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        User user = new User(username,fullName,phone);
        u.updateProfile(user);
        HttpSession s = request.getSession();
        User sessionUser = (User) s.getAttribute("user");
        if (s != null) {
            sessionUser.setFullName(fullName);
            sessionUser.setPhone(phone);
            s.setAttribute("user", sessionUser);
        }

        response.sendRedirect("profile");
    }
    protected void getLoginWithGoogle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IUserService i = new UserServiceImpl();
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogle user = getUserInfo(accessToken);
//        System.out.println("ID: " + user.getId());
//        System.out.println("Email: " + user.getEmail());
//        System.out.println("Verified Email: " + user.isVerifiedEmail());
//        System.out.println("Name: " + user.getName());
//        System.out.println("Given Name: " + user.getGivenName());
//        System.out.println("Family Name: " + user.getFamilyName());
//        System.out.println("Picture: " + user.getPicture());
        User userInsert = i.findOne(user.getId());
        System.out.println(user.getId());
        HttpSession session = request.getSession();
        if (userInsert==null) {
            userInsert = new User();
            userInsert.setUsername(user.getId());
            userInsert.setEmail(user.getEmail());
            userInsert.setAvatar(user.getPicture());
            userInsert.setFullName(user.getName());
            userInsert.setPassword(new Email().getRandom());
            userInsert.setRole(2);
            userInsert.setCode("000000");
            i.register(userInsert.getEmail(),userInsert.getPassword(),userInsert.getUsername(),userInsert.getFullName(),userInsert.getCode(),userInsert.getAvatar(),1);
        }
        session.setAttribute("user", userInsert);
        response.sendRedirect("home");
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
    }
    protected void getProfileOther(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userid");
        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/searchuser.jsp");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            User userOther = u.findOne(userId);
            List<Post> posts = i.getPostsByUserId(userId);
            HttpSession session = request.getSession();
            if(session.getAttribute("posts") != null) {
                session.removeAttribute("posts");
            }
            session.setAttribute("posts", posts);
            if (userOther != null) {
                request.setAttribute("profileUser", userOther);
                request.getRequestDispatcher("/profileother.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "User not found!");
                request.getRequestDispatcher("/searchuser.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/searchuser.jsp");
        }
    }
    protected void getSearchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<User> allUsers = u.getAllUsers();

        request.setAttribute("allUsers", allUsers);

        request.getRequestDispatcher("/searchuser.jsp").forward(request, response);
    }

    protected void postSearchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy email từ form
        String email = request.getParameter("email");
        List<User> allUsers = u.getUserByEmail(email);
        request.setAttribute("userList", allUsers);
        request.getRequestDispatcher("/searchuser.jsp").forward(request, response);
    }
}
