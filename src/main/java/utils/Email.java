package utils;

import DAO.impl.UserDaoImpl;
import model.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class Email {

    private final String EmailFrom ="funnycode.softwareengineering@gmail.com";
    private final String PassFrom ="gaccxkxajpkzezzu";
    public String getRandom(){
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d",number);
    }

    public boolean sendEmail(User user) {
        boolean test = false;
        String toEmail = user.getEmail();
        String fromEmail = EmailFrom;
        String password = PassFrom;

        try {
            Properties pr = configEmail(new Properties());
            Session session = Session.getInstance(pr, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("[no-reply] Code Verification:");

            String htmlContent = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>FunnyCode - Verify Code</title><style>body {font-family: Arial, sans-serif;background-color: #fff9e6;color: #333;padding: 20px;}.container {max-width: 600px;margin: 0 auto;background-color: #fff;padding: 20px;border-radius: 8px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);}.header {background-color: #f0ad4e;color: #fff;padding: 10px;text-align: center;border-top-left-radius: 8px;border-top-right-radius: 8px;}.body {padding: 20px;text-align: center;font-size: 50px;}.footer {background-color: #f0ad4e;color: #fff;padding: 10px;text-align: center;border-bottom-left-radius: 8px;border-bottom-right-radius: 8px;}</style></head><body><div class=\"container\"><div class=\"header\"><h2>FunnyCode - Verify Code</h2></div><div class=\"body\"><p>" + user.getCode() + "</p></div><div class=\"footer\"><p>Đây là mã để xác thực tài khoản. Vui lòng không cung cấp mã này cho người khác!!!<br>Mọi chi tiết xin liên hệ <a style=\"color:#333\" href=\"https://www.facebook.com/khoaak71.vip\">Anh Khoa</a></p></div></div></body></html>";


            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    private Properties configEmail(Properties pr) {
        pr.put("mail.smtp.host", "smtp.gmail.com");
        pr.put("mail.smtp.port", "587");
        pr.put("mail.smtp.auth", "true");
        pr.put("mail.smtp.starttls.enable", "true");
        return pr;
    }
//    public boolean sendEmailForgotPassword(User user){
//        boolean test = false;
//        String toEmail = user.getEmail();
//        String fromEmail = EmailFrom;
//        String password = PassFrom;
//        try {
//            Properties pr = configEmail(new Properties());
//            Session session = Session.getInstance(pr, new Authenticator() {
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    return new PasswordAuthentication(fromEmail,password);
//                }
//            });
//            Message message = new MimeMessage(session);
//            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
//            message.setFrom(new InternetAddress(fromEmail));
//            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//            message.setSubject("[no-reply] Forgot Password");
//            user.setPassword(getRandom());
//            new UserDaoImpl().update(user);
//            message.setContent("Your new password is: <p style=\"color:red\">" + user.getPassword() + "</p><br> Please change your password after login.","text/html");
//            Transport.send(message);
//            test = true;
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return test;
//    }
    public boolean sendEmailForgotPassword(User user) {
        boolean test = false;
        String toEmail = user.getEmail();
        String fromEmail = EmailFrom;
        String password = PassFrom;

        try {
            Properties pr = configEmail(new Properties());
            Session session = Session.getInstance(pr, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("[no-reply] Forgot Password");
            user.setPassword(getRandom());
            new UserDaoImpl().update(user);

            String htmlContent = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>FunnyCode - Forgot Password</title><style>body {font-family: Arial, sans-serif;background-color: #fff9e6;color: #333;padding: 20px;}.container {max-width: 600px;margin: 0 auto;background-color: #fff;padding: 20px;border-radius: 8px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);}.header {background-color: #f0ad4e;color: #fff;padding: 10px;text-align: center;border-top-left-radius: 8px;border-top-right-radius: 8px;}.body {padding: 20px;text-align: center;font-size: 50px;}.footer {background-color: #f0ad4e;color: #fff;padding: 10px;text-align: center;border-bottom-left-radius: 8px;border-bottom-right-radius: 8px;}</style></head><body><div class=\"container\"><div class=\"header\"><h2>FunnyCode - Forgot Password</h2></div><div class=\"body\"><p>" + user.getPassword() + "</p></div><div class=\"footer\"><p>Đây là mật khẩu mới cho tài khoản của bạn. Vui lòng dùng mật khẩu này để đăng nhập vào tài khoản!!!<br>Mọi chi tiết xin liên hệ <a style=\"color:#333\" href=\"https://www.facebook.com/khoaak71.vip\">Anh Khoa</a></p></div></div></body></html>";

            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

        public static void main(String[] args) {
            Email em = new Email();
            User u = new User("QE180035", "mamgh789@gmail.com", "Nguyen Anh Khoa", "123", 0, 0, "678678");
            em.sendEmailForgotPassword(u);
        }

}


