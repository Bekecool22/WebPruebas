<%-- 
    Document   : Materias
    Created on : 19/09/2022, 07:14:34 PM
    Author     : Bekev
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Materia"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="alumnosEst.css" rel="stylesheet"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align ="center">✧Materias✧</h1>
         <%
        OperacionBD bd = new OperacionBD();
        bd.conectar();
        ArrayList<Materia> materias= bd.consultarMaterias();
        %>
        
        <br><table>
            <tr>
                <Th> Clave </Th> <th> Nombre</th> 
            </tr>
                
                <%
                    for(Materia m: materias){
                        out.println("<tr><td align =\"center\">"+ m.getClave()+ "</td>");
                        out.println("<td align =\"center\">"+ m.getNombre()+ "</td>");
                    }
                %>  
        </table>
        <h2>✱Eliminar Materia</h2>
        <form action="eliminarMateria.jsp" method="post">
        <select name="matricula">
                <option selected>Selecciona Materia</option>
                <%
                    for(Materia m: materias){
                        out.println("<option value="+ m.getClave() +">"+ m.getNombre());
                    }
                %>
                
            </select>
                <br><input type="submit" value="eliminar">
                
        </form>
	<h3>✱Agregar Materia</h3>
        
        <form action="agregarMateria.jsp" method="post">
 
        Clave:<input type="text" name="clave" size="15"><br><br><!-- comment -->
        Nombre:<input type="text" name="nombre" size="15"><br><br><!-- comment -->
        <input type="submit" value=agregar>
        
	</form>
    </body>
</html>
