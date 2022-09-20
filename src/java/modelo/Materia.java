
package modelo;

public class Materia {
    
    private String clave;
    private String nombre;

    public Materia() {
    }

    public Materia(String clave, String nombre) {
        this.clave = clave;
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Materia " + "Clave: " + clave + ", Nombre: " + nombre;
    }
    
    
    
    
}
