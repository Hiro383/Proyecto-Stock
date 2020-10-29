/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author Felipe
 */
public class Ubicacion {
    private String codigo_ubicacion;
    private String descripcion_ubicacion;
    private String codigo_area;
    private int id_tipo_ubicacion ;

    public Ubicacion() {
    }

    public Ubicacion(String codigo_ubicacion, String descripcion_ubicacion, String codigo_area, int id_tipo_ubicacion) {
        this.codigo_ubicacion = codigo_ubicacion;
        this.descripcion_ubicacion = descripcion_ubicacion;
        this.codigo_area = codigo_area;
        this.id_tipo_ubicacion = id_tipo_ubicacion;
    }

    public String getCodigo_ubicacion() {
        return codigo_ubicacion;
    }

    public void setCodigo_ubicacion(String codigo_ubicacion) {
        this.codigo_ubicacion = codigo_ubicacion;
    }

    public String getDescripcion_ubicacion() {
        return descripcion_ubicacion;
    }

    public void setDescripcion_ubicacion(String descripcion_ubicacion) {
        this.descripcion_ubicacion = descripcion_ubicacion;
    }

    public String getCodigo_area() {
        return codigo_area;
    }

    public void setCodigo_area(String codigo_area) {
        this.codigo_area = codigo_area;
    }

    public int getId_tipo_ubicacion() {
        return id_tipo_ubicacion;
    }

    public void setId_tipo_ubicacion(int id_tipo_ubicacion) {
        this.id_tipo_ubicacion = id_tipo_ubicacion;
    }

   
}
