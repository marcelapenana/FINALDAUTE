/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.Brands;
import com.modelo.BrandsDAO;
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
@WebServlet(name = "BrandControllers", urlPatterns = {"/BrandControllers"})
public class BrandsControllers extends HttpServlet {

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
            
             int bra_id =Integer.parseInt(request.getParameter("txtCodigo"));
           String bra_name= request.getParameter("txtNombre");
            
            
            Brands b=new Brands(bra_id, bra_name);
            BrandsDAO  brandsDAO =new BrandsDAO();
            
            
          int res = 0;
            String mensaje = "";
            if (request.getParameter("btnAgregar")!=null) {
                res =brandsDAO.insertarBrands(b);
                mensaje = (res!=0)?"modelo insertado con exito" : "Error al insertar modelo";
            }
           
            
            else if (request.getParameter("btnEditar")!=null) {
                res = brandsDAO.modificarBrands(b);
                mensaje = (res!=0)?"modelo editado con exito" : "Error al editar modelo";
            }
            
                else if (request.getParameter("btnEliminar")!=null) {
                res = brandsDAO.eliminarCliente(b);
                mensaje = (res!=0)?"modelo eliminado con exito" : "Error al eliminar  modelo";
            }
            request.setAttribute("mensaje",mensaje);
            request.getRequestDispatcher("views/marcas.jsp").forward(request, response);
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BrandControllers</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrandControllers at " + request.getContextPath() + "</h1>");
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
