<%-- 
    Document   : eliminarMateria
    Created on : 19/09/2022, 07:33:02 PM
    Author     : Bekev
--%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Materia</title>
    </head>
    <body>
        <%
            OperacionBD op = new OperacionBD();
             String clave= request.getParameter("clave");
            op.conectar();
            op.eliminarMateria(clave);
            response.sendRedirect("materias.jsp");
            //System.out.println(mat);
           op.desconectar();
        %>

        %>
    </body>
</html>
