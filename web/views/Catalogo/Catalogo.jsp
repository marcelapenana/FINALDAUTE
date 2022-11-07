<%-- 
    Document   : Catalogo
    Created on : 7 nov. 2022, 19:59:00
    Author     : najera
--%>
<%@include file="../../template/auth.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>      
    <%@include file="../../template/menu.jsp" %>
          
    </head>



<style>
* {
  box-sizing: border-box;
}



body {
  font-family: Arial, Helvetica, sans-serif;
}



/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}



/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}



/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}



/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}



/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>
</head>
<body>



<div class="container mt-4">       
                            
            <div class="row text-center mt-4">
                <div class="col-12 table-responsive-sm">
                    <h2><strong>CATALOGO</strong></h2>
                </div>

               
                
<div class="row">
  <div class="column">
    <div class="card">
      <h3>TRAX </h3>
      <img src="../../img/trax.PNG">
      <hr>
           <p>Caracteristicas </p>
      <ul>
         

          
      <li> <p>Pantalla táctil de infoentretenimiento de 7 pulgadas.</p></li>
      <li><p>Capacidad de punto de acceso Wi-Fi.</p></li>
      <ul>
    </div>
  </div>



 <div class="column">
    <div class="card">
      <h3>TUSCON</h3>
      <img src="${pageContext.servletContext.contextPath}/img/TUSCON.PNG">
      <hr>
       <p>Caracteristicas </p>
      <ul>
         
      
          
      <li> <p>Carroceria (SUV MEDIANO)</p></li>
      <li><p>Potencia 115-180CV</p></li>
         <li><p>Motor o gasolina 2.0 MPi</p></li>
      <ul>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <h3>Yaris</h3>
      <img src="${pageContext.servletContext.contextPath}/img/Yaris.PNG">
      <hr>
      <p>Caracteristicas </p>
      <ul>
         
      
          
      <li> <p>Consumo 51/100km</p></li>
      <li><p>Potencia 115-CV</p></li>
      <li><p>Tres cilindros y 1.6 litros de potencia 157HP</p></li>
      <ul>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <h3>CHR</h3>
      <img src="${pageContext.servletContext.contextPath}/img/CHR.PNG">
      <hr>
      <p>Caracteristicas </p>
      <ul>
         
      
          
      <li><p>Pantalla 2,64 metros </p></li>
      <li><p>Motorizacion 125H(122CV)</p></li>
      <li><p>Motor Dynamic  Force 2litro y 4 cilindros en linea</p></li>
      <ul>
    </div>
  </div>
</div>
<hr>
<hr>
<div class="row">
  <div class="column">
    <div class="card">
      <h3>!20</h3>
      <img src="${pageContext.servletContext.contextPath}/img/!20.PNG">
      <hr>
       <p>Caracteristicas </p>
      <ul>
         
      
          
      <li> <p>Potencia 570 bajo 620CV </p></li>
      <li><p>Consumo 12,6 bajo 12,91/100km</p></li>
      <li><p>Motor de V8 y V10</p></li>
      <ul>
    </div>
  </div>



 <div class="column">
    <div class="card">
      <h3>R8</h3>
      <img src="${pageContext.servletContext.contextPath}/img/R8.PNG">
      <hr>
      <p>Caracteristicas </p>
      <ul>
         
      
          
      <li> <p>Cuenta 5,2 litros con lubricacion de carter </p></li>
      <li><p>Potencia de 570 CV</p></li>
      <li><p>Motor de V8 y V10</p></li>
      <ul>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <h3>Card 3</h3>
      <img src="${pageContext.servletContext.contextPath}/img/!16.PNG">
     <hr>
      <p>Caracteristicas </p>
      <ul>
         
      
          
      <li> <p> Rinde unos 1.000 CV </p></li>
      <li><p>Tracción en las cuatro ruedas.</p></li>
      <li><p>Transmisión automática.</p></li>
      <ul>
  </div>
  </div>
    <div class="column">
    <div class="card">
      <h3>Card 3</h3>
      <img src="${pageContext.servletContext.contextPath}/img/ACCENT.PNG">
     <hr>
      <p>Caracteristicas </p>
      <ul>
         
      
          
      <li> <p> Automatico </p></li>
      <li><p>Rendimiento 9kilometros</p></li>
      <li><p>Via delantera 1.4070ml</p></li>
      <ul>
  </div>

</body>
</html>
    </body>
</html>
