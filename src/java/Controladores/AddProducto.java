/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.ProductoDAO;
import Modelos.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe
 */
@WebServlet(name = "AddProducto", urlPatterns = {"/AddProducto"})
public class AddProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProducto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProductoDAO objProductoDAO = new ProductoDAO();
        Producto objProducto = new Producto();
        String texto = request.getParameter("txtCodigo_activo_producto");
        objProducto.setId_producto(request.getParameter("txtId_producto"));
        objProducto.setNombre_producto(request.getParameter("txtNombre_producto"));
        objProducto.setDescripcion_producto(request.getParameter("txtDescripcion_producto"));
        objProducto.setCantidad_producto(Integer.parseInt(request.getParameter("txtCantidad_producto")));
        int cantidad = Integer.parseInt(request.getParameter("txtCantidad_producto"));
        objProducto.setValorNeto_producto(Integer.parseInt(request.getParameter("txtValorNeto_producto")));
        int valor_neto = Integer.parseInt(request.getParameter("txtValorNeto_producto"));
        double iva = 1.19;
        double valor_iva = valor_neto * (iva);
        double valor_redondeado = Math.round(valor_iva);
        objProducto.setValorIva_producto((int) valor_redondeado);
        int valor_total = (int)valor_redondeado*cantidad;
        objProducto.setValorTotal_producto(valor_total);
        objProducto.setMarca_producto(request.getParameter("txtMarca_producto"));
        objProducto.setSerial_producto(request.getParameter("txtSerial_producto"));
        objProducto.setStock_minimo_producto(Integer.parseInt(request.getParameter("txtStock_minimo_producto")));
        String estado_stock  = "";
        if(objProducto.getCantidad_producto() > objProducto.getStock_minimo_producto()){
            estado_stock = "Stock";
            objProducto.setEstado_producto(estado_stock);
        }else if(objProducto.getCantidad_producto() < objProducto.getStock_minimo_producto() && objProducto.getCantidad_producto() >=1){
            estado_stock = "Reponer Stock";
            objProducto.setEstado_producto(estado_stock);
        }else{
            estado_stock = "Sin Stock";
            objProducto.setEstado_producto(estado_stock);
        }
        try {
            Date startDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dtpFechaIngreso"));
            objProducto.setFecha_ingreso_producto(startDate);
        } catch (ParseException ex) {
            System.out.print(ex);
        }
        try {
            Date startDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dtpFechaSalida"));
            objProducto.setFecha_salida_producto(startDate);
        } catch (ParseException ex) {
            System.out.print(ex);
        }
        try {
            Date startDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dtpFechaCapital"));
            objProducto.setFecha_capital_producto(startDate);
        } catch (ParseException ex) {
            System.out.print(ex);
        }
        try {
            Date startDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dtpFechaVencimiento"));
            objProducto.setFecha_vencimiento_producto(startDate);
        } catch (ParseException ex) {
            System.out.print(ex);
        }
        //3 fechas faltan
        if(texto.equalsIgnoreCase("")==true){
            objProducto.setCodigo_activo_producto(0);
        }else{
            objProducto.setCodigo_activo_producto(Integer.parseInt(request.getParameter("txtCodigo_activo_producto")));
        }
        objProducto.setNumero_orden_compra(Integer.parseInt(request.getParameter("txtNumero_orden_compra")));
        objProducto.setCodigo_bodega(request.getParameter("txtCodigo_bodega"));
        objProducto.setId_tipo_producto(Integer.parseInt(request.getParameter("txtId_tipo_producto")));
        objProducto.setId_tipo_unidad(Integer.parseInt(request.getParameter("txtId_tipo_unidad")));

        if (objProductoDAO.agregarProducto(objProducto)) {
            response.sendRedirect("ListaProducto.jsp");
        } else {
            response.sendRedirect("Index.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
