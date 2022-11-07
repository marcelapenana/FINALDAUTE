<%-- 
    Document   : reporte3
    Created on : 7 nov. 2022, 09:44:01
    Author     : najera
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="com.conexion.Conexion"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.modelo.CategoryClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.CategoryClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REPORTE CLIENTES POR CATEGORIA</title>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <%!
            CategoryClientDAO categoryClientDAO = new CategoryClientDAO();
        %>
        <br>
        <div class="container align-content-center">             
            <div class="row justify-content-md-center" class="border border-danger">               
                <div class="col col-lg-4 text-cener " class="border border-danger"> 
                    <figure>
                        <blockquote class="blockquote">
                            <p>CLIENTE FILTRAFO POR CATEGORIA</p>
                        </blockquote>
                        <figcaption class="blockquote-footer">
                               SELECCIONE UNA CATEGORIA <cite title="Source Title"></cite>
                        </figcaption>
                    </figure>

                    <form method="POST" target="_blank">
                       
                        <select class="form-control" name="sCategorias">
                            <%                    
                                 ArrayList<CategoryClient> listarC = categoryClientDAO.mostrarC();
                                 for (CategoryClient elem : listarC) {
                            %>
                            <option value="<%=elem.getCatId()%>"><%=elem.getCatType()%></option>
                            <%
                                }
                            %>
                        </select>
                        <br>
                        <center><button name="btnGenerar" class="btn btn-outline-info btn-sm">Generar reporte</button></center>
                   
                    </form>                       
                </div>
            </div>             
        </div>


        <%
            if (request.getParameter("btnGenerar") != null) {
                try {
                    //Capturar datos
                    int selectCategoria = Integer.parseInt(request.getParameter("sCategorias"));
                    HashMap parametros = new HashMap();
                    parametros.put("id", selectCategoria);
                    
                    Conexion con = new Conexion();
                    con.conectar();
                    File file = new File(application.getRealPath("reportes/reporte3.jasper"));
                    byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), parametros, con.getCon());


                    response.reset();
                    ServletOutputStream output = response.getOutputStream();
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);



                    output.write(bytes);
                    output.flush();
                    output.close();



               } catch (Exception e) {
                    out.println("Error " + e.getMessage());
                }
            }
        %>
    </body>
</html>
