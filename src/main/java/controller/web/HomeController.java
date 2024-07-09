package controller.web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import service.IUserService;
import service.Impl.UserServiceImpl;
import utils.Email;

import java.io.IOException;

@WebServlet(urlPatterns = {"/home","/login","/register","/logout","/forgotpass","/verify-code","/waiting"})
public class HomeController extends HttpServlet {
    IUserService userService = new UserServiceImpl();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("login")){
            getLogin(request,response);
        } else if(url.contains("register")){
            request.getRequestDispatcher("register.jsp").forward(request,response);
        } else if(url.contains("logout")){
            //request.getRequestDispatcher("logout.jsp").forward(request,response);
            getLogout(request,response);
        } else if(url.contains("forgotpass")){
            request.getRequestDispatcher("forgotpassword.jsp").forward(request,response);
        } else if(url.contains("verify-code")){
            request.getRequestDispatcher("verify-code.jsp").forward(request,response);
        } else if(url.contains("waiting")){
            getWaiting(request,response);
        } else{
            getHomePage(request,response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();
        if(url.contains("login")){
            postLogin(request,response);
        } else if(url.contains("register")){
            postRegister(request,response);
        } else if(url.contains("verify-code")){
            postVerifyCode(request,response);
        } else if(url.contains("forgotpass")){
            postForgetPass(request,response);
        }
    }


    private void getHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("homepage.jsp").forward(request,response);
    }
    private void getLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        if(session != null){
            session.removeAttribute("user");
        }
        Cookie[] cookie = request.getCookies();
        for(Cookie c : cookie){
            if(c.getName().equals("username")){
                c.setMaxAge(0);
                response.addCookie(c);
            }
        }

        response.sendRedirect("./login");
    }



    protected void getWaiting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            request.setAttribute("username", u.getUsername());
            if (u.getRole() == 1) {
                response. sendRedirect(request.getContextPath() + "/admin/home");
            }  else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
        else response.sendRedirect(request.getContextPath() + "/login");
    }
    protected void getLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            response.sendRedirect(request.getContextPath() + "/waiting");
            return;
        }

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    session = request.getSession(true);
                    session.setAttribute("username", cookie.getValue());
                    response.sendRedirect(request.getContextPath() + "/waiting");
                    return;
                }
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }






    protected void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isRemember = false;
        String remember = request.getParameter("remember");
        if(remember != null){
            isRemember = true;
            System.out.println("ok");
        }

        User user = userService.login(username, password);
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        if (user != null) {
            if(user.getStatus() == 1){
                if (isRemember) {
                    Cookie cookie = new Cookie("username", username);
                    System.out.println(cookie.getValue());
                    cookie.setMaxAge(60 * 60 * 24 * 30);
                    response.addCookie(cookie);
                }
                response.sendRedirect(request.getContextPath() + "/waiting");
            } else{
                response.sendRedirect(request.getContextPath()+"/verify-code");
            }
        } else {
            request.setAttribute("error", "Username or password is incorrect");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    protected void postForgetPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);
        User u = userService.findOneByEmail(email);
        if(u.getEmail().equals(email)){
            Email em = new Email();
            boolean test = em.sendEmailForgotPassword(u);
            if(test){
                request.setAttribute("msg","Success! New password has been sent to your email.");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            } else{
                request.setAttribute("msg","Send mail fail!!");
            }
        } else{
            request.setAttribute("msg","Email or Username is not correct!!");
            return;
        }
        request.getRequestDispatcher("forgotpassword.jsp").forward(request,response);
    }



    protected void postRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");

        String msg = "";
        if(userService.checkEmail(email) != null) {
            msg = "Email đã tồn tại";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }else if(userService.checkUsername(username) != null) {
            msg = "Username đã tồn tại";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }else{
            Email em = new Email();
            String code = em.getRandom();
            User u = new User(username,email,fullname,password,code);
            boolean test = (u.getStatus() == 0)?em.sendEmail(u):false;
            if(test){
                HttpSession s = request.getSession() ;
                s.setAttribute("user",u);
                if(userService.register(email,password,username,fullname,code)){
                    response.sendRedirect(request.getContextPath()+"/verify-code");
                } else {
                    msg = "Register Error!!";
                    request.setAttribute("msg",msg);
                    request.getRequestDispatcher("register.jsp").forward(request,response);
                }
            } else{
                msg = "Send mail Error!!";
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
        }
    }
    protected void postVerifyCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        try{
            int code = Integer.parseInt(request.getParameter("code"));
            HttpSession s = request.getSession();
            User u = (User) s.getAttribute("user");
            if(Integer.parseInt(u.getCode()) == code){
                u.setEmail(u.getEmail());
                u.setStatus(1);
                userService.updatestatus(u);
                msg = "Code is not correct";
                response.sendRedirect(request.getContextPath()+"/login");
            }else{
                msg = "Code is not correct";
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("verify-code.jsp").forward(request,response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
