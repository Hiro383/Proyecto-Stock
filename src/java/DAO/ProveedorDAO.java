/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.ConexionDB;
import Interfaces.CRUDProveedor;
import Modelos.Menu;
import Modelos.Proveedor;
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
public class ProveedorDAO implements CRUDProveedor{

    private static String sql_selectAll = "select * from proveedor";
    private static String sql_selectProveedor = "select * from proveedor where rut_proveedor = ?";
    private static String sql_insert = "insert into proveedor (rut_proveedor, nombre_proveedor, razonSocial_proveedor, correo_proveedor, direccion_proveedor, fono_proveedor) VALUES(?,?,?,?,?,?)";
    private static String sql_delete = "delete from proveedor WHERE rut_proveedor = ?";
    private static String sql_update = "update proveedor set nombre_proveedor = ?,razonSocial_proveedor = ?,correo_proveedor = ? ,direccion_proveedor = ?,fono_proveedor = ? WHERE rut_proveedor = ?";
    
    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;  
    
    @Override
    public boolean agregarProveedor(Proveedor objProveedor) {
    PreparedStatement psI;
        try {
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setString(1, objProveedor.getRut_proveedor());
            psI.setString(2, objProveedor.getNombre_proveedor());
            psI.setString(3, objProveedor.getRazon_social_proveedor());
            psI.setString(4, objProveedor.getCorreo_proveedor());
            psI.setString(5, objProveedor.getDireccion_proveedor());
            psI.setString(6, objProveedor.getFono_proveedor());
            
            if (psI.executeUpdate()>0) {
                return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean editarProveedor(Proveedor objProveedor) {
        PreparedStatement psU;
        try {
            psU = objConn.getConn().prepareStatement(sql_update);            
            psU.setString(1, objProveedor.getNombre_proveedor());
            psU.setString(2, objProveedor.getRazon_social_proveedor());
            psU.setString(3, objProveedor.getCorreo_proveedor());
            psU.setString(4, objProveedor.getDireccion_proveedor());
            psU.setString(5, objProveedor.getFono_proveedor());
            psU.setString(6, objProveedor.getRut_proveedor());
            
            if (psU.executeUpdate()>0) {
                return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public Proveedor eliminarProveedor(Proveedor objProveedor) {
       PreparedStatement psD;
        try {
            psD = objConn.getConn().prepareStatement(sql_delete);
            psD.setString(1, objProveedor.getRut_proveedor());
                        
            if (psD.executeUpdate()>0) {
                return null;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return objProveedor;
    }

    @Override
    public ArrayList<Proveedor> listarProveedor() {
        ArrayList<Proveedor> lstProveedor = new ArrayList<>();
        PreparedStatement psL;           
        try {
             psL = objConn.getConn().prepareStatement(sql_selectAll );
            rs = psL.executeQuery();            
            while (rs.next()) {
                Proveedor objProveedor = new Proveedor();                               
           
           objProveedor.setRut_proveedor(rs.getString("rut_proveedor"));
           objProveedor.setNombre_proveedor(rs.getString("nombre_proveedor"));
           objProveedor.setRazon_social_proveedor(rs.getString("razonSocial_proveedor"));
           objProveedor.setCorreo_proveedor(rs.getString("correo_proveedor"));
           objProveedor.setDireccion_proveedor(rs.getString("direccion_proveedor"));
           objProveedor.setFono_proveedor(rs.getString("fono_proveedor"));
                lstProveedor.add(objProveedor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstProveedor;
    }

    @Override
    public List buscar(String texto) {
        List<Proveedor> lista = new ArrayList<>();
       int texto2 = 0;
        if(texto.equalsIgnoreCase("Administrador")){
            texto2 = 1;
        }else if(texto.equalsIgnoreCase("Operador")){
            texto2 = 2;
        }
        String sql_search = "SELECT * FROM `proveedor` WHERE rut_proveedor like '%"+texto+"%' or nombre_proveedor like '%"+texto+"%' or "
                + "razonSocial_proveedor like '%"+texto+"%' or correo_proveedor like '%"+texto+"%' or direccion_proveedor like '%"+texto+"%' or "
                + "fono_proveedor like '%"+texto+"%'";
        
        try {
            
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while(rs.next()){
                Proveedor p = new Proveedor();
                 p.setRut_proveedor(rs.getString("rut_proveedor"));
                p.setNombre_proveedor(rs.getString("nombre_proveedor"));
                p.setRazon_social_proveedor(rs.getString("razonSocial_proveedor"));
                p.setCorreo_proveedor(rs.getString("correo_proveedor"));
                p.setDireccion_proveedor(rs.getString("direccion_proveedor"));
                p.setFono_proveedor(rs.getString("fono_proveedor"));
                lista.add(p);
            }
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public Proveedor buscarPorId(Proveedor objProveedor){
     try {
            Proveedor p = new Proveedor();           
            PreparedStatement psG;
            psG = objConn.getConn().prepareStatement(sql_selectProveedor);            
            psG.setString(1, objProveedor.getRut_proveedor());
            rs = psG.executeQuery();
            
            while (rs.next()) {                
                p.setRut_proveedor(rs.getString("rut_proveedor"));
                p.setNombre_proveedor(rs.getString("nombre_proveedor"));
                p.setRazon_social_proveedor(rs.getString("razonSocial_proveedor"));
                p.setCorreo_proveedor(rs.getString("correo_proveedor"));
                p.setDireccion_proveedor(rs.getString("direccion_proveedor"));
                p.setFono_proveedor(rs.getString("fono_proveedor"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
}  

 public ArrayList<Menu> CargarMenuPorRol(int perfil){
        ArrayList<Menu> lstMenu = new ArrayList<>();
        String query = "SELECT M.ID_MENU, M.NOMBRE_MENU, M.URL_MENU, M.ID_MENU_PADRE FROM MENU M "
                + "JOIN TIPO_MENU TM ON (M.ID_MENU = TM.ID_MENU)"
                + "JOIN TIPO_USUARIO TU ON (TM.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO)"
                + "WHERE TM.ID_TIPO_USUARIO = " + perfil;
        try {
            PreparedStatement psM;
            psM = objConn.getConn().prepareStatement(query);
            rs = psM.executeQuery();
            while(rs.next()){
                Menu m = new Menu();
                m.setId_menu(rs.getInt("M.ID_MENU"));
                m.setNombre_menu(rs.getString("M.NOMBRE_MENU"));
                m.setUrl_menu(rs.getString("M.URL_MENU"));
                m.setId_menu_padre(rs.getInt("M.ID_MENU_PADRE"));
                lstMenu.add(m);
            }
        } catch (Exception e) {
        }
        return lstMenu;
    }
}
