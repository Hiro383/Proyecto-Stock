/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDUbicacion;
import Modelos.Ubicacion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class UbicacionDAO implements CRUDUbicacion{
    private static String sql_selectAll = "select * from ubicacion";
    private static String sql_insert = "insert into ubicacion (codigo_ubicacion, descripcion_ubicacion, codigo_area, id_tipo_ubicacion) values(?, ?, ?, ?)";
    private static String sql_delete = "delete from ubicacion where codigo_ubicacion = ?";
    private static String sql_selectUbicacion = "select * from ubicacion where codigo_ubicacion = ?";
    private static String sql_update = "update ubicacion set descripcion_ubicacion = ?, codigo_area = ?, id_tipo_ubicacion = ? where codigo_ubicacion = ?";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs; 
    
    @Override
    public boolean agregarUbicacion(Ubicacion objUbicacion) {
        try {
        PreparedStatement psI;      
        psI = objConn.getConn().prepareStatement(sql_insert);
        psI.setString(1, objUbicacion.getCodigo_ubicacion());
        psI.setString(2, objUbicacion.getDescripcion_ubicacion());
        psI.setString(3, objUbicacion.getCodigo_area());
        psI.setInt(4, objUbicacion.getId_tipo_ubicacion());

        
        if(psI.executeUpdate()>0){
                return true;    
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
         
        return false;
    }

    @Override
    public boolean editarUbicacion(Ubicacion objUbicacion) {
        try {
            PreparedStatement psU;
            
            psU = objConn.getConn().prepareStatement(sql_update);
            
            psU.setString(1, objUbicacion.getDescripcion_ubicacion());
            psU.setString(2, objUbicacion.getCodigo_area());
            psU.setInt(3, objUbicacion.getId_tipo_ubicacion());
            psU.setString(4, objUbicacion.getCodigo_ubicacion());
            
            if(psU.executeUpdate()>0){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return false; 
    }

    @Override
    public Ubicacion eliminarUbicacion(Ubicacion objUbicacion) {
        try {
            PreparedStatement psD;
            
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setString(1, objUbicacion.getCodigo_ubicacion());
            if(psD.executeUpdate()>0){
                return objUbicacion;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return objUbicacion;
    }

    @Override
    public ArrayList<Ubicacion> listarUbicacion() {
        ArrayList<Ubicacion> lstUbicacion = new ArrayList<>();
        try{
            PreparedStatement psL;
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while(rs.next()){
                Ubicacion objUbicacion = new Ubicacion();
                objUbicacion.setCodigo_ubicacion(rs.getString("codigo_ubicacion"));
                objUbicacion.setDescripcion_ubicacion(rs.getString("descripcion_ubicacion"));
                objUbicacion.setCodigo_area(rs.getString("codigo_area"));
                objUbicacion.setId_tipo_ubicacion(rs.getInt("id_tipo_ubicacion"));
                
                lstUbicacion.add(objUbicacion);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lstUbicacion;    
    }

    @Override
    public List buscar(String texto) {
        List<Ubicacion> lista = new ArrayList<>();
        
        String sql_search = "select * from ubicacion where codigo_ubicacion like '%"+texto+"%' or descripcion_ubicacion like '%"+texto+"%' or codigo_area like '%"+texto+"%' or id_tipo_ubicacion like '%"+texto+"%'";
        
        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                Ubicacion u = new Ubicacion();
                u.setCodigo_ubicacion(rs.getString("codigo_ubicacion"));
                u.setDescripcion_ubicacion(rs.getString("descripcion_ubicacion"));
                u.setCodigo_area(rs.getString("codigo_area"));
                u.setId_tipo_ubicacion(rs.getInt("id_tipo_ubicacion"));
                lista.add(u);
            }
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public Ubicacion buscarPorId(Ubicacion objUbicacion) {
        try {
            Ubicacion p = new Ubicacion();
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectUbicacion);
            psG.setString(1, objUbicacion.getCodigo_ubicacion());
            
            rs = psG.executeQuery();
            
            while(rs.next()){
                p.setDescripcion_ubicacion(rs.getString("descripcion_ubicacion"));
                p.setCodigo_area(rs.getString("codigo_area"));
                p.setId_tipo_ubicacion(rs.getInt("id_tipo_ubicacion"));
            }
            
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(UbicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
            
}
