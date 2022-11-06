<%-- 
    Document   : new_sale
    Created on : 6 nov. 2022, 14:58:43
    Author     : najera
--%>

<%@include file="../../template/menu.jsp" %>

<div class="container pt-2">

    <div class="row text-center mb-1 pt-2">
        <div class="col-md-12">
            <h2>Nueva venta</h2>        
        </div>
    </div>

    <div class="row mt-2 mb-1 ">
        <div class="col-md-12 col-lg-3 form-group mx-lg-1 card">
            <h5>Cliente</h5>
            <hr>
            <label>Dui Cliente: </label>
            <input type="text" id="dui" name="txtDui" class="form-control">
            <hr>
            <button id="btnSearchCustomer" class="btn btn-sm btn-primary"><i class="bi-search"> <span> Buscar</span></i></button>
            
        </div>

        <form id="searchCar-form" class="col-md-12 col-lg-5 mx-lg-1 card">
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

        <div class="col-md-12 col-lg-3 ml-lg-1 card cart">
            <h5>Esta Venta</h5>
            <hr>
            <form method="POST" id="myForm" action="NewSaleController" accept-charset="utf-8">
                <button id="submit" type="submit" class="btn btn-sm btn-outline-success">Facturar</button>
                <button onclick="cancelSale()" type="button" class="btn btn-sm btn-outline-danger">Cancelar</button>
                <button onclick="newSale()" type="button" class="btn btn-sm btn-outline-primary">Nueva</button>
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
        </div>
    </div>

    <div class="row mt-3 mb-3">
        <div class="col-md-12">
            <div class="table-responsive mt-4">  
                <table class="table table-info table-striped">
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
            </div>
        </div>
    </div>
  
</div>

<script src="resources/js/new_sale.js" type="text/javascript"></script>

</body>
</html>
