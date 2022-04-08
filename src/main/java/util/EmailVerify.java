package util;

import Model.Party;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.ResourceBundle;

public class EmailVerify {

    public String SendOtp() {
        int randNo = (int) (Math.random() * 9000) + 1000;
        return String.valueOf(randNo);

    }
    public static boolean sendEmail(Party party) throws MessagingException {
        String name = party.getFirstName();
        String otpStr = "Hello.. " + name + "Sir , Please Verify Your Account..... : " + party.getOtp()+ "\n";
        System.out.println(party.getOtp());
        String message = " \n" + "Krishna Pratap Kumawat(KPK).....";
        System.out.println("otp :" + otpStr);
        String subject = "Email Verification Code";
        String to = party.getUserName();


        //gmail host variable
        String host = "smtp.gmail.com";
        Properties p = System.getProperties();

        p.put("mail.smtp.host", host);
        p.put("mail.smtp.port", 465);
        p.put("mail.smtp.ssl.enable", true);
        p.put("mail.smtp.auth", true);
        final String[] userName = {" "};
        final String[] passWord = {" "};

        Session session = Session.getInstance(p, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                ResourceBundle rd;
                rd = ResourceBundle.getBundle("mail");
                userName[0] = rd.getString("username");
                passWord[0] = rd.getString("password");

                return new PasswordAuthentication(userName[0], passWord[0]);
            }
        });
        session.setDebug(true);
        MimeMessage mimeMessage = new MimeMessage(session);
        try {


            mimeMessage.setFrom(userName[0]);
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(otpStr + message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            Transport.send(mimeMessage);
            System.out.println("sent Successfully");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return  false;
    }


}



