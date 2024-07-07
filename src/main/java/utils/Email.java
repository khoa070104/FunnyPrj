package utils;

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
    public boolean sendEmail(User user){
        boolean test = false;
        String toEmail = user.getEmail();
        String fromEmail = EmailFrom;
        String password = PassFrom;
        try {
            Properties pr = configEmail(new Properties());
            Session session = Session.getInstance(pr, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail,password);
                }
            });
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Code Verification");
            message.setText("Your verification code is: "+user.getCode());
            Transport.send(message);
            test = true;
        }catch (Exception e){
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

//    public static void main(String[] args) {
//        Email em = new Email();
//        User u = new User("QE180035", "mamgh789@gmail.com", "Nguyen Anh Khoa", "123", 0, 0, "678678");
//        em.sendEmail(u);
//    }

}


