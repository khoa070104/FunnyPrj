package controller.web;

import DAO.IUserDao;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.google.Constants;
import model.google.UserGoogle;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import service.IUserService;
import service.Impl.UserServiceImpl;
import utils.Email;

import java.io.IOException;

@WebServlet(urlPatterns = {"/profile","/update-profile","/LoginGoogle"})
public class UserController extends HttpServlet {
    IUserService u = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("profile")){
            getProfile(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your code here
        String url = request.getRequestURI().toString();
        if(url.contains("update-profile")){
            postProfile(request,response);
        }
    }

    protected void getProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request,response);
    }
    protected void postProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
}
