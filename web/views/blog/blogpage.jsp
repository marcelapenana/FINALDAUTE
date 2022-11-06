<%-- 
    Document   : blogpage
    Created on : 6 nov. 2022, 15:34:09
    Author     : najera
--%>
<%@page import="com.modelo.Blog"%>
<%@page import="com.modelo.BlogDAO"%>
<%@page import="com.modelo.UsersC"%>
<%@page import="com.modelo.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/blogstyles.css"/>
        <title>Clientes</title>
    </head>
    <body>
        <%@include file="../../template/menu.jsp" %>
        <%!
            UsersDAO usersDAO = new UsersDAO();
            BlogDAO blogDAO = new BlogDAO();
        %>

        <div class="container mt-4">
            <!-- Inicio de la Fila para replicar -->
            <div class="row mt-4">
                <div class="col-12 table-responsive-sm">                    
                    <table>
                        <thead class="text-center">
                            <tr>
                                <th scope="col">
                                    <div class="text-left">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#mdlFormulario">
                                            NUEVO POST
                                        </button>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                ArrayList<Blog> listaBlogs = blogDAO.mostrarBlogs();
                                for (Blog data : listaBlogs) {
                            %> 
                            <tr>
                                <td>
                                    <div class="page-timeline">
                                        <div class="vtimeline-point">
                                            <div class="vtimeline-icon">
                                                O
                                            </div>
                                            <div class="vtimeline-block">
                                                <span class="vtimeline-date"><%=data.getBlo_publish_date()%></span>
                                                <div class="vtimeline-content">
                                                    <h3 id="headerPlace"><%=data.getBlo_header()%></h3>
                                                    <ul class="post-meta list-inline">
                                                        <li class="list-inline-item">
                                                            <p><b>Autor:</b> <%=data.getUse_real_nameOT()%></p>
                                                            <input class="" name="txtCodeBlog" id="txtCodeBlog" value="<%=data.getBlo_id()%>" hidden>
                                                        </li>
                                                        <li class="list-inline-item">
                                                            <p><b>Publicado:</b> <%=data.getBlo_publish_date()%></p>
                                                        </li>
                                                    </ul>
                                                    <p>
                                                        <%=data.getBlo_paragraph()%>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table> 

                </div> 
            </div>  
        </div>
        ${msg}

        <!-- MODAL -->
        <div class="modal fade" id="mdlFormulario">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">NUEVO POST</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <form action="${pageContext.servletContext.contextPath}/BlogsController" method="POST">
                        <div class="modal-body">
                            <!-- Código del blog -->
                            <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" hidden>
                            Título
                            <input type="text" name="txtHeader" id="txtHeader" class="form-control" placeholder="'El Nuevo auto de KIA'" required maxlength="499" minlength="2">                                
                            Articulo
                            <textarea name="txtParrafo" id="txtParrafo" class="form-control" required placeholder="Escribe tu articulo aquí..." maxlength="499" minlength="10"></textarea>
                            <!--Fecha actual del post-->
                            <input type="text" name="nowdate" id="nowdate" class="form-control" readonly hidden required>
                            Autor
                            <select class="form-select form-control" id="sCodeUser" name="sCodeUser" required>
                                <%
                                    ArrayList<UsersC> listaUsers = usersDAO.mostrarU();
                                    for (UsersC elem : listaUsers) {
                                %>
                                <option value="<%=elem.getUseId()%>"><%=elem.getUseRealName()%> </option>
                                <%
                                    }
                                %>
                            </select>
                            <hr>
                            <p class="text-danger font-weight-light text-md-center"><b>¡¡IMPORTANTE!!</b><br>
                                Una vez publiques en el blog, no podras editarlo ni eliminarlo. 
                                Verifica bien tu contenido antes de subirlo.</p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-outline-primary" name="btnAgregar" id="btnAgregar">Publicar</button>
                            <!-- <button class="btn btn-outline-success" name="btnEditar" id="btnEditar">Editar</button> -->
                            <!-- <button class="btn btn-outline-danger" name="btnEliminar" id="btnEliminar">Eliminar</button> -->

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%
        if (request.getAttribute("mensaje") != null) {
    %>
    <script>alert("<%=request.getAttribute("mensaje")%>");</script>
    <%
        }
    %>
    <script>
        date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
        var resultados = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;

        document.getElementById("nowdate").value = resultados;
    </script>
</body>
<!-- <script src="{pageContext.servletContext.contextPath}/js/blogActions.js"></script> -->

</html>
