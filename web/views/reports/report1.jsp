<%-- 
    Document   : report1
    Created on : 6 nov. 2022, 15:37:18
    Author     : najera
--%>

<%@include file="../../template/menu.jsp" %>

<div class="row text-center mb-1 pt-2">
    <div class="col-md-12">
        <h2>Nueva venta</h2>        
    </div>
</div>

<div class="row mt-1 mb-1">
    <div class="col-md-12 col-lg-3 form-group card">
        <h5>Cliente</h5>
        <hr>
        <label>Dui Cliente: </label>
        <input type="text" id="dui" name="txtDui" class="form-control">
        <hr>
        <button id="btnSearchCustomer" class="btn btn-sm btn-primary"><i class="bi-search"> <span> Buscar</span></i></button>
    </div>

    <form id="searchCar-form" class="col-md-12 col-lg-5 card">
        <h5>Agregar Producto</h5> 
        <hr>
        <div class="row" style="margin: auto 0;">
            <div class="col-md-12 col-lg-6 div-group">
                <label>Código: </label>
                <input type="text" maxlength="15" id="txtCode" class="form-control">
            </div>

            <div class="col-md-12 col-lg-3 form-group">
                <label>Cantidad: </label>
                <input type="number" value="1" id="qty" minLength="1" class="form-control">
            </div>

            <div class="col-md-12 col-lg-3 form-group">
                <button type="submit" class="btn btn-primary" style="margin-top: 1.9rem;">
                    <i class="bi-search"> Buscar</i>
                </button>
            </div>
        </div>
    </form>

    <div class="col-md-12 col-lg-4 card cart">
        <h5>Esta Venta</h5>
        <hr>
        <form method="POST" id="myForm" action="NewSaleController" accept-charset="utf-8">
            <button id="submit" type="submit" class="btn btn-success">Facturar</button>
            <button onclick="cancelSale()" type="button" class="btn btn-danger">Cancelar Venta</button>
            <button onclick="newSale()" type="button" class="btn btn-primary">Nueva Venta</button>
        </form>
        <hr>

        <div>
            <label>Items: </label>
            <label id="items">0</label>
        </div>

        <div>
            <label>Sub Total: </label>
            <label id="subTotal">0</label>
        </div>

        <div>
            <label>Total</label>
            <label id="total">0</label>
        </div>
   
        <%-- <div>
            <label>Dinero: </label> 
            <label id="money">0</label>
        </div>

        <div>
            <label>Cambio: </label>
            <label id="cambio">0</label>
        </div> --%>
    </div>
</div>

<div class="table-responsive mt-4">
    <!-- <div class="row mt-3 mb-3">
            <div class="col-md-12"> -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Quitar</th>
            </tr>
        </thead>

        <tbody id="cart">

        </tbody>
    </table>
    <!-- </div>
        </div> -->
</div>

<%-- <form id="form-money">
    <div class="modal fade" id="money-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Ingrese el dinero</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 form-group mt-1 mb-1">
                            <label>Dinero</label>
                            <input type="text" autofocus id="txtMoney" class="form-control" name="money" required maxlength="15">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 form-group mt-1 mb-1">
                            <label>Mï¿½todo pago</label>
                            <select id="cmbMethod" class="form-select"> 
                                <?php foreach($this->methods as $mt): ?>
                                <option value="<?php echo $mt->id_method; ?>"><?php echo $mt->method; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" id="btnMoney" class="btn btn-success"><i class="bi-save"> <span>Aceptar</span></i></button>
                </div>
            </div>
        </div>
    </div>
</form>    --%>

<script src="resources/js/new_sale.js" type="text/javascript"></script>
 
<%-- 
<%@include file="${pageContext.servletContext.contextPath}/template/menu" %>
--%>
     
</body>
</html> 
