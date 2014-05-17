 import java.util.*;
 import javax.mail.*;
 import javax.mail.internet.*;
 import javax.activation.*;
import javax.servlet.http.*;
import javax.net.ssl.*;
public class MailSend 
{
final static String host = "smtp.gmail.com";
final  static String from="bideasy1@gmail.com";  // write your email address means from email 
final static String password="everythingisplanned";
static boolean sessionDebug = true;

public  void SendMail(String to,String subject,String messageText)throws Exception
	{
Properties props = System.getProperties();
props.put("mail.smtp.starttls.enable","true");
props.setProperty("mail.transport.protocol","smtp");
props.setProperty("mail.host",host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "587");    //port is 587 for TLS  if you use SSL then port is 465
props.put("mail.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {
	return new PasswordAuthentication(from, password);
}
});
 

mailSession.setDebug(sessionDebug);
 
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(messageText);

Transport transport = mailSession.getTransport("smtp");
transport.connect(host, from, password);
transport.sendMessage(msg, msg.getAllRecipients());
transport.send(msg);
transport.close();
}

public  void SendBulkMail(String to[],String subject,String messageText)throws Exception
	{
Properties props = System.getProperties();
props.put("mail.smtp.starttls.enable","true");
props.setProperty("mail.transport.protocol","smtp");
props.setProperty("mail.host",host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "587");    //port is 587 for TLS  if you use SSL then port is 465
props.put("mail.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {
	return new PasswordAuthentication(from, password);
}
});
 

mailSession.setDebug(sessionDebug);
 
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = new InternetAddress[to.length];

 for( int i=0; i < to.length; i++ )
              { // changed from a while loop
                  address[i] = new InternetAddress(to[i]);
              }
			  for( int j=0; j < address.length; j++)
             { // changed from a while loop
             msg.addRecipient(Message.RecipientType.TO, address[j]);
             }
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(messageText);

Transport transport = mailSession.getTransport("smtp");
transport.connect(host, from, password);
transport.sendMessage(msg, msg.getAllRecipients());
transport.send(msg);
transport.close();
}


}