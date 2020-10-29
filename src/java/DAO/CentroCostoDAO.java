/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDCentroCosto;
import Modelos.CentroCosto;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author José Pablo
 */
public class CentroCostoDAO implements CRUDCentroCosto{

    private static String sql_selectAll = "select * from centro_costo";
    private static String sql_selectArea = "select * from centro_costo where codigo_centro_costo = ?";
    private static String sql_insert = "insert into centro_costo (codigo_centro_costo, nombre_centro_costo, fecha_compra_centro_costo,totalGasto_centro_costo,codigo_area) values (?,?,?,?,?)";
    private static String sql_delete = "delete from centro_costo where codigo_centro_costo = ?";
    private static String sql_update = "update centro_costo set nombre_centro_costo = ?, fecha_compra_centro_costo = ?, totalGasto_centro_costo = ?, codigo_area = ? where codigo_centro_costo = ?";
    
     private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs; 
    
    @Override
    public boolean agregarCentroCosto(CentroCosto objCentroCosto) {
        PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objCentroCosto.getCodigo_centro_costo());
            psI.setString(2, objCentroCosto.getNombre_centro_costo());
            psI.setDate(3, new Date(objCentroCosto.getFecha_compra_centro_costo().getTime()));
            psI.setInt(4, objCentroCosto.getTotalGasto_centro_costo());
            psI.setString(5, objCentroCosto.getCodigo_area());
            
            if (psI.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarCentroCosto(CentroCosto objCentroCosto) {
        PreparedStatement psU;
        try {
            psU = objConn.getConn().prepareStatement(sql_update);                       
            
            psU.setString(1, objCentroCosto.getNombre_centro_costo());
            psU.setDate(2, new Date(objCentroCosto.getFecha_compra_centro_costo().getTime()));
            psU.setInt(3, objCentroCosto.getTotalGasto_centro_costo());
            psU.setString(4, objCentroCosto.getCodigo_area());
            psU.setString(5, objCentroCosto.getCodigo_centro_costo());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return false;
    }

    @Override
    public CentroCosto eliminarCentroCosto(CentroCosto objCentroCosto) {
         PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
           psD.setString(1, objCentroCosto.getCodigo_centro_costo());
            
            if (psD.executeUpdate()>0) {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return objCentroCosto;
    }

    @Override
    public ArrayList<CentroCosto> listaCentroCosto() {
        ArrayList<CentroCosto> lstCentroCosto = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {                
                CentroCosto objCentroCosto = new CentroCosto();
                
                objCentroCosto.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
                objCentroCosto.setNombre_centro_costo(rs.getString("nombre_centro_costo"));
                objCentroCosto.setFecha_compra_centro_costo(rs.getDate("fecha_compra_centro_costo"));
                objCentroCosto.setTotalGasto_centro_costo(Integer.parseInt(rs.getString("totalGasto_centro_costo")));
                objCentroCosto.setCodigo_area(rs.getString("codigo_area"));
                
                lstCentroCosto.add(objCentroCosto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return lstCentroCosto;
    }

    @Override
    public List buscar(String texto) {
        List<CentroCosto>  lista = new ArrayList<>();
               int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        
        String sql_search = "select * from centro_costo where codigo_centro_costo like '%"+texto+"%' or nombre_centro_costo like '%"+texto+"%' or fecha_compra_centro_costo like '%"+texto+"%' or totalGasto_centro_costo like '%"+texto+"%' or codigo_area like '%"+texto+"%'";
        
        PreparedStatement psB;
        try {
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
        while (rs.next()) {            
            CentroCosto c = new CentroCosto();
            c.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
            c.setNombre_centro_costo(rs.getString("nombre_centro_costo"));
            c.setFecha_compra_centro_costo(rs.getDate("fecha_compra_centro_costo"));
            c.setTotalGasto_centro_costo(Integer.parseInt(rs.getString("totalGasto_centro_costo")));
            c.setCodigo_area(rs.getString("codigo_area"));
            
            lista.add(c);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
     public CentroCosto buscarPorId(CentroCosto objCentroCosto){
    CentroCosto c = new CentroCosto();
    PreparedStatement psG;
        try {
            psG = objConn.getConn().prepareStatement(sql_selectArea);
            psG.setString(1, objCentroCosto.getCodigo_centro_costo());
            rs = psG.executeQuery();
            
            while (rs.next()) {                
                c.setCodigo_centro_costo(rs.getString("codigo_centro_costo"));
                c.setNombre_centro_costo(rs.getString("nombre_centro_costo"));
                c.setFecha_compra_centro_costo((rs.getDate("fecha_compra_centro_costo")));
                c.setTotalGasto_centro_costo(Integer.parseInt(rs.getString("totalGasto_centro_costo")));
                c.setCodigo_area(rs.getString("codigo_area"));
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }
    
}
