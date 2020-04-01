

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container {
                color: red;
                font-weight: bold;
                border: 6px black solid;
                border-radius: 20px;
            }
        </style>
    </head>
    <body>
    <center>
        <h2>Errores del formulario</h2>
        <div class="container">

                <%
                    ArrayList<String> errors = (ArrayList<String>) getServletContext().getAttribute("errorList");
                    for (int i = 0; i < errors.size(); i++) {
                        String error = errors.get(i);
                    
                %>
                <p><%= error%></p>
                <%}%>

        </div> <br />
        
        <a href="index.jsp">Volver Al Formulario</a>
    </center>
    </body>
</html>
