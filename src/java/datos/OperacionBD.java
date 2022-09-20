/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Alumno;
import modelo.Materia;

/**
 *
 * @author Profesor
 */
public class OperacionBD {

    private static final String USUARIO = "root";
    private static final String PSWD = "root";
    private static final String BD = "escuela";
    private static final String URL = "jdbc:mysql://localhost:3306/";

    private Connection conexion;

    public void conectar() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(URL + BD, USUARIO, PSWD);
            if (conexion != null) {
                System.out.println("conectado");
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Error " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Error 1" + ex.getMessage());
        }

    }

    public void desconectar() {
        try {
            conexion.close();
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

    public ArrayList<Alumno> consultarAlumnos() {
        ArrayList<Alumno> alumnos = new ArrayList<>();
        Statement st;
        try {
            st = conexion.createStatement();
            String query = "SELECT* FROM alumnos";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Alumno al = new Alumno();
                al.setMatricula(rs.getString("matricula"));
                al.setNombre(rs.getString("nombre"));
                al.setEdad(rs.getInt("edad"));
                alumnos.add(al);
            }
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }

        return alumnos;
    }

    public boolean agregarAlumno(Alumno alumno) {
        boolean estado = false;
        Statement consultaSQL;
        String q = "INSERT INTO alumnos VALUES(" + "'" + alumno.getMatricula() + "',"
                + "'" + alumno.getNombre() + "'," + alumno.getEdad() + ")";
        /*
            INSERT INTO alumnos
            VALUES ('21023213', 'Matias', 22);
         */
        try {
            consultaSQL = conexion.createStatement();
            consultaSQL.execute(q);
            estado = true;
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }

        return estado;
    }

    public boolean actualizarAlumno(Alumno al) {
        boolean estado = false;
        Statement consultaSQL;
        String q = "UPDATE alumnos SET matricula=" + "'" + al.getMatricula() + "'" + ",nombre=" + "'" + al.getNombre() + "'"
                + ",edad=" + al.getEdad()
                + "WHERE matricula =" + "'" + al.getMatricula() + "'";
        /*      UPDATE alumnos SET matricula="111111", nombre='Carlos', edad=30 
WHERE matricula='215956'*/
        try {
            consultaSQL = conexion.createStatement();
            int r = consultaSQL.executeUpdate(q);
            if (r != 0) {
                estado = true;
            }
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }
        return estado;
    }

    public boolean eliminarAlumno(String matricula) {
        boolean estado = false;
        Statement consultaSQL;
        String q = "DELETE FROM alumnos WHERE matricula=" + "'" + matricula + "'";
        try {
            consultaSQL = conexion.createStatement();
            consultaSQL.execute(q);
            estado = true;
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }

        return estado;
    }

    public ArrayList<Materia> consultarMaterias() {
        ArrayList<Materia> materias = new ArrayList<>();
        Statement consultaSQL;
        String q = "SELECT * FROM materias";
        ResultSet rs;

        try {
            consultaSQL = conexion.createStatement();
            rs = consultaSQL.executeQuery(q);
            while (rs.next()) {
                materias.add(new Materia(rs.getString("clave"), rs.getString("nombre")));
            }

        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }
        return materias;

    }

    public boolean eliminarMateria(String clave) {
        boolean estado = false;
        Statement consultaSQL;
        String q = "DELETE FROM materias WHERE clave=" + "'" + clave + "'";
        // DELETE FROM materias WHERE clave='1151038';
        try {
            consultaSQL = conexion.createStatement();
            consultaSQL.execute(q);
            estado = true;
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }

        return estado;
    }

    public boolean actualizarMateria(String nombre, String clave) {
        boolean estado = false;
        Statement consultaSQL;
        String q = "UPDATE materias SET nombre=" + "'" + nombre + "'"
                + "WHERE clave =" + "'" + clave + "'";
        /*UPDATE materias SET nombre='Programación Orientada a Objetos' 
                WHERE clave='1151072';*/
        try {
            consultaSQL = conexion.createStatement();
            int r = consultaSQL.executeUpdate(q);
            if (r != 0) {
                estado = true;
            }
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }
        return estado;
    }

    public boolean agregarMateria(Materia materia) {
        boolean estado = false;
        Statement consultaSQL;
        String q = "INSERT INTO materias VALUES(" + "'" + materia.getClave() + "',"
                + "'" + materia.getNombre() + "')";

        try {
            consultaSQL = conexion.createStatement();
            consultaSQL.execute(q);
            estado = true;
        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage());
        }

        return estado;
    }

}
