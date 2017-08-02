
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author aa
 */
public class requestthread extends Thread{
   List<String> mail;
   String msg;
    public requestthread(List<String> mail,String msg) {
        this.mail=mail;
        this.msg=msg;
        
    }
    
    

    @Override
    public void run() {
         for(String to:mail)
        {
         
            System.out.print("Mailing");
             Properties props=new Properties();
        String id="kumarankush782@gmail.com";
        String password="codejam2018";
                props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
                javax.mail.Session session=javax.mail.Session.getInstance(props,   new javax.mail.Authenticator() 
                  
                  {
			protected PasswordAuthentication getPasswordAuthentication() 
                        
                        {
				return new PasswordAuthentication(id, password);
                                
			}
		  });
                		try {
 
			Message message = new MimeMessage(session);
                       
			
			message.setFrom(new InternetAddress(id));
                    
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));
                            // System.out.println("done");
			message.setSubject("Request for blood");
                       message.setText(msg);
 // System.out.println("done");
			Transport.send(message);
                                    
 
			
 
		} catch (MessagingException ee) {
			//throw new RuntimeException(ee);
                   // PrintWriter pr=response.getWriter();
                     

		}
            
        }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
