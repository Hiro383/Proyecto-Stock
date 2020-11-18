<%@page import="Modelos.Producto"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Producto</title>
        <link href="css/validacion.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();

        String rol = (String) objsesion.getAttribute("rol");

        ConexionDB objCone = new ConexionDB();

        Producto objPro = (Producto) objsesion.getAttribute("objPro");
        String id_producto = (String) objsesion.getAttribute("id_producto");
        objPro.setId_producto(id_producto);


    %>
    <body class="nav-fixed">
        <jsp:include page="Header.jsp"></jsp:include>
            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                <jsp:include page="Menu.jsp"></jsp:include>
                </div>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                        <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Editar Producto</h3></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="card-body">
                                            <form action="UpdProducto" method="post" id="frmEditarProducto" name="frmEditarProducto" autocomplete="off" accept-charset="ISO-8859-1">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Codigo Producto</label>
                                                            <div class="form-group"id="fg_id_producto">
                                                                <input class="form-control py-4" id="txtId_producto" name="txtId_producto" type="text" placeholder="000" readonly=""  value="<%=objPro.getId_producto()%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Nombre Producto</label>
                                                        <div class="form-group"id="fg_nombre_producto">
                                                            <input class="form-control py-4" id="txtNombre_producto" name="txtNombre_producto" type="text" placeholder="000" value="<%=objPro.getNombre_producto()%>" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Descripcion</label>
                                                        <div class="form-group"id="fg_descripcion_producto" >
                                                            <textarea class="form-control" id="txtDescripcion_producto" name="txtDescripcion_producto" rows="4" cols="50"  maxlength="500"><%=objPro.getDescripcion_producto()%></textarea>

                                                        </div>

                                                    </div>
                                                </div>                                               
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Cantidad</label>
                                                        <div class="form-group"id="fg_cantidad_producto">
                                                            <input class="form-control py-4" id="txtCantidad_producto" name="txtCantidad_producto" type="tel" placeholder="0" value="<%=objPro.getCantidad_producto()%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Valor Neto</label>
                                                        <div class="form-group"id="fg_valorNeto_producto">
                                                            <input class="form-control py-4" id="txtValorNeto_producto" name="txtValorNeto_producto" type="tel" placeholder=" 00000" value="<%=objPro.getValorNeto_producto()%>"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Valor Iva</label>
                                                        <div class="form-group"id="fg_valorIva_producto">
                                                            <input class="form-control py-4" id="txtValorIva_producto" name="txtValorIva_producto" type="tel" placeholder=" 00000" value="<%=objPro.getValorIva_producto()%>" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Valor Total</label>
                                                        <div class="form-group"id="fg_valorTotal_producto">
                                                            <input class="form-control py-4" id="txtValorTotal_producto" name="txtValorTotal_producto" type="text" placeholder="0000" value="<%=objPro.getValorTotal_producto()%>" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Marca Producto</label>
                                                        <div class="form-group"id="fg_marca_producto">
                                                            <input class="form-control py-4" id="txtMarca_producto" name="txtMarca_producto" type="text" placeholder="Marca" value="<%=objPro.getMarca_producto()%>" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Serial Producto</label>
                                                        <div class="form-group"id="fg_serial_producto">
                                                            <input class="form-control py-4" id="txtSerial_producto" name="txtSerial_producto" type="text" placeholder="1234567" value="<%=objPro.getSerial_producto()%>" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Stock minimo</label>
                                                        <div class="form-group"id="fg_stock_minimo_producto">
                                                            <input class="form-control py-4" id="txtStock_minimo_producto" name="txtStock_minimo_producto" type="text" placeholder="1-2-3..." value="<%=objPro.getStock_minimo_producto()%>" />
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Codigo Activo Producto</label>
                                                        <input class="form-control py-4" id="txtCodigo_activo_producto" name="txtCodigo_activo_producto" type="text" placeholder="000000" value="<%=objPro.getCodigo_activo_producto()%>"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i>Numero Orden Compra</label>
                                                        <input class="form-control py-4" id="txtNumero_orden_compra" name="txtNumero_orden_compra" type="number" placeholder="000000" value="<%=objPro.getNumero_orden_compra()%>"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Fecha Ingreso Producto</label><input class="form-control py-4" id="dtpFechaIngreso" name="dtpFechaIngreso" type="date" value="<%=objPro.getFecha_ingreso_producto()%>"/></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Fecha Salida Producto</label><input class="form-control py-4" id="dtpFechaSalida" name="dtpFechaSalida" type="date" value="<%=objPro.getFecha_salida_producto()%>"/></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Fecha Capital Producto</label><input class="form-control py-4" id="dtpFechaCapital" name="dtpFechaCapital" type="date" value="<%=objPro.getFecha_capital_producto()%>"/></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Fecha Vencimiento Producto</label><input class="form-control py-4" id="dtpFechaVencimiento" name="dtpFechaVencimiento" type="date" value="<%=objPro.getFecha_vencimiento_producto()%>"/></div>
                                                </div>


                                                <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Codigo Bodega</label>
                                                        <select class="form-control" id="txtCodigo_bodega" name="txtCodigo_bodega">
                                                            <%
                                                                try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT CODIGO_BODEGA, UBICACION_BODEGA FROM BODEGA";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        if (rs.getString(1).equalsIgnoreCase(objPro.getCodigo_bodega())) {
                                                                            out.println("<option value = " + rs.getString(1) + " selected>" + rs.getString(2) + "</option>");
                                                                        } else {
                                                                            out.println("<option value = " + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                                                        }

                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Tipo Producto</label>
                                                        <select class="form-control" id="txtId_tipo_producto" name="txtId_tipo_producto">
                                                            <%
                                                                try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT ID_TIPO_PRODUCTO, CATEGORIA_TIPO_PRODUCTO FROM TIPO_PRODUCTO";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        if (rs.getInt(1) == objPro.getId_tipo_producto()) {
                                                                            out.println("<option value = " + rs.getInt(1) + " selected>" + rs.getString(2) + "</option>");
                                                                        } else {
                                                                            out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
                                                                        }
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row"> 
                                                <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Tipo Unidad</label>
                                                        <select class="form-control" id="txtId_tipo_unidad" name="txtId_tipo_unidad">
                                                            <%
                                                                try {
                                                                    objCone.getConn();
                                                                    String query = "SELECT ID_TIPO_UNIDAD, NOMBRE_UNIDAD FROM TIPO_UNIDAD";
                                                                    PreparedStatement psI;
                                                                    ResultSet rs;
                                                                    psI = objCone.getConn().prepareStatement(query);
                                                                    rs = psI.executeQuery();
                                                                    while (rs.next()) {
                                                                        if (rs.getInt(1) == objPro.getId_tipo_unidad()) {
                                                                            out.println("<option value = " + rs.getInt(1) + " selected>" + rs.getString(2) + "</option>");
                                                                        } else {
                                                                            out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
                                                                        }
                                                                    }
                                                                } catch (Exception e) {
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0">
                                                <button class="btn btn-primary btn-block" type="submit">Editar Producto</button>
                                            </div>

                                        </form>
                                    </div>
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
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
    </body>
</html>
