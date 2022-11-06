/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  
 * @author Luis
 */
public class NewSaleController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String car = request.getParameter("carCode");
        String client = request.getParameter("clientCode");
        String btnSave = request.getParameter("btnSave");
        
        //Si traen valor el código del cliente o el codigo del carro
        if (car != null || client != null) {
            //Se busca el carro
            if (car != null) {
                response.getWriter().write("Response");
                
            } else if (client != null) {   
                System.out.println("Esto: " + client);
                response.getWriter().write("Response");
            }   
              
        } else {
            if (btnSave != null) {
                

            } else {
                this.newOrder(request, response);

            }
        }    
    }
    
    protected void newOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/sales/new_sale.jsp")
                .forward(request, response);
    }  

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