
package com.learn.shopandcart.servlets;

import com.learn.shopandcart.dao.userDao;
import com.learn.shopandcart.entities.User;
import com.learn.shopandcart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class test1 extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            try {
                String userName=request.getParameter("user_name");
                String userEmail=request.getParameter("user_email");
                String userPassword=request.getParameter("user_password");
                String userPhone=request.getParameter("user_phone");
                String userAddress=request.getParameter("user_address");
               // validations
               
               
               if(userName.isEmpty())
               {
                   out.println("Name is Blank");
                   return;
               }
               //Createing user object to store data
              // User user=new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");
               
               Session session = FactoryProvider.getfactory().openSession();
               Transaction transaction = session.beginTransaction();
        String q1="update User u set u.userName =:n,u.userpassword =:p,u.userPhone =:po,u.userAddress =:a where u.userEmail =:pre";
        
        Query q = session.createQuery(q1);
        q.setParameter("n",userName);q.setParameter("p",userPassword);q.setParameter("po",userPhone);q.setParameter("a",userAddress);
        q.setParameter("pre",userEmail);
        int c=q.executeUpdate();
        System.out.println(userName);
        System.out.println(userPassword);
        System.out.println(userPhone);
        System.out.println(userAddress);
        System.out.println(userEmail);
        
        //Long userCount=(Long)qu1.list().get(0);
        //Long productCount=(Long)qu2.list().get(0);
        //Map<String,Long> map=new HashMap<>();
        //map.put("userCount",userCount);
        //map.put("productCount",productCount);
        transaction.commit();
        session.clear();
        session.close();
               
               
               
               HttpSession httpsession=request.getSession();
               httpsession.setAttribute("message","Changes Successful!!!");
               response.sendRedirect("normal.jsp");
               return;
                       
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
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
