/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDArea;
import Modelos.Area;
import Modelos.Menu;
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
public class AreaDAO implements CRUDArea{
    
    private static String sql_selectAll = "select * from area";
    private static String sql_selectArea = "select * from area where codigo_area = ?";
    private static String sql_insert = "insert into area (codigo_area, nombre_area, codigo_sede) values (?,?,?)";
    private static String sql_delete = "delete from area where codigo_area = ?";
    private static String sql_update = "update area set nombre_area = ?, codigo_sede = ? where codigo_area = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;  
    
    @Override
    public boolean agregarArea(Area objArea) {
        PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objArea.getCodigo_area());
            psI.setString(2, objArea.getNombre_area());
            psI.setString(3, objArea.getCodigo_sede());
            
            if (psI.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarArea(Area objArea) {
        PreparedStatement psU;
        try {
            psU = objConn.getConn().prepareStatement(sql_update);            
            psU.setString(1, objArea.getNombre_area());
            psU.setString(2, objArea.getCodigo_sede());
            psU.setString(3, objArea.getCodigo_area());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return false;
    }

    @Override
    public Area eliminarArea(Area objArea) {
        PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setString(1, objArea.getCodigo_area());
            
            if (psD.executeUpdate()>0) {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return objArea;
    }

    @Override
    public ArrayList<Area> listaArea() {
       ArrayList<Area> lstArea = new ArrayList<>();
        PreparedStatement psL;
        try {
            psL = objConn.getConn().prepareStatement(sql_selectAll);
            rs = psL.executeQuery();
            while (rs.next()) {                
                Area objArea = new Area();
                
                objArea.setCodigo_area(rs.getString("codigo_area"));
                objArea.setNombre_area(rs.getString("nombre_area"));
                objArea.setCodigo_sede(rs.getString("codigo_sede"));
                lstArea.add(objArea);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return lstArea;
    }

    @Override
    public List buscar(String texto) {
        List<Area>  lista = new ArrayList<>();
               int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        
        String sql_search = "SELECT * FROM area where codigo_area like '%"+texto+"%' or nombre_area like '%"+texto+"%' or codigo_sede like '%"+texto+"%' ";
        
        PreparedStatement psB;
        try {
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
        while (rs.next()) {            
            Area a = new Area();
            a.setCodigo_area(rs.getString("codigo_area"));
            a.setNombre_area(rs.getString("nombre_area"));
            a.setCodigo_sede(rs.getString("codigo_sede"));
            lista.add(a);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public Area buscarPorId(Area objArea){
    Area a = new Area();
    PreparedStatement psG;
        try {
            psG = objConn.getConn().prepareStatement(sql_selectArea);
            psG.setString(1, objArea.getCodigo_area());
            rs = psG.executeQuery();
            
            while (rs.next()) {                
                a.setCodigo_area(rs.getString("codigo_area"));
                a.setNombre_area(rs.getString("nombre_area"));
                a.setCodigo_sede(rs.getString("codigo_sede"));
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }
    
    
}
