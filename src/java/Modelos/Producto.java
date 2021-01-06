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
public class Producto {

    private int id_producto;
    private String nombre_producto;
    private String descripcion_producto;
    private String estado_producto;
    private int valor_producto;
    private String marca_producto;
    private String serial_producto;
    private int stock_minimo;
    private int id_proveedor;
    private int id_tipo_producto;
    private int id_tipo_unidad;

    public Producto(int id_producto, String nombre_producto, String descripcion_producto, String estado_producto, int valor_producto, String marca_producto, String serial_producto, int stock_minimo, int id_proveedor, int id_tipo_producto, int id_tipo_unidad) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;
        this.estado_producto = estado_producto;
        this.valor_producto = valor_producto;
        this.marca_producto = marca_producto;
        this.serial_producto = serial_producto;
        this.stock_minimo = stock_minimo;
        this.id_proveedor = id_proveedor;
        this.id_tipo_producto = id_tipo_producto;
        this.id_tipo_unidad = id_tipo_unidad;
    }
    
    public Producto()
    {
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    public String getEstado_producto() {
        return estado_producto;
    }

    public void setEstado_producto(String estado_producto) {
        this.estado_producto = estado_producto;
    }

    public int getValor_producto() {
        return valor_producto;
    }

    public void setValor_producto(int valor_producto) {
        this.valor_producto = valor_producto;
    }

    public String getMarca_producto() {
        return marca_producto;
    }

    public void setMarca_producto(String marca_producto) {
        this.marca_producto = marca_producto;
    }

    public String getSerial_producto() {
        return serial_producto;
    }

    public void setSerial_producto(String serial_producto) {
        this.serial_producto = serial_producto;
    }

    public int getStock_minimo() {
        return stock_minimo;
    }

    public void setStock_minimo(int stock_minimo) {
        this.stock_minimo = stock_minimo;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public int getId_tipo_producto() {
        return id_tipo_producto;
    }

    public void setId_tipo_producto(int id_tipo_producto) {
        this.id_tipo_producto = id_tipo_producto;
    }

    public int getId_tipo_unidad() {
        return id_tipo_unidad;
    }

    public void setId_tipo_unidad(int id_tipo_unidad) {
        this.id_tipo_unidad = id_tipo_unidad;
    }

}
