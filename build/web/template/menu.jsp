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
    </head>
<<<<<<< HEAD
    <body> 
=======
    <body>
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf
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
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/categoryClient.jsp">Categorias</a>
                    </li>
                    <li class="nav-item">
<<<<<<< HEAD
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/registrarClientes.jsp">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/blogpage.jsp">Blog</a>
=======
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/sales/new_sale.jsp">Nueva venta</a>
                    </li>                                                                 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/roles.jsp">Rol</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/categoryClient.jsp">Categoria</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/marcas.jsp">Marcas</a>
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/users.jsp">Usuario</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/blog/blogpage.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
<<<<<<< HEAD
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/roles.jsp">Roles</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/models.jsp">Carros</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false"> Ventas
                        </a>
                        <div class="dropdown-menu" 
                             aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/SalesController">Ventas</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/NewSaleController">Nueva Venta</a>
                        </div>  
                    </li>    
=======
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/registrarClientes.jsp">Cliente</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/models.jsp">Auto</a>
                    </li>
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false">
                            Otros
                        </a>
<<<<<<< HEAD
                        <div class="dropdown-menu" 
                             aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/Marcas.jsp">Marcas</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/Catalogo.jsp">Catalogo</a>
                        </div>
=======
                        <form class="dropdown-menu" 
                              aria-labelledby="navbarDropdownMenuLink"
                              action="AuthController" method="POST">
                            <button name="btnLogOut" class="dropdown-item" type="submit">
                            </button>

                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/catalogo.jsp">Catalogo</a>
                        </form>
>>>>>>> 59b52186d128f857dff74922fde74d1b361cf4cf
                    </li>
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
                                Cerrar Sesión</button>
                        </form>
                    </li>
                </ul>
            </div>
        </nav>  