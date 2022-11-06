/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.Models;
import com.modelo.ModelsDAO;
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
@WebServlet(name = "ModelController", urlPatterns = {"/ModelController"})
public class ModelController extends HttpServlet {

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
            
            
            int modId = Integer.parseInt(request.getParameter("txtCodigo"));
            String modCode = request.getParameter("txtCodName");
            String modName = request.getParameter("txtNombre");
            String modYear = request.getParameter("txtAnio");
            double modPrice = Double.parseDouble(request.getParameter("txtPrecio"));
            String modColor = request.getParameter("txtColor");
            int modBrandid = Integer.parseInt(request.getParameter("sMarcas"));
            
            Models m = new Models(modId, modCode, modName, modYear, modPrice, modColor, modBrandid, "");
            ModelsDAO modelsDAO = new ModelsDAO();
            
            int res = 0;
            String mensaje = "";
            // Botones para realizar crud
            if (request.getParameter("btnAgregar") != null) {
                res = modelsDAO.insertarModels(m);
                mensaje = (res != 0) ? "Auto Insertado " : "Error al insertar";
            } else if (request.getParameter("btnEditar") != null) {
                res = modelsDAO.modificarModels(m);
                mensaje = (res != 0) ? "Auto modificado " : "Error al modificar";
            } else if (request.getParameter("btnEliminar") != null) {
                res = modelsDAO.eliminarModels(m);
                mensaje = (res != 0) ? "Auto eliminado" : "Error al eliminar";
            }
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("views/models.jsp").forward(request, response);
                       
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModelController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModelController at " + request.getContextPath() + "</h1>");
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
