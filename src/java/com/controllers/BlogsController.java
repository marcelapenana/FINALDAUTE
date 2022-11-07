/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.Blog;
import com.modelo.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Esteban Alvarenga
 */
@WebServlet(name = "BlogsController", urlPatterns = {"/BlogsController"})
public class BlogsController extends HttpServlet {

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
            
           
            // VARIABLES
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            String header = request.getParameter("txtHeader");
            String parrafo = request.getParameter("txtParrafo");
            String datetime = request.getParameter("nowdate");
            String codigoUsuario = request.getParameter("txtAutor");
            String mensaje = "";
               
            // INSTANCIAS
            Blog bg = new Blog(codigo, header, parrafo, datetime, codigoUsuario, mensaje);
            BlogDAO bgDAO = new BlogDAO();

            // BOTONES
            if (request.getParameter("btnAgregar") != null) {
                int res = bgDAO.insertNewBlog(bg);
                mensaje = (res != 0) ? "BLOG INSERTADO" : "ERROR AL AGREGAR POST";
            } else if (request.getParameter("btnEditar") != null) {
                int res = bgDAO.actualizarBlog(bg);
                mensaje = (res != 0) ? "BLOG EDITADO" : "ERROR AL EDITAR EL BLOG";
            } else if (request.getParameter("btnEliminar") != null) {
                int res = bgDAO.eliminarBlogs(bg);
                mensaje = (res != 0) ? "BLOG ELIMINADO" : "ERROR AL ELIMINAR BLOG";
            }

            // MENSAJE Y RESPUESTA
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("views/blogpage.jsp").forward(request, response);
            
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
