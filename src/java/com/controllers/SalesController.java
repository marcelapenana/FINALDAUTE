/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

<<<<<<< HEAD
import com.modelo.SaleTicketDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
=======
import java.io.IOException;
import javax.servlet.ServletException;
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis
 */
<<<<<<< HEAD
@WebServlet(name = "SalesController", urlPatterns = {"/SalesController"})
=======
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf
public class SalesController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
<<<<<<< HEAD

        SaleTicketDAO dao = new SaleTicketDAO();
        
        request.setAttribute("sales", dao.showAllSales());
        request.getRequestDispatcher("views/sales/sales.jsp").forward(request, response);
    }

=======
        
        String btnSave = request.getParameter("btnSave");
        
        if (btnSave != null) {
            
            
        } else {
            
            
        }
    }

    
    
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
