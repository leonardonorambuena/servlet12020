<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de registro de productos</title>
        <style>
            .form {
                border: 1px black solid;
                border-radius: 38px;
                margin-bottom: 28px;
                background-color: lightgray;
                padding: 15px;
            }
            body {
                background-color: #9999ff;
            }
            .form-control {
                border-radius: 25px;
                margin-bottom: 10px;
                padding: 5px;
                width: 80%;
                text-align: center;
            }
            .btn {
                font-weight: bold;
                width: 60%;
                padding: 8px;
                background-color: lightblue;
                border-radius: 7px;
                box-shadow: 5px 5px #3a4b51;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("productList");
            String name = "", price = "", stock = "";
            int code = 0;
            if (request.getParameter("code") != null) {
                code = Integer.parseInt(request.getParameter("code"));
                
                for (int i = 0; i < products.size(); i++) {
                        Product p = products.get(i);
                        if (p.getCode() == code) {
                            name = p.getName();
                            price =  Integer.toString(p.getPrice());
                            stock = Integer.toString(p.getStock());
                        }
                    }
                
            }
            
        %>
        <center style="width: 600px; margin: auto;">
            <h2>Formulario de registro</h2>
            <form class="form" action="process.do" method="post">
                <div>
                    <input type="text" value="<%=code%>" class="form-control" name="txtcode" placeholder="Ingrese Código" /><br />
                    <input type="text" value="<%=name%>" class="form-control" name="txtname" placeholder="Ingrese Nombre" /><br />
                    <input type="text" value="<%=price%>" class="form-control" name="txtprice" placeholder="Ingrese Precio" /><br />
                    <input type="text" value="<%=stock%>" class="form-control" name="txtstock" placeholder="Ingrese Stock" /><br />
                    <input type="submit" class="btn" name="btnsumbit" value="Almacenar Datos" /><br />
                </div>
                
            </form>
            <table bgcolor="lightgray" border="1" width="600px">
                <tr bgcolor="lightblue">
                    <th colspan="6">Listado de Productos</th>
                </tr>
                <tr bgcolor="lightblue">
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Eliminar</th>
                    <th>Editar</th>
                </tr>
                <% for(int i=0; i < products.size(); i++) { 
                    Product p = products.get(i);
                %>
                <tr>
                    <td><%= p.getCode() %></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getPrice() %></td>
                    <td><%= p.getStock() %></td>
                    <td>
                        <a href="delete.do?code=<%=p.getCode()%>">Click Aqui</a>
                    </td>
                    <td>
                        <a href="index.jsp?code=<%=p.getCode()%>&name=<%=p.getName()%>">
                            Editar producto <%=p.getName()%>
                        </a>
                    </td>
                </tr>
                
                <% }%>
            </table>
        </center>
    </body>
</html>
