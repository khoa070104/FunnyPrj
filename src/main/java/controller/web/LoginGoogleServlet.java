//package controller.web;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.User;
//import model.google.Constants;
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
//import jakarta.servlet.annotation.WebServlet;
//import model.google.UserGoogle;
//import org.apache.http.client.ClientProtocolException;
//import org.apache.http.client.fluent.Form;
//import org.apache.http.client.fluent.Request;
//import service.IUserService;
//import service.Impl.UserServiceImpl;
//import utils.Email;
//
//import java.io.IOException;
//
//@WebServlet(urlPatterns = {"/LoginGoogle"})
//public class LoginGoogleServlet extends HttpServlet {
//
//
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        IUserService i = new UserServiceImpl();
//        String code = request.getParameter("code");
//        String accessToken = getToken(code);
//        UserGoogle user = getUserInfo(accessToken);
////        System.out.println("ID: " + user.getId());
////        System.out.println("Email: " + user.getEmail());
////        System.out.println("Verified Email: " + user.isVerifiedEmail());
////        System.out.println("Name: " + user.getName());
////        System.out.println("Given Name: " + user.getGivenName());
////        System.out.println("Family Name: " + user.getFamilyName());
////        System.out.println("Picture: " + user.getPicture());
//        User userInsert = i.findOne(user.getId());
//        System.out.println(user.getId());
//        HttpSession session = request.getSession();
//        if (userInsert==null) {
//            userInsert = new User();
//            userInsert.setUsername(user.getId());
//            userInsert.setEmail(user.getEmail());
//            userInsert.setAvatar(user.getPicture());
//            userInsert.setFullName(user.getName());
//            userInsert.setPassword(new Email().getRandom());
//            userInsert.setRole(2);
//            userInsert.setCode("000000");
//            i.register(userInsert.getEmail(),userInsert.getPassword(),userInsert.getUsername(),userInsert.getFullName(),userInsert.getCode(),userInsert.getAvatar(),1);
//        }
//        session.setAttribute("user", userInsert);
//        response.sendRedirect("home");
//    }
//
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//        // call api to get token
//        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
//                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
//                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
//                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
//                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
//                .execute().returnContent().asString();
//
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//
//    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.Get(link).execute().returnContent().asString();
//
//        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);
//
//        return googlePojo;
//    }
//
//
//
//
//}
