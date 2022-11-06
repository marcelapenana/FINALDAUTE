<%-- 
    Document   : sales      
    Created on : 07-Oct-2022, 08:52:31
    Author     : Luis   
--%> 
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../template/auth.jsp" %>
<%@include file="../../template/menu.jsp" %>

<div class="container pt-4">
<div class="row text-center mb-2">
    <div class="col-md-12">
        <h2>Ventas</h2>            
    </div>
</div>

<div class="row">
    <c:forEach items="${sales}" var="s">
        <div class="col-lg-4 col-md-12 mt-4">
            <div class="card bg-light pl-4">
                <label>Factura: <strong>${s.id}</strong></label>
                <label>Fecha: <strong>${s.dateSale}</strong></label>
                <label>Usuario: <strong>${s.user.userName}</strong></label>
                <label>Cliente: <strong>${s.client.cli_dui}</strong></label>
                <label>Total: <strong>$ ${s.salTotal}</strong></label>
            </div>
        </div>    
    </c:forEach>
</div>
    
</div>    

<script src="resources/js/sales.js" type="text/javascript"></script>

</body>
</html>   