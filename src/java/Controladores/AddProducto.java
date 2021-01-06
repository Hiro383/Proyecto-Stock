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
        objProducto.setId_producto(Integer.parseInt(request.getParameter("txtId_producto")));
        objProducto.setNombre_producto(request.getParameter("txtNombre_producto"));
        objProducto.setDescripcion_producto(request.getParameter("txtDescripcion_producto"));
        objProducto.setEstado_producto(request.getParameter("txtEstado_producto"));
        objProducto.setValor_producto(Integer.parseInt(request.getParameter("txtValor_producto")));
        objProducto.setMarca_producto(request.getParameter("txtMarca_producto"));
        objProducto.setSerial_producto(request.getParameter("txtSerial_producto"));
        objProducto.setStock_minimo(Integer.parseInt(request.getParameter("txtStock_minimo_producto")));
        objProducto.setId_proveedor(Integer.parseInt(request.getParameter("txtId_proveedor")));
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
