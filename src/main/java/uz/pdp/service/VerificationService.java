package uz.pdp.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Objects;
import java.util.Properties;

@Service
public class VerificationService {

    @Autowired
    private final UserService userService;


    public VerificationService(UserService userService) {
        this.userService = userService;
    }

    public String sendVerificationCode(String email) {


        Properties props = getProps();

        Session session = getSession(props);
        String code = getUniqueCode();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setText("Your verification code is: " + code);
            Transport.send(message);
            return code;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkVerificationCode(String verificationCode, String ownerCode) {
        if(Objects.equals(verificationCode, ownerCode)) {
            return true;
        }
        return false;
    }




    private static Session getSession(Properties props) {
        return Session.getDefaultInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("boboyevsardor350@gmail.com", "qxmzzvhufybedxek");
                    }
                });
    }

    private Properties getProps() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", "true");

        return props;
    }

    private String getUniqueCode() {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 3; i++) {
            sb.append((char) (65 + (int) (Math.random() * ((90 - 65) + 1))));
            sb.append((int) (Math.random() * 10));
        }

        return sb.toString();
    }
}
