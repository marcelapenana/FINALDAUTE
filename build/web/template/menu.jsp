<%-- 
    Document   : menu
    Created on : 6 oct. 2022, 18:14:32
    Author     : Marcela Najera
--%>

<%@page session="true" %>
<%

    HttpSession _session = request.getSession();

    //String nombre = (String) _session.getAttribute("nombre");
    //String rol = (String) _session.getAttribute("rol");
    String user = (String) _session.getAttribute("user");
%>    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" >
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- FONT AWESOME-->  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
        <link href="${pageContext.servletContext.contextPath}/resources/css/menu.css" rel="stylesheet" >
        <!-- Google Charts -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>  
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />
        
        <style>
        body {
           background: #654ea3;  /* fallback for old browsers */
           background: -webkit-linear-gradient(to right, #eaafc8, #654ea3);  /* Chrome 10-25, Safari 5.1-6 */
           background: linear-gradient(to right, #eaafc8, #654ea3); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

        }
        
        </style>
    </head>
    <body> 


    <body> 

    <body>
        

        <nav id="nav" class="navbar navbar-expand-lg navbar-dark bg-dark">

            <button class="navbar-toggler" type="button" data-toggle="collapse" 
                    data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
           
            
            
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="navbar-brand" 
                           href="${pageContext.servletContext.contextPath}/index.jsp">
                            SRVD | Home <span class="sr-only">(current)</span></a>
                        <!-- Sistema para registrar ventas del dia-->
    
                    </li>
                    
            <%
            if (user != null) {                                  
            %>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/registrarClientes.jsp">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/blogpage.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/categoryClient.jsp">Categorias</a>
                    </li>      
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/users.jsp">Usuario</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/roles.jsp">Roles</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/models.jsp">Autos</a>

                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false"> Reportes
                        </a>
                        <div class="dropdown-menu" 
                             aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/reportesn/reporte2.jsp">Ventas realizadas a cada cliente</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/reportesn/reporte4.jsp">Ventas totales diarias</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/reportesn/reporte5.jsp">Ventas totales a a la fecha</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/reportes/reporte1.jsp">Autos filtrados por marca</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/reportes/reporte3.jsp">Clientes filtrados por categoria</a>
                              
                        </div>  
                    </li>                                                                                                                                                                                                                                      
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false"> ventas
                        </a>
                        <div class="dropdown-menu" 
                             aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/SalesController">Ventas</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/NewSaleController">Nueva Venta</a>

                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/DashBoardController">Ventas por dia</a>
                        </div>  
                    </li>                                         
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false">
                            Otros
                        </a>
                        <div class="dropdown-menu" 
                             aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/Marcas.jsp">Marcas</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/Catalogo/Catalogo.jsp">Catalogo</a>
                        </div>

                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false">
                            ${user}
                        </a>
                        <form class="dropdown-menu" 
                              aria-labelledby="navbarDropdownMenuLink"
                              action="${pageContext.servletContext.contextPath}/AuthController" method="POST">
                            <button name="btnLogOut" class="dropdown-item" type="submit">
                                Cerrar Sesi??n</button>
                        </form>
                    </li>
                        </div>                                          
             
                              
            <%
            }else{         
            %>
            
             <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/registrarClientes.jsp">INICIAR SESION</a>
             </li>
            <%}%>
            
                </ul>
            </div>
        </nav> 
                            
                            