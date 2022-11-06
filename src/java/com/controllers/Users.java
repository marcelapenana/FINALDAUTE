/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.UsersC;
import com.modelo.UsersDAO;
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
@WebServlet(name = "Users", urlPatterns = {"/Users"})
public class Users extends HttpServlet {

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
           String nombre =request.getParameter("txtNombre");
           String usuario =request.getParameter("txtUsuario");
           String pass =request.getParameter("txtContra");
           
           int rol = Integer.parseInt(request.getParameter("sRol"));
                               
           UsersC user =new UsersC(codigo, nombre, usuario, pass, rol);
           UsersDAO userDAO=new UsersDAO();
           
            String mensaje="";
            
            
            
             if (request.getParameter("btnAgregar")!=null) {
                int res= userDAO.insertarU(user);
                mensaje=(res!=0)?"USUARIO INSERTADO":"Error al insertar";
            }
            if (request.getParameter("btnEliminar")!=null) {
                int res= userDAO.eliminarU(user);
                mensaje=(res!=0)?"USUARIO ELIMINAR":"Error al eliminar";
            }
            if (request.getParameter("btnEditar")!=null) {
                int res= userDAO.modificarU(user);
                mensaje=(res!=0)?"USUARIO MODIFICADO":"Error al modificar";
            }
                               
          
            request.setAttribute("mensaje", mensaje);
                      
            request.getRequestDispatcher("views/users.jsp").forward(request, response); 
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Users</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Users at " + request.getContextPath() + "</h1>");
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
