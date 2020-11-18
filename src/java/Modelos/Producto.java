/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Felipe
 */
public class Producto {

    private String id_producto;
    private String nombre_producto;
    private String descripcion_producto;
    private String estado_producto;
    private int cantidad_producto;
    private int valorNeto_producto;
    private int valorIva_producto;
    private int valorTotal_producto;
    private String marca_producto;
    private String serial_producto;
    private int stock_minimo_producto;
    private Date fecha_ingreso_producto;
    private Date fecha_salida_producto;
    private Date fecha_capital_producto;
    private Date fecha_vencimiento_producto;
    private int codigo_activo_producto;
    private int numero_orden_compra;
    private String codigo_bodega;
    private int id_tipo_producto;
    private int id_tipo_unidad;

    public Producto() {
    }

    public Producto(String id_producto, String nombre_producto, String descripcion_producto, String estado_producto, int cantidad_producto, int valorNeto_producto, int valorIva_producto, int valorTotal_producto, String marca_producto, String serial_producto, int stock_minimo_producto, Date fecha_ingreso_producto, Date fecha_salida_producto, Date fecha_capital_producto, Date fecha_vencimiento_producto, int codigo_activo_producto, int numero_orden_compra, String codigo_bodega, int id_tipo_producto, int id_tipo_unidad) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;
        this.estado_producto = estado_producto;
        this.cantidad_producto = cantidad_producto;
        this.valorNeto_producto = valorNeto_producto;
        this.valorIva_producto = valorIva_producto;
        this.valorTotal_producto = valorTotal_producto;
        this.marca_producto = marca_producto;
        this.serial_producto = serial_producto;
        this.stock_minimo_producto = stock_minimo_producto;
        this.fecha_ingreso_producto = fecha_ingreso_producto;
        this.fecha_salida_producto = fecha_salida_producto;
        this.fecha_capital_producto = fecha_capital_producto;
        this.fecha_vencimiento_producto = fecha_vencimiento_producto;
        this.codigo_activo_producto = codigo_activo_producto;
        this.numero_orden_compra = numero_orden_compra;
        this.codigo_bodega = codigo_bodega;
        this.id_tipo_producto = id_tipo_producto;
        this.id_tipo_unidad = id_tipo_unidad;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
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

    public int getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public int getValorNeto_producto() {
        return valorNeto_producto;
    }

    public void setValorNeto_producto(int valorNeto_producto) {
        this.valorNeto_producto = valorNeto_producto;
    }

    public int getValorIva_producto() {
        return valorIva_producto;
    }

    public void setValorIva_producto(int valorIva_producto) {
        this.valorIva_producto = valorIva_producto;
    }

    public int getValorTotal_producto() {
        return valorTotal_producto;
    }

    public void setValorTotal_producto(int valorTotal_producto) {
        this.valorTotal_producto = valorTotal_producto;
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

    public int getStock_minimo_producto() {
        return stock_minimo_producto;
    }

    public void setStock_minimo_producto(int stock_minimo_producto) {
        this.stock_minimo_producto = stock_minimo_producto;
    }

    public Date getFecha_ingreso_producto() {
        return fecha_ingreso_producto;
    }

    public void setFecha_ingreso_producto(Date fecha_ingreso_producto) {
        this.fecha_ingreso_producto = fecha_ingreso_producto;
    }

    public Date getFecha_salida_producto() {
        return fecha_salida_producto;
    }

    public void setFecha_salida_producto(Date fecha_salida_producto) {
        this.fecha_salida_producto = fecha_salida_producto;
    }

    public Date getFecha_capital_producto() {
        return fecha_capital_producto;
    }

    public void setFecha_capital_producto(Date fecha_capital_producto) {
        this.fecha_capital_producto = fecha_capital_producto;
    }

    public Date getFecha_vencimiento_producto() {
        return fecha_vencimiento_producto;
    }

    public void setFecha_vencimiento_producto(Date fecha_vencimiento_producto) {
        this.fecha_vencimiento_producto = fecha_vencimiento_producto;
    }

    public int getCodigo_activo_producto() {
        return codigo_activo_producto;
    }

    public void setCodigo_activo_producto(int codigo_activo_producto) {
        this.codigo_activo_producto = codigo_activo_producto;
    }

    public int getNumero_orden_compra() {
        return numero_orden_compra;
    }

    public void setNumero_orden_compra(int numero_orden_compra) {
        this.numero_orden_compra = numero_orden_compra;
    }

    public String getCodigo_bodega() {
        return codigo_bodega;
    }

    public void setCodigo_bodega(String codigo_bodega) {
        this.codigo_bodega = codigo_bodega;
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
