<%-- 
    Document   : models
    Created on : 6 nov. 2022, 11:51:24
    Author     : najera
--%>
<%@include file="../template/auth.jsp" %>
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
        <title>AUTOS</title>
    </head>
    <body>
        <style>
            #cursiva {
                color: #b9bbbe;
            }
        </style>
        <%!
            BrandsDAO brandsDAO = new BrandsDAO();
            ModelsDAO modelsDAO = new ModelsDAO();
        %>
        <%@include file="../template/menu.jsp" %>
        <div class="container mt-4">
            <div class="row mt-4">
                <div class="col-12 table-responsive-sm">
                    <div class="text-center">
                         <h2><strong>AUTOS</strong></h2>
                        <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#mdlFormulario">
                            NUEVO AUTO
                        </button>
                    </div>

                    <hr>
                    <table class="table table-sm table-hover table-light table-bordered table-striped">
                        <thead class=" table-danger text-center">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Código (VIN)</th>
                                <th scope="col">Nombre Modelo</th>
                                <th scope="col">Año</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Color</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <%                                ArrayList<Models> listaModels = modelsDAO.mostrarModels();
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
                                        <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#mdlFormulario" id="editar"><i class="fa-solid fa-pencil"></button>
                                        <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#mdlFormulario" id="eliminar"><i class="fa-solid fa-trash-can"></i></button>
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
                            <h5 class="modal-title">NUEVO MODELO / VEHICULO</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.servletContext.contextPath}/ModelController" method="POST">
                            <div class="modal-body">
                                ID
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly>
                                Código (VIN)

                                <input type="text" name="txtCodName" id="txtCodName" class="form-control" required minlength="15" maxlength="15" placeholder="EST3B4N41V4R3NG4">

                                <input type="text" name="txtCodName" id="txtCodName" class="form-control"  placeholder="">

                                Nombre Modelo
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control" required minlength="1" maxlength="50" placeholder="Picanto EX">
                                Año del Modelo
                                <input type="text" name="txtAnio" id="txtAnio" class="form-control" required minlength="4" maxlength="4" placeholder="2022">
                                Precio Unitario <i id="cursiva">(ingresar sin signo $).</i>
                                <input type="text" name="txtPrecio" id="txtPrecio" class="form-control" required minlength="4" maxlength="7" placeholder="20.000" pattern="[0-9.]+">
                                Color del Vehiculo
                                <select name="sMarColors" class="form-control" id="sMarColors" required>
                                    <option value="BLANCO">BLANCO</option>
                                    <option value="NEGRO">NEGRO</option>
                                    <option value="GRIS">GRIS</option>
                                    <option value="AZUL">AZUL</option>
                                    <option value="ROJO">ROJO</option>
                                    <option value="VERDE">VERDE</option>
                                    <option value="ROSADO">ROSADO</option>
                                    <option value="CELESTE">CELESTE</option>
                                    <option value="ANARANJADO">ANARANJADO</option>
                                    <option value="CAFE">CAFE</option>
                                    <option value="BEIGE">BEIGE</option>
                                </select>
                                Marca del Vehículo
                                <select name="sMarcas" class="form-control" id="sMarcas" required>
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
