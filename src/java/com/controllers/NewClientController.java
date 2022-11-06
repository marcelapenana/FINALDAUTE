/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.Cliente;
import com.modelo.ClienteDAO;
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
@WebServlet(name = "NewClientController", urlPatterns = {"/NewClientController"})
public class NewClientController extends HttpServlet {

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
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            String nombre = request.getParameter("txtNombre");
            String fechaNac = request.getParameter("txtFechaNac");
            String dui = request.getParameter("txtDUI");
            String residencia = request.getParameter("txtResidencia");
            String telefono = request.getParameter("txtCelular");
            int codeCategoria = Integer.parseInt(request.getParameter("sCategorias"));
            String mensaje = "";

            // INSTANCIAS
            Cliente cli = new Cliente(codigo, nombre, fechaNac, dui, residencia, telefono, codeCategoria, mensaje);
            ClienteDAO cliDAO = new ClienteDAO();

            // BOTONES
            if (request.getParameter("btnAgregar") != null) {
                int res = cliDAO.insertarCliente(cli);
                mensaje = (res != 0) ? "CLIENTE INSERTADO" : "ERROR AL INSERTAR";
            } else if (request.getParameter("btnEliminar") != null) {
                int res = cliDAO.eliminarClientes(cli);
                mensaje = (res != 0) ? "CLIENTE ELIMINADO" : "ERROR AL ELIMINAR";
            } else if (request.getParameter("btnEditar") != null) {
                int res = cliDAO.actualizarClientes(cli);
                mensaje = (res != 0) ? "CLIENTE MODIFICADO" : "ERROR AL MODIFICAR ";
            }

            // MENSAJE Y RESPUESTA
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("views/registrarClientes.jsp").forward(request, response);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewClientController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewClientController at " + request.getContextPath() + "</h1>");
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
