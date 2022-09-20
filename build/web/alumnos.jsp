<%-- 
    Document   : alumno
    Created on : 12/09/2022, 15:41:32 PM
    Author     : Beke
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Alumno"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="alumnosEst.css" rel="stylesheet"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title >Alumnos LPOO</title>
    </hFead>
<body>
        <h1 align ="center">✧Alumnos✧</h1>
        <%
        OperacionBD op = new OperacionBD();
        op.conectar();
        ArrayList<Alumno> alumnos= op.consultarAlumnos();
        
        %>
        <br><table>
            <tr>
                <Th> Matricula </Th> <th> Nombre</th> <th>Edad</th>
            </tr>
                
                <%
                    for(Alumno al: alumnos){
                        out.println("<tr><td align =\"center\">"+ al.getMatricula()+ "</td>");
                        out.println("<td align =\"center\">"+ al.getNombre()+ "</td>");
                        out.println("<td align =\"center\">"+ al.getEdad()+ "</td></tr>");
                    }
                %>  
        </table>
        <h2>✱Eliminar Alumno</h2>
        <form action="eliminarAlumno.jsp" method="post">
        <select name="matricula">
                <option selected>Selecciona Alumno</option>
                <%
                    for(Alumno al: alumnos){
                        out.println("<option value="+ al.getMatricula()+">"+ al.getMatricula());
                    }
                %>
                
            </select>
                <br><input type="submit" value="eliminar">
                
        </form>
	<h3>✱Agregar Alumno</h3>
        
        <form action="agregarAlumno.jsp" method="post">
 
        Matricula:<input type="text" name="matricula" size="15"><br><br><!-- comment -->
        Nombre:<input type="text" name="nombre" size="15"><br><br><!-- comment -->
        Edad:<input type="text" name="edad" size="15"><br><br>
        <input type="submit" value=agregar>
        
	</form>
        
    </body>
</html>
