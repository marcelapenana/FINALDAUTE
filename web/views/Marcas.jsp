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
        <h1>Marcas</h1>
        <hr>
        <!-- Botón para agregar -->
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#mdlFormulario">
            Agregar Carro-Marca
        </button>

        <!-- Tabla -->
        <table class="table mt-4"  table-responsive-sm>
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Id Marca</th>
                    <th scope="col">Nombre Marca</th>
              
                </tr>
            </thead>
            <tbody>
                <%       ArrayList<Brands> listaBrands = brandsDAO.mostrarBrands();
                    for (Brands  elem : listaBrands) {
                %>
                <tr>


                    <td><%=elem.getBraName()%></td>
                    <td><%=elem.getBraName()%></td>
                    
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mdlFormulario" id="editar">Editar</button>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mdlFormulario" id="eliminar">Eliminar</button>
                        </div>
                    </td>
                </tr>    
                <%
                    }
                %>

            </tbody>
        </table>

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

                            <button class="btn btn-warning" name="btnAgregar" id="btnAgregar">Agregar</button>     
                            <button class="btn btn-danger" name="btnModificar" id="btnModificar">Modificar</button>
                            <button class="btn btn-secondary" name="btnEliminar" id="btnEliminar">Eliminar</button>
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
