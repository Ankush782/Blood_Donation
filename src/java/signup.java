/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import data.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author aa
 */
public class signup extends HttpServlet {

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
       Users user=new Users();
        user.setFirstName(request.getParameter("fname").toLowerCase());
        user.setLastName(request.getParameter("lname").toLowerCase());
        user.setAge(Integer.parseInt(request.getParameter("age")));
        user.setSex(request.getParameter("sex").toLowerCase());
        user.setAddress(request.getParameter("address").toLowerCase());
        user.setCity(request.getParameter("city").toLowerCase());
        user.setState(request.getParameter("state").toLowerCase());
        user.setCountry(request.getParameter("country").toLowerCase());
        user.setPin(request.getParameter("pin").toLowerCase());
        user.setEmail(request.getParameter("email").toLowerCase());
        user.setBlood(request.getParameter("bgroup").toLowerCase());
        user.setPhone(request.getParameter("number"));
        user.setDonate(request.getParameter("donate"));
        user.setAccept(request.getParameter("accept"));
        user.setPassword(request.getParameter("password"));
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session s=sf.openSession();
        s.beginTransaction();
        int code=(int) s.save(user);
        if(code==0)
        {
            request.setAttribute("error", "Some error occured try again");
            request.getRequestDispatcher("error.jp").forward(request, response);
        }
        else
        {
            HttpSession https=       request.getSession();
            https.setAttribute("name",request.getParameter("fname"));
            https.setAttribute("userid", Integer.toString(code));
            https.setAttribute("number", request.getParameter("number"));
            request.setAttribute("msg", "You have registres succesfully");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        }
        
        s.getTransaction().commit();
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
