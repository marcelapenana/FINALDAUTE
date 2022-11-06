<%-- 
    Document   : auth
    Created on : 6 nov. 2022, 8:14:32
    Author     : Luis
--%>

<%@page session="true" %>
<%
    HttpSession session_auth = request.getSession();

    String _user = (String) session_auth.getAttribute("user");

    if (_user == null) {

        response.sendRedirect(pageContext.getServletContext().getContextPath()
                + "/views/auth/login_register.jsp");
    }

%>    