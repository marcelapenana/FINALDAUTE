<%-- 
    Document   : menu
    Created on : 6 nov. 2022, 10:41:44
    Author     : najera
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MENU</title>
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- FONT AWESOME-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
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
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/sales/sales.jsp">Venta</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/sales/new_sale.jsp">Nueva venta</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/categoryClient.jsp">Categoria</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/registrarClientes.jsp">Cliente</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/blog/blogpage.jsp">B</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/users.jsp">Usuario</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/roles.jsp">Rol</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/views/models.jsp">Auto</a>
                    </li>
                    

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" 
                           id="navbarDropdownMenuLink" data-toggle="dropdown" 
                           aria-haspopup="true" aria-expanded="false">
                            Otros
                        </a>
                        <form class="dropdown-menu" 
                              aria-labelledby="navbarDropdownMenuLink"
                              action="AuthController" method="POST">
                            <button name="btnLogOut" class="dropdown-item" type="submit">
                            </button>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/Marcas.jsp">b</a>
                            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/views/Catalogo.jsp">C</a>
                        </form>
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
    </body>
</html>
