/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import data.Ureq;
import data.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author aa
 */
public class reqservlet extends HttpServlet {

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
        Date d=new Date();
        Ureq ureq=new Ureq();
        ureq.setName((String)request.getSession().getAttribute("name"));
        ureq.setCity(request.getParameter("city"));
        ureq.setBgroup(request.getParameter("bgroup"));
        ureq.setUid(Integer.parseInt((String)request.getSession().getAttribute("userid")));
        ureq.setNumber((String)request.getSession().getAttribute("number"));
        ureq.setTime(d);
        ureq.setPlace(request.getParameter("location"));
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session s=sf.openSession();
        s.beginTransaction();
     s.save(ureq);
     String msg ="Hi\nMr."+request.getSession().getAttribute("name")+"wants blood urgently.\n"+request.getSession().getAttribute("name")+" is in your city.Help if possible and save life\nName : "+request.getSession().getAttribute("name")+"\nBlood-group : "+request.getParameter("bgroup")+"\nCity : "+request.getParameter("city")+"\nMobile : "+request.getSession().getAttribute("number");
         
         List<String> mail=s.createSQLQuery("select email from users where city='"+request.getParameter("city")+"'and donate='on'").list();
         System.out.print("Starting thread"+ mail.size());
         Thread th=new requestthread(mail, msg);
         th.start();
        
        s.getTransaction().commit();
        request.setAttribute("msg", "You have requested succesfully");
        request.getRequestDispatcher("success.jsp").forward(request, response);
        
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
