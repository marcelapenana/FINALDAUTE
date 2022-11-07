<%-- 
    Document   : users
    Created on : 6 nov. 2022, 13:58:12
    Author     : najera
--%>

<%@page import="com.modelo.RolesDAO"%>
<%@page import="com.modelo.RolesC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.UsersC"%>
<%@page import="com.modelo.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
    </head>
    <body>
        <%!
            UsersDAO usersDAO = new UsersDAO();
            RolesDAO rolesDAO = new RolesDAO();
            RolesC rolesCDAO=new RolesC();
        %>
        <%@include file="../template/menu.jsp" %>

        <div class="container mt-4">                                   
            <div class="row text-center mt-4">
                <div class="col-12 table-responsive-sm">
                    <table class="table table-info table-striped">
                        <tr>
                            <th scope="col">USUARIO</th>                       
                        </tr>
                    </table>
                    <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#mdlFormulario">
                        NUEVA USUARIO
                    </button>
                    <hr>
                    <table class="table table-sm table-hover table-info table-bordered table-striped">
                        <thead class=" table-danger text-center">    
                            <tr>
                                <th scope="col">CÓDIGO</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">USUARIO</th>
                                <th scope="col">CONTRASEÑA</th>
                                <th scope="col">ROL</th>                     
                                <th scope="col">ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<UsersC> listaU = usersDAO.mostrarU();
                                for (UsersC elem : listaU) {
                            %>
                            <tr>
                                <td><%=elem.getUseId()%></td>
                                <td><%=elem.getUseRealName()%></td>   
                                <td><%=elem.getUserName()%></td>
                                <td><%=elem.getPassword()%></td>
                                <td><%=elem.getRolId()%></td>                      
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#mdlFormulario" id="editar">Editar</button>
                                        <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#mdlFormulario" id="eliminar">Eliminar</button>
                                    </div>
                                </td>
                            </tr> 
                            <% }%>
                        </tbody>
                    </table> 
                </div> 
            </div>                         
            ${msg}
            <div class="modal fade" id="mdlFormulario">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">USUARIO</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.servletContext.contextPath}/Users" method="POST">
                            <div class="modal-body">
                                CÓDIGO
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly>
                                NOMBRE
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control">
                                USUARIO
                                <input type="text" name="txtUsuario" id="txtUsuario" class="form-control">
                                CONTRASEÑA
                                <input type="text" name="txtContra" id="txtContra" class="form-control">
                                ROL
                                <select name="sRol" class="form-control" id="sRol">                                    
                                    <%
                                        ArrayList<RolesC> listaR = rolesDAO.mostrarR();
                                        for (RolesC elem : listaR) {
                                    %>                                   
                                    <option value="<%=elem.getIdRol()%>"><%=elem.getRolType()%></option>
                                    <%
                                        }
                                    %>
                                </select>                 
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-secondary" data-dismiss="modal">Cerrar</button>
                                <button class="btn btn-outline-success" name="btnAgregar" id="btnAgregar">Agregar</button>
                                <button class="btn btn-outline-success" name="btnEditar" id="btnEditar">Editar</button>
                                <button class="btn btn-outline-danger" name="btnEliminar" id="btnEliminar">Eliminar</button>
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
        <script src="${pageContext.servletContext.contextPath}/js/users.js"></script>
    </body>
</html>
