<%-- 
    Document   : reporte2
    Created on : 7 nov. 2022, 16:20:20
    Author     : najera
--%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="com.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                    Conexion con = new Conexion();
                    con.conectar();
                    File file = new File(application.getRealPath("reportesn/reporte2.jasper"));
                    byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), null, con.getCon());
                    
                    ServletOutputStream output = response.getOutputStream();
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    
                    output.write(bytes);//para escribir
                    output.flush();
                    output.close();//cerrar
                    
                    
                } catch (Exception e) {
                System.out.println("Error: "+e.getMessage());
                }
        %>
    </body>
</html>
