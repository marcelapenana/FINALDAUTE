/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.CategoryClient;
import com.modelo.CategoryClientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author najera
 */
@WebServlet(name = "CategoryClientController", urlPatterns = {"/CategoryClientController"})
public class CategoryClientController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            String categoria = request.getParameter("txtCategoria");            

            CategoryClient cat = new CategoryClient(codigo, categoria);
            CategoryClientDAO catDAO = new CategoryClientDAO();
            String mensaje="";
          
            if (request.getParameter("btnAgregar") != null) {
                int res = catDAO.insertarC(cat);
                mensaje = (res != 0) ? "CATEGORIA INSERTADA" : "ERROR AL INSERTAR";
            }
            if (request.getParameter("btnEliminar") != null) {
                int res = catDAO.eliminarC(cat);
                mensaje = (res != 0) ? "CATEGORIA ELIMINADA" : "ERROR AL ELIMINAR";
            }
            if (request.getParameter("btnEditar") != null) {
                int res = catDAO.modificarC(cat);
                mensaje = (res != 0) ? "CATEGORIA MODIFICADA" : "ERROR AL MODIFICAR ";
            }

            request.setAttribute("mensaje", mensaje);

            request.getRequestDispatcher("views/categoryClient.jsp").forward(request, response);
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoryClientController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryClientController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
