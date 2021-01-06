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
import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.ss.usermodel.Cell;  
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.xssf.usermodel.XSSFSheet;  
import org.apache.poi.xssf.usermodel.XSSFWorkbook;  

/**
 *
 * @author Felipe
 */
public class ProductoDAO implements CRUDProducto {

    private static String sql_selectAll = "select * from producto";
    private static String sql_insert = "insert into producto (id_producto, nombre_producto, descripcion_producto, estado_producto, "
            + " valor_producto, marca_producto, serial_producto ,"
            + " stock_minimo, id_proveedor , id_tipo_producto, id_tipo_unidad)"
            + "  values (?,?,?,?,?,?,?,?,?,?,?)";
    private static String sql_delete = "delete from producto where id_producto = ?";
    private static String sql_selectProducto = "select * from producto where id_producto = ?";
    private static String sql_update = "update producto set nombre_producto = ?, descripcion_producto = ?, estado_producto = ?,"
            + " valor_producto = ?, marca_producto = ?, serial_producto = ?,"
            + " stock_minimo = ?, id_proveedor = ?,id_tipo_producto = ?, id_tipo_unidad = ?  where id_producto = ?";

    private static ConexionDB objConn = ConexionDB.InstanciaConn();
    private ResultSet rs;

    @Override
    public boolean agregarProducto(Producto objProducto) {
        try {
            PreparedStatement psI;
            psI = objConn.getConn().prepareStatement(sql_insert);
            psI.setInt(1, objProducto.getId_producto());
            psI.setString(2, objProducto.getNombre_producto());
            psI.setString(3, objProducto.getDescripcion_producto());
            psI.setString(4, objProducto.getEstado_producto());
            psI.setInt(5, objProducto.getValor_producto());
            psI.setString(6, objProducto.getMarca_producto());
            psI.setString(7, objProducto.getSerial_producto());
            psI.setInt(8, objProducto.getStock_minimo());
            psI.setInt(9, objProducto.getId_proveedor());
            psI.setInt(10, objProducto.getId_tipo_producto());
            psI.setInt(11, objProducto.getId_tipo_unidad());

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
            psU.setInt(4, objProducto.getValor_producto());
            psU.setString(5, objProducto.getMarca_producto());
            psU.setString(6, objProducto.getSerial_producto());
            psU.setInt(7, objProducto.getStock_minimo());
            
            psU.setInt(8, objProducto.getId_proveedor());
            psU.setInt(9, objProducto.getId_tipo_producto());
            psU.setInt(10, objProducto.getId_tipo_unidad());

            psU.setInt(11, objProducto.getId_producto());

            if (psU.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.toString());
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
            psD.setInt(1, objProducto.getId_producto());
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
                objProducto.setId_producto(rs.getInt("id_producto"));
                objProducto.setNombre_producto(rs.getString("nombre_producto"));
                objProducto.setDescripcion_producto(rs.getString("descripcion_producto"));
                objProducto.setEstado_producto(rs.getString("estado_producto"));
                objProducto.setValor_producto(rs.getInt("valor_producto"));
                objProducto.setMarca_producto(rs.getString("marca_producto"));
                objProducto.setSerial_producto(rs.getString("serial_producto"));
                objProducto.setStock_minimo(rs.getInt("stock_minimo"));

                objProducto.setId_proveedor(rs.getInt("id_proveedor"));
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
            psG.setInt(1, objProducto.getId_producto());

            rs = psG.executeQuery();

            while (rs.next()) {
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setEstado_producto(rs.getString("estado_producto"));
                p.setValor_producto(rs.getInt("valor_producto"));
                p.setMarca_producto(rs.getString("marca_producto"));
                p.setSerial_producto(rs.getString("serial_producto"));
                p.setStock_minimo(rs.getInt("stock_minimo"));

                p.setId_proveedor(rs.getInt("id_proveedor"));
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
        String sql_search = "SELECT * FROM producto WHERE "
                + "id_producto like '%" + texto + "%' or nombre_producto like '%" + texto + "%'"
                + " or descripcion_producto like '%" + texto + "%' or estado_producto like '%" + texto + "%'"
                + " or valor_producto like '%" + texto + "%' or marca_producto like '%" + texto + "%'"
                +" or serial_producto like '%" + texto + "%' or stock_minimo like '%" + texto + "%'"
                + " or id_proveedor like '%" + texto + "%' or id_tipo_producto like '%" + texto + "%' or id_tipo_unidad like '%" + texto + "%'";

        try {
            PreparedStatement psB;
            psB = objConn.getConn().prepareStatement(sql_search);
            rs = psB.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setEstado_producto(rs.getString("estado_producto"));
                p.setValor_producto(rs.getInt("valor_producto"));
                p.setMarca_producto(rs.getString("marca_producto"));
                p.setSerial_producto(rs.getString("serial_producto"));
                p.setStock_minimo(rs.getInt("stock_minimo"));

                p.setId_proveedor(rs.getInt("id_proveedor"));
                p.setId_tipo_producto(rs.getInt("id_tipo_producto"));
                p.setId_tipo_unidad(rs.getInt("id_tipo_unidad"));

                lista.add(p);
            }

        } catch (SQLException e) {
        }
        return lista;
    }
    
    @Override
    public boolean insercionMasiva(String path) {
        
        try  
        {
            //Preparando la inserción SQL
            PreparedStatement statement = objConn.getConn().prepareStatement(sql_insert);       
        
            //Creando una instancia de archivo 
            File file = new File(path);   
            //Obteniendo los bytes del archivo  
            FileInputStream fis = new FileInputStream(file);   
            //Creando el una instancia de Workbook que se refiere al archivo .xlsx                                             
            XSSFWorkbook wb = new XSSFWorkbook(fis);   
            //Creando un objeto hoja para sacar el objeto  
            XSSFSheet sheet = wb.getSheetAt(0);    
            //Iterando sobre un archivo excel
            Iterator<Row> itr = sheet.iterator();  
            
            //Buscamos dónde está cada dato que buscamos
            int id = -1;
            int nombre = -1;
            int descripcion = -1;
            int estado = -1;
            int valor = -1;
            int marca = -1;
            int serial = -1;
            int stock_minimo = -1;
            int id_proveedor = -1;
            int id_tipo_producto = -1;
            int id_tipo_unidad = -1;
            boolean buscando = true;
            //Iterando sobre cada fila
            while (itr.hasNext()&& buscando)                 
            { 
                //Obteniendo la fila
                Row row = itr.next(); 
                Iterator<Cell> cellIterator = row.cellIterator();
                //Iterando sobre cada columna
                while (cellIterator.hasNext())   
                {  
                    //Obteniendo la celda
                    Cell cell = cellIterator.next();
                    //Revisando el valor de la celda
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("ID"))
                    {
                        id = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("NOMBRE"))
                    {
                        nombre = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("DESCRIPCION"))
                    {
                        descripcion = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("ESTADO"))
                    {
                        estado = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("VALOR"))
                    {
                        valor = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("MARCA"))
                    {
                        marca = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("SERIAL"))
                    {
                        serial = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("STOCKMINIMO"))
                    {
                        stock_minimo = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("IDPROVEEDOR"))
                    {
                        id_proveedor = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("IDTIPOPRODUCTO"))
                    {
                        id_tipo_producto = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("IDTIPOUNIDAD"))
                    {
                        id_tipo_unidad = cell.getColumnIndex();
                    }
                    
                }
                if(id != -1 && nombre != -1 && descripcion != -1 && estado != -1 
                && valor != -1 && marca != -1 && serial != -1 && stock_minimo != -1
                && id_proveedor != -1 && id_tipo_producto != -1 && id_tipo_unidad != -1)
                {
                    buscando = false;
                }
            }
            
            if(buscando == true)
            {
                System.out.println("Buscando!");
                return false;
            }
            
            //Alistamos la información a ingresar
            
            while (itr.hasNext())                 
            {
                //Obteniendo la fila
                Row row = itr.next(); 
                Iterator<Cell> cellIterator = row.cellIterator();
                //Iterando sobre cada columna
                while (cellIterator.hasNext())   
                {  
                    //Obteniendo la celda
                    Cell cell = cellIterator.next();
                    
                    //Revisando a si la celda corresponde a una de las columnas que buscamos
                    if(cell.getColumnIndex() == id)
                    {
                        statement.setInt(1,(int)Math.round(cell.getNumericCellValue()));  
                    }
                    if(cell.getColumnIndex() == nombre)
                    {
                        statement.setString(2, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == descripcion)
                    {
                        statement.setString(3, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == estado)
                    {
                        statement.setString(4, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == valor)
                    {
                        statement.setInt(5,(int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == marca)
                    {
                        statement.setString(6, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == serial)
                    {
                        statement.setString(7, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == stock_minimo)
                    {
                        statement.setInt(8, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == id_proveedor)
                    {
                        statement.setInt(9, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == id_tipo_producto)
                    {
                        statement.setInt(10, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == id_tipo_unidad)
                    {
                        statement.setInt(11, (int)Math.round(cell.getNumericCellValue()));
                    }
                }
                
                //Añadiendo una linea al lote
                statement.addBatch();
            }
            
            wb.close();
            
            
            //Ejecutamos el lote de lineas SQL
            statement.executeBatch();
            return true;
        }
        catch(Exception e)  
        {  
            e.printStackTrace();   
            System.out.println(e.toString());
        }
        
        return false;
    }

}
