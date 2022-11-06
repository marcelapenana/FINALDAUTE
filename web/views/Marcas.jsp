<%-- 
    Document   : Marcas
    Created on : 6 nov. 2022, 14:46:28
    Author     : najera
--%>
<%@page import="com.modelo.Brands"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.BrandsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%!
   

        BrandsDAO brandsDAO = new BrandsDAO();

    %>
    <%@include file="../template/menu.jsp" %>
    <div class="container mt-4">
        <div class="row text-center mt-4">
                <div class="col-12 table-responsive-sm"> 
         <table class="table table-info table-striped">
                        <tr>
                            <th scope="col">MARCAS</th>                       
                        </tr>
                    </table>
        <!-- Botón para agregar -->
        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#mdlFormulario">
        NUEVA MARCA
        </button>
        <br>
         <hr>
        <!-- Tabla -->
        <table class="table table-sm table-hover table-info table-bordered table-striped">
                        <thead class=" table-danger text-center">
                <tr>
                    <th scope="col">CODIGO</th>
                    <th scope="col">NOMBRE</th>
                    <th scope="col">ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%       ArrayList<Brands> listaBrands = brandsDAO.mostrarBrands();
                    for (Brands  elem : listaBrands) {
                %>
                <tr>


                    <td><%=elem.getBraID()%></td>
                    <td><%=elem.getBraName()%></td>
                    
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#mdlFormulario" id="editar">Editar</button>
                            <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mdlFormulario" id="eliminar">Eliminar</button>
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

        <!-- Modal para agregar-->
        <div class="modal fade" id="mdlFormulario">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modelo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="${pageContext.servletContext.contextPath}/BrandsControllers" method="POST">
                        <div class="modal-body">
                            Código
                            <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly >
                            Nombre Modelo
                            <input type="text" name="txtNombre" id="txtNombre" class="form-control"  placeholder="Nombre Modelo.."> 
                           
                            </select>
                          


                        </div>
                        <div class="modal-footer">

                            <button class="btn btn-outline-info" name="btnAgregar" id="btnAgregar">Agregar</button>     
                            <button class="btn btn-outline-success" name="btnModificar" id="btnModificar">Modificar</button>
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
    <script src="${pageContext.servletContext.contextPath}/js/marcas.js"></script>
    </body>
</html>
