<%-- 
    Document   : eliminarAlumno
    Created on : 13/09/2022, 16:14:55 AM
    Author     : beke
--%>

<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Alumno</title>
    </head>
    <body>
        <%
            OperacionBD op = new OperacionBD();
             String mat= request.getParameter("matricula");
            op.conectar();
            op.eliminarAlumno(mat);
            //System.out.println(mat);
            response.sendRedirect("alumnos.jsp");
           op.desconectar();
        %>
    </body>
</html>
