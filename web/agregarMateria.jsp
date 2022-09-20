<%-- 
    Document   : agregarMateria
    Created on : 19/09/2022, 07:38:32 PM
    Author     : Bekev
--%>
<%@page import="modelo.Materia"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar materia</title>
    </head>
    <body>
        <%
            OperacionBD operacion = new OperacionBD();
            operacion.conectar();
            
            String c=request.getParameter("clave");
            String nom=request.getParameter("nombre");
            Materia mat= new Materia(c, nom);
            
            operacion.agregarMateria(mat);
            response.sendRedirect("materias.jsp");
            
            operacion.desconectar();
        %>
    </body>
</html>
