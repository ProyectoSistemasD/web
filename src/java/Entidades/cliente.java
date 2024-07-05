/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author javie
 */
public class cliente implements Comparable<cliente>{
    private String Id;
    private String Apellidos;
    private String Nombres;
    private String Direccion;
    private String DNI;
    private String Telefono;
    private String Movil;

    public cliente() {
        this.Id="";
        this.Apellidos="";
        this.Nombres="";
        this.Direccion="";
        this.DNI="";
        this.Telefono="";
        this.Movil="";
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getMovil() {
        return Movil;
    }

    public void setMovil(String Movil) {
        this.Movil = Movil;
    }
    
    @Override
    public int compareTo(cliente otro) {
        int numero1 = Integer.parseInt(Id.substring(1));
        int numero2 = Integer.parseInt(otro.getId().substring(1));
        return Id.compareTo(otro.getId());
    }
}
