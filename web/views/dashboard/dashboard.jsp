<%-- 
    Document   : dashboard      
    Created on : 05-Nov-2022, 08:52:31
    Author     : Luis   
--%> 
     
<%@include file="../../template/auth.jsp" %>
<%@include file="../../template/menu.jsp" %>

<div class="container pt-4">
    <div class="row text-center mb-1 mt-4">
        <div class="col-md-12">
            <h2>Dashboard</h2>            
        </div>
    </div>

    <div class="row mt-1 mb-1">
        <div class="col-12"> 
             <div id="chart_div"></div>
        </div>
    </div>
    
</div>    

<script src="${pageContext.servletContext.contextPath}/resources/js/dashboard.js" type="text/javascript"></script>

</body>
</html>   