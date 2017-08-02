/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aa
 */
public class ask extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String name=request.getParameter("name");
       String city=request.getParameter("city");
       String email=request.getParameter("email");
       String mob=request.getParameter("mob");
       String querry=request.getParameter("query");
       String msg="From : "+name+"\ncity : "+city+"\nemail : "+email+"\nMobile : "+mob+"\nMessage : "+querry;
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
				InternetAddress.parse(id));
                            // System.out.println("done");
			message.setSubject("Querry");
                       message.setText(msg);
 // System.out.println("done");
			Transport.send(message);
                                    
 
			
 
		} catch (MessagingException ee) {
			//throw new RuntimeException(ee);
                   // PrintWriter pr=response.getWriter();
                     

		}
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
