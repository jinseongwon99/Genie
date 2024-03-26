/*
 * package dao;
 * 
 * import java.util.Properties;
 * 
 * import javax.mail.Message; import javax.mail.MessagingException; import
 * javax.mail.PasswordAuthentication; import javax.mail.Session; import
 * javax.mail.Transport; import javax.mail.internet.InternetAddress; import
 * javax.mail.internet.MimeMessage;
 * 
 * public class SendMail { public static void googleMailSend() { String host =
 * "smtp.google.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 String user =
 * "yuuu415bin@gmail.com"; String password = "azixpdcvimlgsidf";
 * 
 * // SMTP 서버 정보를 설정한다. Properties props = new Properties();
 * props.put("mail.smtp.auth", true); props.put("mail.smtp.starttls.enable",
 * "true"); props.put("mail.smtp.host", "smtp.mailtrap.io");
 * props.put("mail.smtp.port", "465"); props.put("mail.smtp.ssl.trust",
 * "smtp.mailtrap.io");
 * 
 * props.put("mail.smtp.ssl.protocols", "TLSv1.2");
 * 
 * Session session = Session.getDefaultInstance(props, new
 * javax.mail.Authenticator() { protected PasswordAuthentication
 * getPasswordAuthentication() { return new PasswordAuthentication(user,
 * password); } });
 * 
 * try { MimeMessage message = new MimeMessage(session); message.setFrom(new
 * InternetAddress(user)); message.addRecipient(Message.RecipientType.TO, new
 * InternetAddress(user));
 * 
 * // 메일 제목 message.setSubject("kic teamPro genie팀 임시 비밀번호 송부");
 * 
 * // 메일 내용 message.setText("teamPro Success!!");
 * 
 * // send the message Transport.send(message);
 * System.out.println("Success Message Send");
 * 
 * } catch (MessagingException e) { e.printStackTrace(); } }
 * 
 * public static void main(String[] args) { googleMailSend(); }
 * 
 * }
 */