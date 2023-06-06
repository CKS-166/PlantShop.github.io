/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.AccountDAO;
import sample.dto.Account;
//for random token
import java.security.SecureRandom;
import java.util.ArrayList;
import sample.dao.OrderDAO;
import sample.dto.Order;

/**
 *
 * @author ASUS
 */
public class LoginServlet extends HttpServlet {
    private static SecureRandom random = new SecureRandom();
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
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            Account acc = null;
            try {
                acc = AccountDAO.getAccount(email, password);
                if(acc!=null){
                    if(acc.getRole()==1){
                        //admin page
                        HttpSession session = request.getSession(true);
                        if(session!=null){
                            session.setAttribute("name", acc.getFullname());
                            session.setAttribute("email", email);
                            session.setAttribute("admin", acc);
                            response.sendRedirect("AdminIndex.jsp");
                            
                        }
                        
                    }
                    else{ //user
                        //Using session to store the login's username and create a new file jsp name personalPage.jsp
                        HttpSession session = request.getSession(true);
                        if(session!=null){
                            session.setAttribute("name", acc.getFullname());
                            session.setAttribute("email", email);
                            session.setAttribute("phone", acc.getPhone());
                            session.setAttribute("user", acc);
                            ArrayList<Order> list = OrderDAO.getOrders(email);
                            request.setAttribute("orderlist", list);
                            request.getRequestDispatcher("personalPage.jsp").forward(request, response);
                            
                        }
                        
                    }
                }
                else{
                    request.setAttribute("WARNING", "Incorrect email or password!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
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
