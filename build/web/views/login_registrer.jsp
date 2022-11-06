<%-- 
    Document   : login_registrer
    Created on : 6 nov. 2022, 11:20:24
    Author     : najera
--%>
<%@page session="true" %>
<%

    HttpSession _session = request.getSession();

    String user = (String) _session.getAttribute("user");

    if (user != null) {
        response.sendRedirect("NewSaleController");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.1.min.js" type="text/javascript"></script>
        <link href="${pageContext.servletContext.contextPath}/resources/css/login.css" rel="stylesheet"> 
    </head>
    <body>
        <form class="login-container" method="POST" 
              action="${pageContext.servletContext.contextPath}/AuthController">

            <div>
                <div class="login__title">
                    <h3 class="login__title-txt">Ingrese sus credenciales</h3> 
                </div>

                <div class="login__user">
                    <label>Usuario</label>
                    <input name="txtUser" type="text" class="login__user-input" required>
                </div>

                <div class="login__pass">
                    <label>Contraseña</label>
                    <input name="txtPass" type="password" class="login__pass_input" required>
                </div>
                
                <div class="login__error">
                    <label class="login__error_label">${errorMsg}</label>
                </div>     

                <div class="login__send">
                    <input name="btnLogin" type="submit" class="login__send-btn" 
                           value="Iniciar sesión">
                </div>
            </div>
        </form>    

        <script src="resources/js/auth.js" type="text/javascript"></script>
    </body>
</html>
