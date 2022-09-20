<%-- 
    Document   : agregarAlumno
    Created on : 13/09/2022, 12:43:13 AM
    Author     : beke
--%>

<%@page import="modelo.Alumno"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar alumno</title>
    </head>
    <body>
        
        <%
            OperacionBD op = new OperacionBD();
            op.conectar();
            
            String mat=request.getParameter("matricula");
            String nom=request.getParameter("nombre");
            int edad =Integer.parseInt(request.getParameter("edad"));
            Alumno al= new Alumno(mat, nom, edad);
            
            op.agregarAlumno(al);
            response.sendRedirect("alumnos.jsp");
            
            op.desconectar();
        %>
        
    </body>
</html>
