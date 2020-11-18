/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDProducto;
import Modelos.Menu;
import Modelos.Producto;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class ProductoDAO implements CRUDProducto {

    private static String sql_selectAll = "select * from producto";
    private static String sql_insert = "insert into producto (id_producto, nombre_producto, descripcion_producto, estado_producto, "
            + " cantidad_producto, valorNeto_producto, valorIva_producto, valorTotal_producto, marca_producto, serial_producto ,"
            + " stock_minimo_producto, fecha_ingreso_producto, fecha_salida_producto, fecha_capital_producto, fecha_vencimiento_producto, codigo_activo_producto,"
            + " numero_orden_compra, codigo_bodega, id_tipo_producto, id_tipo_unidad) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static String sql_delete = "delete from producto where id_producto = ?";
    private static String sql_selectProducto = "select * from producto where id_producto = ?";
    private static String sql_update = "update producto set nombre_producto = ?, descripcion_producto = ?, estado_producto = ?,"
            + " cantidad_producto = ?, valorNeto_producto = ?, valorIva_producto = ?, valorTotal_producto = ?, marca_producto = ?, serial_producto = ?,"
            + " stock_minimo_producto = ?, fecha_ingreso_producto = ?, fecha_salida_producto = ?, fecha_capital_producto = ?, fecha_vencimiento_producto = ?, codigo_activo_producto = ?,"
            + " numero_orden_compra = ?, codigo_bodega = ?, id_tipo_producto = ?, id_tipo_unidad = ?  where id_producto = ?";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public boolean agregarProducto(Producto objProducto) {
        try {
            PreparedStatement psI;
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objProducto.getId_producto());
            psI.setString(2, objProducto.getNombre_producto());
            psI.setString(3, objProducto.getDescripcion_producto());
            psI.setString(4, objProducto.getEstado_producto());
            psI.setInt(5, objProducto.getCantidad_producto());
            psI.setInt(6, objProducto.getValorNeto_producto());
            psI.setInt(7, objProducto.getValorIva_producto());
            psI.setInt(8, objProducto.getValorTotal_producto());
            psI.setString(9, objProducto.getMarca_producto());
            psI.setString(10, objProducto.getSerial_producto());
            psI.setInt(11, objProducto.getStock_minimo_producto());
            psI.setDate(12, new Date(objProducto.getFecha_ingreso_producto().getTime()));
            psI.setDate(13, new Date(objProducto.getFecha_salida_producto().getTime()));
            psI.setDate(14, new Date(objProducto.getFecha_capital_producto().getTime()));
            psI.setDate(15, new Date(objProducto.getFecha_vencimiento_producto().getTime()));
            psI.setInt(16, objProducto.getCodigo_activo_producto());
            psI.setInt(17, objProducto.getNumero_orden_compra());
            psI.setString(18, objProducto.getCodigo_bodega());
            psI.setInt(19, objProducto.getId_tipo_producto());
            psI.setInt(20, objProducto.getId_tipo_unidad());

            if (psI.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return false;

    }

    @Override
    public boolean editarProducto(Producto objProducto) {
        try {
            PreparedStatement psU;

            psU = objConn.getConn().prepareStatement(sql_update);

            psU.setString(1, objProducto.getNombre_producto());
            psU.setString(2, objProducto.getDescripcion_producto());
            psU.setString(3, objProducto.getEstado_producto());
            psU.setInt(4, objProducto.getCantidad_producto());
            psU.setInt(5, objProducto.getValorNeto_producto());
            psU.setInt(6, objProducto.getValorIva_producto());
            psU.setInt(7, objProducto.getValorTotal_producto());
            psU.setString(8, objProducto.getMarca_producto());
            psU.setString(9, objProducto.getSerial_producto());
            psU.setInt(10, objProducto.getStock_minimo_producto());

            psU.setDate(11, new Date(objProducto.getFecha_ingreso_producto().getTime()));
            psU.setDate(12, new Date(objProducto.getFecha_salida_producto().getTime()));
            psU.setDate(13, new Date(objProducto.getFecha_capital_producto().getTime()));
            psU.setDate(14, new Date(objProducto.getFecha_vencimiento_producto().getTime()));

            psU.setInt(15, objProducto.getCodigo_activo_producto());
            psU.setInt(16, objProducto.getNumero_orden_compra());
            psU.setString(17, objProducto.getCodigo_bodega());
            psU.setInt(18, objProducto.getId_tipo_producto());
            psU.setInt(19, objProducto.getId_tipo_unidad());

            psU.setString(20, objProducto.getId_producto());

            if (psU.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        return false;
    }

    @Override
    public Producto eliminarProducto(Producto objProducto) {
        try {
            PreparedStatement psD;

            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setString(1, objProducto.getId_producto());
            if (psD.executeUpdate() > 0) {
                return objProducto;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objProducto;
    }

    @Override
    public ArrayList<Producto> listarProducto() {
        ArrayList<Producto> lstProducto = new ArrayList<>();
        try {
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {
                Producto objProducto = new Producto();
                objProducto.setId_producto(rs.getString("id_producto"));
                objProducto.setNombre_producto(rs.getString("nombre_producto"));
                objProducto.setDescripcion_producto(rs.getString("descripcion_producto"));
                objProducto.setEstado_producto(rs.getString("estado_producto"));
                objProducto.setCantidad_producto(rs.getInt("cantidad_producto"));
                objProducto.setValorNeto_producto(rs.getInt("valorNeto_producto"));
                objProducto.setValorIva_producto(rs.getInt("valorIva_producto"));
                objProducto.setValorTotal_producto(rs.getInt("valorTotal_producto"));
                objProducto.setMarca_producto(rs.getString("marca_producto"));
                objProducto.setSerial_producto(rs.getString("serial_producto"));
                objProducto.setStock_minimo_producto(rs.getInt("stock_minimo_producto"));

                objProducto.setFecha_ingreso_producto(rs.getDate("fecha_ingreso_producto"));
                objProducto.setFecha_salida_producto(rs.getDate("fecha_salida_producto"));
                objProducto.setFecha_capital_producto(rs.getDate("fecha_capital_producto"));
                objProducto.setFecha_vencimiento_producto(rs.getDate("fecha_vencimiento_producto"));

                objProducto.setCodigo_activo_producto(rs.getInt("codigo_activo_producto"));
                objProducto.setNumero_orden_compra(rs.getInt("numero_orden_compra"));
                objProducto.setCodigo_bodega(rs.getString("codigo_bodega"));
                objProducto.setId_tipo_producto(rs.getInt("id_tipo_producto"));
                objProducto.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));

                lstProducto.add(objProducto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lstProducto;
    }

    public Producto buscarPorId(Producto objProducto) {
        try {
            Producto p = new Producto();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectProducto);
            psG.setString(1, objProducto.getId_producto());

            rs = psG.executeQuery();

            while (rs.next()) {
                p.setId_producto(rs.getString("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setEstado_producto(rs.getString("estado_producto"));
                p.setCantidad_producto(rs.getInt("cantidad_producto"));
                p.setValorNeto_producto(rs.getInt("valorNeto_producto"));
                p.setValorIva_producto(rs.getInt("valorIva_producto"));
                p.setValorTotal_producto(rs.getInt("valorTotal_producto"));
                p.setMarca_producto(rs.getString("marca_producto"));
                p.setSerial_producto(rs.getString("serial_producto"));
                p.setStock_minimo_producto(rs.getInt("stock_minimo_producto"));

                p.setFecha_ingreso_producto(rs.getDate("fecha_ingreso_producto"));
                p.setFecha_salida_producto(rs.getDate("fecha_salida_producto"));
                p.setFecha_capital_producto(rs.getDate("fecha_capital_producto"));
                p.setFecha_vencimiento_producto(rs.getDate("fecha_vencimiento_producto"));

                p.setCodigo_activo_producto(rs.getInt("codigo_activo_producto"));
                p.setNumero_orden_compra(rs.getInt("numero_orden_compra"));
                p.setCodigo_bodega(rs.getString("codigo_bodega"));
                p.setId_tipo_producto(rs.getInt("id_tipo_producto"));
                p.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));

            }

            return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public List buscar(String texto) {
        List<Producto> lista = new ArrayList<>();
        String sql_search = "SELECT * FROM producto WHERE id_producto like '%" + texto + "%' or nombre_producto like '%" + texto + "%'"
                + " or descripcion_producto like '%" + texto + "%' or estado_producto like '%" + texto + "%' or cantidad_producto like '%" + texto + "%'"
                + " or valorNeto_producto like '%" + texto + "%' or valorIva_producto like '%" + texto + "%' or valorTotal_producto like '%" + texto + "%'"
                + " or marca_producto like '%" + texto + "%' or serial_producto like '%" + texto + "%' or stock_minimo_producto like '%" + texto + "%'"
                + " or fecha_ingreso_producto like '%" + texto + "%' or fecha_salida_producto like '%" + texto + "%' or fecha_capital_producto like '%" + texto + "%'or fecha_vencimiento_producto like '%" + texto + "%'"
                + " or numero_orden_compra like '%" + texto + "%' or codigo_activo_producto like '%" + texto + "%' or codigo_bodega like '%" + texto + "%' or id_tipo_producto like '%" + texto + "%' or id_tipo_unidad like '%" + texto + "%'";

        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getString("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setEstado_producto(rs.getString("estado_producto"));
                p.setCantidad_producto(rs.getInt("cantidad_producto"));
                p.setValorNeto_producto(rs.getInt("valorNeto_producto"));
                p.setValorIva_producto(rs.getInt("valorIva_producto"));
                p.setValorTotal_producto(rs.getInt("valorTotal_producto"));
                p.setMarca_producto(rs.getString("marca_producto"));
                p.setSerial_producto(rs.getString("serial_producto"));
                p.setStock_minimo_producto(rs.getInt("stock_minimo_producto"));

                p.setFecha_ingreso_producto(rs.getDate("fecha_ingreso_producto"));
                p.setFecha_salida_producto(rs.getDate("fecha_salida_producto"));
                p.setFecha_capital_producto(rs.getDate("fecha_capital_producto"));
                p.setFecha_vencimiento_producto(rs.getDate("fecha_vencimiento_producto"));

                p.setCodigo_activo_producto(rs.getInt("codigo_activo_producto"));
                p.setNumero_orden_compra(rs.getInt("numero_orden_compra"));
                p.setCodigo_bodega(rs.getString("codigo_bodega"));
                p.setId_tipo_producto(rs.getInt("id_tipo_producto"));
                p.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));

                lista.add(p);
            }

        } catch (SQLException e) {
        }
        return lista;
    }

}
