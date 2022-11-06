/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.AuthDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Luis
 */
@WebServlet(name = "AuthController", urlPatterns = {"/AuthController"})
public class AuthController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session;
        String btnLogin = request.getParameter("btnLogin");
        String btnLogOut = request.getParameter("btnLogOut");

        if (btnLogin != null) {
            AuthDAO authDao = new AuthDAO();
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");
            
            session = request.getSession();
            
            session.setAttribute("user", user);
            
            boolean res = authDao.login(user, pass);

            if (res) {
                response.sendRedirect("NewSaleController");
                
            } else {
                request.setAttribute("errorMsg", "Usuario o contraseña incorrecta");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
        } else if (btnLogOut != null) {
            session = request.getSession();
            session.invalidate();
            
            response.sendRedirect("index.jsp"); 
        }
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