<%-- 
    Document   : registrarClientes
    Created on : 6 nov. 2022, 14:23:43
    Author     : najera
--%>
<%@include file="../template/auth.jsp" %>
<%@page import="com.modelo.CategoryClient"%>
<%@page import="com.modelo.CategoryClientDAO"%>
<%@page import="com.modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
        <%!
            ClienteDAO clienteDAO = new ClienteDAO();
            CategoryClientDAO categryClientDAO = new CategoryClientDAO();
        %>
        <%@include file="../template/menu.jsp" %>

        <div class="container mt-4">
            <div class="row mt-6">
                <div class="col-12 table-responsive-sm">
                    <div class="text-center">
                    
                        <h2><strong>CLIENTES</strong></h2>
                    
                    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#mdlFormulario">
                            NUEVO CLIENTE
                        </button>
                    </div>

                    <hr>
                    <table class="table table-sm table-hover table-light table-bordered table-striped">
                        <thead class=" table-danger text-center"> 
                            <tr>
                                <th scope="col">CÓDIGO</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">NACIMIENTO</th>
                                <th scope="col">DUI</th>
                                <th scope="col">RESIDENCIA</th>
                                <th scope="col">TELEFONO</th>
                                <th scope="col">CATEGORIA</th>
                                <th scope="col">ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Cliente> listaClientes = clienteDAO.mostrarClientes();
                                for (Cliente elem : listaClientes) {
                            %>
                            <tr>
                                <td><%= elem.getCli_id()%></td>
                                <td><%= elem.getCli_name()%></td>
                                <td><%= elem.getCli_date_birth()%></td>
                                <td><%= elem.getCli_dui()%></td>
                                <td><%= elem.getCli_residence()%></td>
                                <td><%= elem.getCli_telephone()%></td>
                                <td><%= elem.getCat_type()%></td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#mdlFormulario" id="editar"><i class="fa-solid fa-pencil"></i></button>
                                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mdlFormulario" id="eliminar"><i class="fa-solid fa-trash-can"></i></button>
                                    </div>
                                </td>
                            </tr> 
                            <% }%>
                        </tbody>
                    </table> 
                </div> 
            </div>                         
            ${msg}

            <!-- MODAL -->
            <div class="modal fade" id="mdlFormulario">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">NUEVO CLIENTE</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.servletContext.contextPath}/NewClientController" method="POST">
                            <div class="modal-body">
                                <!-- CÓDIGO -->
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" hidden>
                                NOMBRE
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control" placeholder="Esteban Alvarenga">
                                FECHA DE NACIMIENTO
                                <input type="date" name="txtFechaNac" id="txtFechaNac" class="form-control" required>
                                DUI
                                <input type="text" name="txtDUI" id="txtDUI" class="form-control" required placeholder="12345678-9" minlength="10" maxlength="10" pattern="[0-9]{8}-[0-9]{1}">
                                RESIDENCIA
                                <textarea name="txtResidencia" id="txtResidencia" class="form-control" required placeholder="#Casa, Colonia-Residencia, Municipio, Departamento, País" minlength="10" maxlength="100" pattern="[A-Za-z0-9]+"></textarea>
                                TELEFONO
                                <input type="text" name="txtCelular" id="txtCelular" class="form-control" required placeholder="0470-2121" required minlength="9" maxlength="9" pattern="[0-9]{4}-[0-9]{4}">
                                CATEGORIA
                                <select class="form-select form-control" id="sCategorias" name="sCategorias">
                                    <%
                                        ArrayList<CategoryClient> categoClients = categryClientDAO.mostrarC();
                                        for (CategoryClient elem : categoClients) {
                                    %>
                                    <option value="<%=elem.getCatId()%>"><%=elem.getCatType()%> </option>
                                    <%
                                        }
                                    %>
                                </select> 
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-dark" data-dismiss="modal">Cerrar</button>
                                <button class="btn btn-outline-primary" name="btnAgregar" id="btnAgregar">Agregar</button>
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
    </body>
    <script src="${pageContext.servletContext.contextPath}/js/clientActions.js"></script>
</html>
