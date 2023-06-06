/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class mainController extends HttpServlet {
    private String url = "errorpage.html";
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
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            
            if(action==null || action.equals("") || action.equals("search"))
                url="index.jsp";
            else if(action.equals("login"))
                url="LoginServlet";
            else if(action.equals("register"))
                url="RegisterServlet";
            else if(action.equals("logout"))
                url="logoutServlet";
//            change profile
            else if(action.equals("changePro"))
                url="updateProfile.jsp";
            else if(action.equals("change"))
                url="updateProfileServlet";
            
            else if(action.equals("viewOrdDetail"))
                url="viewOrdDetailServlet";
            else if(action.equals("viewCompletedOrd"))
                url="viewCompletedOrdServlet";
            else if(action.equals("viewCanceledOrd"))
                url="viewCanceledOrdServlet";
            else if(action.equals("viewProcessingOrd"))
                url="viewProcessingOrdServlet";
            
            
//            order status
            else if(action.equals("cancel"))
                url="cancelOrderServlet";
            else if(action.equals("reorder"))
                url="reorderServlet";
            
//            cart
            else if(action.equals("addtocart"))
                url="addToCartServlet";
            else if(action.equals("viewcart"))
                url="viewCart.jsp";
            else if(action.equals("update"))
                url="updateCartServlet";
            else if(action.equals("delete"))
                url="deleteCartServlet";
            else if(action.equals("saveOrder"))
                url="saveShoppingCartServlet";
            else if(action.equals("searchOrders"))
                url="getAllOrdersServlet";
            
//            manage accounts
            else if(action.equals("manageAccounts"))
                url="manageAccountsServlet";
            else if(action.equals("updateStatusAccount"))
                url="updateStatusAccountServlet";
            else if(action.equals("searchAccount"))
                url="searchAccountServlet";
            
//            manage orders
            else if(action.equals("manageOrders"))
                url="manageOrdersServlet";
            else if(action.equals("searchByCustomerID"))
                url="searchByCustomerIDServlet";
            else if(action.equals("searchByStatus"))
                url="searchByStatusServlet";
            else if(action.equals("completeOrder"))
                url="completeOrderServlet";
            
//            manage plants
            else if(action.equals("managePlants"))
                url="managePlantsServlet";
            else if(action.equals("searchPlant"))
                url="searchPlantServlet";
            else if(action.equals("addNewPlant"))
                url="addNewPlantServlet";
            else if(action.equals("updatePlantStatus"))
                url="updatePlantStatusServlet";
            else if(action.equals("editPlant"))
                url="editPlant.jsp";
            else if(action.equals("updatePlant"))
                url="updatePlantSerlvet";
            
//            manage category
            else if(action.equals("manageCategories"))
                url="manageCategoriesServlet";
            else if(action.equals("searchCategory"))
                url="searchCategoryServlet";
            else if(action.equals("addNewCate"))
                url="addNewCateServlet";
            else if(action.equals("editCatePage"))
                url="editCate.jsp";
            else if(action.equals("editCate"))
                url="editCateServlet";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
