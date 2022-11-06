<%-- 
    Document   : models
    Created on : 6 nov. 2022, 11:51:24
    Author     : najera
--%>

<%@page import="com.modelo.Models"%>
<%@page import="com.modelo.Brands"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.ModelsDAO"%>
<%@page import="com.modelo.BrandsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AUTO</title>
    </head>
    <body>
        <%!
            BrandsDAO brandsDAO = new BrandsDAO();
            ModelsDAO modelsDAO = new ModelsDAO();
        %>
        <%@include file="../template/menu.jsp" %>
        <div class="container mt-4">
            <div class="row mt-4">
                <div class="col-12 table-responsive-sm">
                    <div class="text-center">
                        <table class="table table-info table-striped">
                            <tr>
                                <th scope="col">AUTO</th>                       
                            </tr>
                        </table>
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#mdlFormulario">
                            NUEVO AUTO
                        </button>
                    </div>

                    <hr>
                    <table class="table table-sm table-hover table-info table-bordered table-striped">
                        <thead class=" table-danger text-center">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Código</th>
                                <th scope="col">Modelo</th>
                                <th scope="col">Años</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Color</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Models> listaModels = modelsDAO.mostrarModels();
                                for (Models elem : listaModels) {
                            %>
                            <tr>
                                <td><%=elem.getModId()%></td>
                                <td><%=elem.getModCode()%></td>
                                <td><%=elem.getModName()%></td>
                                <td><%=elem.getModYear()%></td>
                                <td><%=elem.getModPrice()%></td>
                                <td><%=elem.getModColor()%></td>
                                <td><%=elem.getModBraname()%></td>
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
                        <form action="${pageContext.servletContext.contextPath}/ModelController" method="POST">
                            <div class="modal-body">
                                ID
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly>
                                Código
                                <input type="text" name="txtCodName" id="txtCodName" class="form-control" >
                                Nombre
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control">
                                Año
                                <input type="text" name="txtAnio" id="txtAnio" class="form-control">
                                Precio
                                <input type="number" name="txtPrecio" id="txtPrecio" class="form-control">
                                Color
                                <input type="text" name="txtColor" id="txtColor" class="form-control">
                                Marcas
                                <select name="sMarcas" class="form-control" id="sMarcas">                                    
                                    <%
                                        ArrayList<Brands> listaBrands = brandsDAO.mostrarB();
                                        for (Brands elem : listaBrands) {
                                    %>
                                    <option value="<%=elem.getBraID()%>"><%=elem.getBraName()%></option>  
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="modal-footer">
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
        <script>alert("<%=request.getAttribute("mensaje")%>")</script>
        <%
            }
        %>

    </body>
    <script src="${pageContext.servletContext.contextPath}/js/models.js"></script>
</html>
