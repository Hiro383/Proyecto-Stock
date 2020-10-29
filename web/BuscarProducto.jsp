

<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelos.Bodega"%>
<%@page import="DAO.BodegaDAO"%>
<%@page import="Modelos.TipoProducto"%>
<%@page import="Modelos.TipoUnidad"%>
<%@page import="DAO.TipoProductoDAO"%>
<%@page import="DAO.TipoUnidadDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Producto"%>
<%@page import="DAO.ProductoDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Sedes</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();
    
        String rol = (String)objsesion.getAttribute("rol");
        
        
        
    %>
    
    <body class="nav-fixed">
        <jsp:include page="Header.jsp"></jsp:include> 
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="Menu.jsp"></jsp:include>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                        <div class="container-fluid">
                            <div class="page-header-content">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="filter"></i></div>
                                    <span>Lista Producto</span>
                                </h1>
                                <div class="page-header-subtitle">Productos Ingresados en el Sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Table Extendida</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarProducto" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar"  class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar"  id="btnBuscar"> <i data-feather="search"></i>Buscar</button>
                                            <a class="btn btn-primary btn-sm" style="margin-left: 5px;" type="button" href="ListaProducto.jsp" name="btnBuscar" id="btnBuscar">Volver</a>
                                        </label>
                                    </div>
                                </form>
                                <div class="datatable table-responsive" style="overflow-x: auto;">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                             <tr>
                                                <th>Codigo Producto</th>
                                                <th>Nombre Producto</th>
                                                <th>Descripci�n Producto</th>
                                                <th>Estado Producto</th>
                                                <th>Valor Neto</th>
                                                <th>Valor IVA</th>
                                                <th>Cantidad Producto</th>
                                                <th>Valor Total</th>
                                                <th>Marca Producto</th>
                                                <th>Serial Producto</th>
                                                <th>Stock Minimo</th>
                                                <th>Fecha Ingreso</th>
                                                <th>Fecha Salida</th>
                                                <th>Fecha Capital</th>
                                                <th>Codigo Activo</th>
                                                <th>Ubicaci�n Bodega</th>
                                                <th>Tipo Producto</th>
                                                <th>Tipo Unidad</th>
						<th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%
                                            HttpSession sessionMostrar = request.getSession();
                                            List<Producto> lista = new ArrayList<Producto>();
                                            lista = (List<Producto>) sessionMostrar.getAttribute("lstBuscarProducto");
                                            
                                            ProductoDAO objDAOProducto = new ProductoDAO();
                                            //agrego los 2 tipos
                                            TipoUnidadDAO objDAOTipoUnidad = new TipoUnidadDAO();
                                            TipoProductoDAO objDAOTipoProducto = new TipoProductoDAO();
                                            BodegaDAO objDAOBodega = new BodegaDAO();
                                            
                                            //2 arrays list
                                            ArrayList<TipoUnidad> lstTipoUnidad = objDAOTipoUnidad.listarTipoUnidad();
                                            ArrayList<TipoProducto> lstTipoProducto = objDAOTipoProducto.listarTipoProducto();
                                            ArrayList<Bodega> lstBodega = objDAOBodega.listaBodega();
                                            
                                            //2 iterator y null
                                            Iterator<Producto> iter = lista.iterator();
                                            Producto objProducto = null;
                                      
                                            Iterator<TipoUnidad> iter2 = lstTipoUnidad.iterator();
                                            TipoUnidad objTipoUnidad = null;
                                            TipoUnidad objTipoUnidadXID = new TipoUnidad();
                                            
                                            Iterator<TipoProducto> iter3 = lstTipoProducto.iterator();
                                            TipoProducto objTipoProducto = null;
                                            TipoProducto objTipoProductoXID = new TipoProducto();
                                            
                                            Iterator<Bodega> iterBodega = lstBodega.iterator();
                                            Bodega objBodega = null;
                                            Bodega objBodegaXID = new Bodega();
                                            
                                            
                                            
                                            SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy" /*Se puede agregar HH:mm:ss
                                            para obtener horas, minutos y segundos*/);
                                            String fechaIngreso = "";
                                            String fechaSalida = "";
                                            String fechaCapital = "";
                                            
                                            DecimalFormat formateador = new DecimalFormat("###,###,###");
                                            
                                            
                                        %>
                                        
                                        <%
                                            while(iterBodega.hasNext()){
                                                objBodega = iterBodega.next();
                                        %>
                                        
                                        <%
                                                
                                            while(iter3.hasNext()){
                                                objTipoProducto = iter3.next();
                                                
                                            %>
                                            
                                             <%
                                            while(iter2.hasNext()){
                                                objTipoUnidad = iter2.next();
                                                

                                            %>
                                            
                                            <%
                                            while(iter.hasNext()){
                                                objProducto = iter.next();
                                                int id_tipo_unidad = objProducto.getId_tipo_unidad();
                                                objTipoUnidadXID.setId_tipo_unidad(id_tipo_unidad);
                                                objTipoUnidadXID = objDAOTipoUnidad.buscarPorId(objTipoUnidadXID);
                                                int id_tipo_producto = objProducto.getId_tipo_producto();
                                                objTipoProductoXID.setId_tipo_producto(id_tipo_producto);
                                                objTipoProductoXID = objDAOTipoProducto.buscarPorId(objTipoProductoXID);
                                                String codigo_bodega = objBodega.getCodigo_bodega();
                                                objBodegaXID.setCodigo_bodega(codigo_bodega);
                                                objBodegaXID = objDAOBodega.buscarPorId(objBodegaXID);
                                                
                                                
                                                

                                            %>
                                            
                                           
                                            
                                        <tbody>
                                            <tr >
                                                <td><%= objProducto.getCodigo_producto()%></td>
                                                <td><%= objProducto.getNombre_producto()%></td>
                                                <td><%= objProducto.getDescripcion_producto()%></td>
                                                <td><%
                                                    if(objProducto.getEstado_producto().equalsIgnoreCase("Stock")){
                                                        %>
                                                        <div class="badge badge-success badge-pill"><%=objProducto.getEstado_producto()%></div>
                                                    <%}else if(objProducto.getEstado_producto().equalsIgnoreCase("Reponer Stock")){
                                                        %>
                                                        <div class="badge badge-warning badge-pill"><%=objProducto.getEstado_producto()%></div>
                                                     <%}else{
                                                     %>
                                                        <div class="badge badge-danger badge-pill"><%=objProducto.getEstado_producto()%></div>
                                                     <%}
                                                    %>
                                                </td>
                                                <td>$<%= formateador.format(objProducto.getValorNeto_producto())%></td>
                                                <td>$<%= formateador.format(objProducto.getValorIva_producto())%></td>
                                                <td><%= objProducto.getCantidad_producto()%></td>
                                                <td>$<%= formateador.format(objProducto.getValorTotal_producto())%></td>
                                                <td><%= objProducto.getMarca_producto()%></td>
                                                <td><%= objProducto.getSerial_producto()%></td>
                                                <td><%= objProducto.getStock_minimo_producto()%></td>
                                                <td><%= fechaIngreso = formatter.format(objProducto.getFecha_ingreso_producto())%></td>
                                                <td><%= fechaSalida = formatter.format(objProducto.getFecha_salida_producto())%></td>
                                                <td ><%= fechaCapital = formatter.format(objProducto.getFecha_capital_producto())%></td>
                                                <td><%= objProducto.getCodigo_activo_producto()%></td>
                                                <td><%= objBodegaXID.getUbicacion_bodega()%></td>
                                                <td><%= objTipoProductoXID.getCategoria_tipo_producto()%></td>
                                                <td><%= objTipoUnidadXID.getNombre_unidad()%></td>
                                                <td>
                                                    <a href="ModProducto?codigo_producto=<%= objProducto.getCodigo_producto()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelProducto?codigo_producto=<%= objProducto.getCodigo_producto()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
                                                </td>
                                            </tr>
                                                <% } %>
                                            <% } %>
                                        <% } %>
                                    <%}%>
                                        </tbody>
                                    </table>
                                        
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>