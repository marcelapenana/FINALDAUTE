<%-- 
    Document   : login_register     
    Created on : 07-Oct-2022, 08:52:31
    Author     : Luis   
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
        <meta charset="UTF-8" >
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
                
                <div class="login__back">
                    <a href="${pageContext.servletContext.contextPath}/views/blog/blogpage.jsp" class="login__back_btn">
                        <p>Volver al blog</p></a>
                </div>
            </div>
        </form>    

        <script src="resources/js/auth.js" type="text/javascript"></script>

    </body>     

</html>   



