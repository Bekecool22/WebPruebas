/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.azc.uam.mx;

/**
 *
 * @author josue
 */
public class Operacion {
    
    public int suma(int x, int y){
        return x+y;
    }
    
    public int resta(int x, int y){
        return x-y;
    }
    
    public int multiplicacion(int x, int y){
        return x*y;
    }
    
    public int division(int x, int y){
        if(y==0)
            return 0;
        return x/y;
    }
    
}
