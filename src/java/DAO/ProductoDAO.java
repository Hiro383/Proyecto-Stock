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
            int cantidad = -1;
            int valor_neto = -1;
            int valor_iva = -1;
            int valor_total = -1;
            int marca = -1;
            int serial = -1;
            int stock_minimo = -1;
            int fecha_ingreso = -1;
            int fecha_salida = -1;
            int fecha_capital = -1;
            int fecha_vencimiento = -1;
            int codigo_activo = -1;
            int numero_orden_compra = -1;
            int codigo_bodega = -1;
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
                       .equals("CANTIDAD"))
                    {
                        cantidad = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("VALORNETO"))
                    {
                        valor_neto = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("VALORIVA"))
                    {
                        valor_iva = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("VALORTOTAL"))
                    {
                        valor_total = cell.getColumnIndex();
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
                       .equals("FECHAINGRESO"))
                    {
                        fecha_ingreso = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("FECHASALIDA"))
                    {
                        fecha_salida = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("FECHACAPITAL"))
                    {
                        fecha_capital = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("FECHAVENCIMIENTO"))
                    {
                        fecha_vencimiento = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("CODIGOACTIVO"))
                    {
                        codigo_activo = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("NUMEROORDENCOMPRA"))
                    {
                        numero_orden_compra = cell.getColumnIndex();
                    }
                    if(cell.getStringCellValue().toUpperCase().replace("Á","A").replace("É","E").replace("Í","I").replace("Ó","O").replace("Ú","U").replace(" ","")
                       .equals("CODIGOBODEGA"))
                    {
                        codigo_bodega = cell.getColumnIndex();
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
                if(id != -1 && nombre != -1 && descripcion != -1 && estado != -1 && cantidad != -1
                && valor_neto != -1 && valor_iva != -1 && valor_total != -1 && marca != -1 && serial != -1
                && stock_minimo != -1 && fecha_ingreso != -1 && fecha_salida != -1 && fecha_capital != -1 && fecha_vencimiento != -1
                && codigo_activo != -1 && numero_orden_compra != -1 && codigo_bodega != -1 && id_tipo_producto != -1 && id_tipo_unidad != -1)
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
                    
                    switch(cell.getColumnIndex())
                    {
                        case 0:
                            break;
                        case 1:
                            statement.setString (2, cell.getStringCellValue());
                            break;
                        case 2:
                            statement.setString (3, cell.getStringCellValue());
                            break;
                        case 3:
                            statement.setString (4, cell.getStringCellValue());
                            //System.out.println(cell.getStringCellValue().replaceAll(" ",""));
                            break;
                        case 4:
                            statement.setInt    (5,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 5:
                            statement.setInt    (6,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 6:
                            statement.setInt    (7,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 7:
                            statement.setInt    (8,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 8:
                            statement.setString (9, cell.getStringCellValue());
                            break;
                        case 9:
                            statement.setInt    (10,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 10:
                            statement.setInt    (11,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 11:
                            statement.setDate   (12, new java.sql.Date(cell.getDateCellValue().getTime()));
                            break;
                        case 12:
                            statement.setDate   (13, new java.sql.Date(cell.getDateCellValue().getTime()));
                            break;
                        case 13:
                            statement.setDate   (14, new java.sql.Date(cell.getDateCellValue().getTime()));
                            break;
                        case 14:
                            statement.setDate   (15, new java.sql.Date(cell.getDateCellValue().getTime()));
                            break;
                        case 15:
                            statement.setInt    (16,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 16:
                            statement.setInt    (17,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 17:
                            statement.setInt    (18,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 18:
                            statement.setInt    (19,(int)Math.round(cell.getNumericCellValue()));
                            break;
                        case 19:
                            statement.setInt    (20,(int)Math.round(cell.getNumericCellValue()));
                            break;
                    }
                    
                    //Revisando a si la celda corresponde a una de las columnas que buscamos
                    if(cell.getColumnIndex() == id)
                    {
                        switch (cell.getCellType())               
                            {  
                                case Cell.CELL_TYPE_STRING:    //Celda con texto
                                statement.setString (1, cell.getStringCellValue());
                                break;
                        
                                case Cell.CELL_TYPE_NUMERIC:    //Celda numérica  
                                statement.setInt(1,(int)Math.round(cell.getNumericCellValue()));  
                                break;  
                                default:  
                            }
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
                    if(cell.getColumnIndex() == cantidad)
                    {
                        statement.setInt(5,(int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == valor_neto)
                    {
                        statement.setInt(6,(int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == valor_iva)
                    {
                        statement.setInt(7,(int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == valor_total)
                    {
                        statement.setInt(8,(int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == marca)
                    {
                        statement.setString(9, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == serial)
                    {
                        statement.setString(10, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == stock_minimo)
                    {
                        statement.setInt(11, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == fecha_ingreso)
                    {
                        statement.setDate(12, new java.sql.Date(cell.getDateCellValue().getTime()));
                    }
                    if(cell.getColumnIndex() == fecha_salida)
                    {
                        statement.setDate(13, new java.sql.Date(cell.getDateCellValue().getTime()));
                    }
                    if(cell.getColumnIndex() == fecha_capital)
                    {
                        statement.setDate(14, new java.sql.Date(cell.getDateCellValue().getTime()));
                    }
                    if(cell.getColumnIndex() == fecha_vencimiento)
                    {
                        statement.setDate(15, new java.sql.Date(cell.getDateCellValue().getTime()));
                    }
                    if(cell.getColumnIndex() == codigo_activo)
                    {
                        statement.setInt(16, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == numero_orden_compra)
                    {
                        statement.setInt(17, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == codigo_bodega)
                    {
                        statement.setString(18, cell.getStringCellValue());
                    }
                    if(cell.getColumnIndex() == id_tipo_producto)
                    {
                        statement.setInt(19, (int)Math.round(cell.getNumericCellValue()));
                    }
                    if(cell.getColumnIndex() == id_tipo_unidad)
                    {
                        statement.setInt(20, (int)Math.round(cell.getNumericCellValue()));
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
