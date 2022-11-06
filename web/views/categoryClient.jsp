<%-- 
    Document   : categoryClient
    Created on : 6 nov. 2022, 13:09:04
    Author     : najera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page import="com.modelo.CategoryClient"%>
    <%@page import="com.modelo.CategoryClientDAO"%>
    <%@page import="java.util.ArrayList"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CATEGORIA</title>
    </head>
    <body>
        <%!
            CategoryClientDAO categoryClientDAO = new CategoryClientDAO();
        %>
        <%@include file="../template/menu.jsp" %>

        <div class="container mt-4">       
            <hr>                      
            <div class="row text-center mt-4">
                <div class="col-12 table-responsive-sm">
                    <table class="table table-info table-striped">
                        <tr>
                            <th scope="col">CATEGORIA</th>                       
                        </tr>
                    </table>
                    <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#mdlFormulario">
                        NUEVA CATEGORIA
                    </button>
                    <hr>
                    <table class="table table-sm table-hover table-info table-bordered table-striped">
                        <thead class=" table-danger text-center">                
                            <tr>
                                <th scope="col">CÓDIGO</th>
                                <th scope="col">CATEGORIA</th>
                                <th scope="col">ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<CategoryClient> listaC = categoryClientDAO.mostrarC();
                                for (CategoryClient elem : listaC) {
                            %>
                            <tr>
                                <td><%=elem.getCatId()%></td>
                                <td><%=elem.getCatType()%></td>        
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
                            <h5 class="modal-title">CATEGORIA</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.servletContext.contextPath}/CategoryClientController" method="POST">
                            <div class="modal-body">
                                CÓDIGO
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly>
                                NOMBRE
                                <input type="text" name="txtCategoria" id="txtCategoria" class="form-control">                      
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-secondary" data-dismiss="modal">Cerrar</button>
                                <button class="btn btn-outline-success" name="btnAgregar" id="btnAgregar">Agregar</button>
                                <button class="btn btn-outline-primary" name="btnEditar" id="btnEditar">Editar</button>
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


    </body>
    <script src="${pageContext.servletContext.contextPath}/js/categoryClient.js"></script>
</html>
