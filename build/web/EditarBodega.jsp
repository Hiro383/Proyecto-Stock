
<%@page import="Modelos.Bodega"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Bodega</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
        <%
            HttpSession sessionMostrar = request.getSession();
            Bodega objBodega = (Bodega)sessionMostrar.getAttribute("objBodega");
            String codigo_bodega = (String)sessionMostrar.getAttribute("codigo_bodega");
            objBodega.setCodigo_bodega(codigo_bodega);
        
        %>
        <jsp:include page="Header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="Menu.jsp"></jsp:include>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- Create Organization-->
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <div class="card mt-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="icons-org-create align-items-center mx-auto"><i class="icon-users" data-feather="users"></i><i class="icon-plus fas fa-plus"></i></div>
                                        <div class="h3 text-primary font-weight-300 mb-0">Editar Bodega</div>
                                    </div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlertLargo"></div>
                                    <hr class="m-0" />
                                    <div class="card-body p-5">
                                        <form action="UpdBodega" id="frmEditarBodega" name="frmEditarBodega" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            
                                            
                                                    
                                                    
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> C�digo Bodega</label>
                                                    <div class="form-group"id="fg_codigo">
                                                        <input class="form-control py-4" type="text" id="txtCodigo_bodega" name="txtCodigo_bodega" maxlength="10" placeholder="Ingrese C�digo" aria-label="Organization Name" aria-describedby="orgNameExample" readonly="" value="<%= objBodega.getCodigo_bodega() %>"/>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Volumen</label>
                                                    <div class="form-group"id="fg_volumen">
                                                        <input class="form-control py-4" type="number" id="txtVolumen_bodega" name="txtVolumen_bodega" maxlength="11" min="0" placeholder="Ingrese Volumen en N�meros" aria-label="Organization Name" aria-describedby="orgNameExample" value="<%= objBodega.getVolumen_bodega() %>"/>
                                                    </div>
                                                </div>
                                            </div>





                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Ubicaci�n</label>
                                                    <div class="form-group"id="fg_ubicacion">
                                                        <input class="form-control py-4" type="text" id="txtUbicacion_bodega" name="txtUbicacion_bodega" maxlength="45" placeholder="Ingrese Ubicaci�n" aria-label="Organization Name" aria-describedby="orgNameExample" value="<%= objBodega.getUbicacion_bodega() %>" />
                                                    </div>
                                                </div>
                                            </div>        
					
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="exampleSelect1" >C�digo Centro de Costo</label>
                                                                <select class="form-control" id="ddlCodigo_CCosto_bodega" name="ddlCodigo_CCosto_bodega">
                                                                    <%
                                                                        ConexionDB objCon = new ConexionDB();
                                                                        try {
                                                                            objCon.getConn();
                                                                            String query = "SELECT CODIGO_CENTRO_COSTO, NOMBRE_CENTRO_COSTO FROM CENTRO_COSTO";
                                                                            PreparedStatement psI;
                                                                            ResultSet rs;
                                                                            psI = objCon.getConn().prepareStatement(query);
                                                                            rs = psI.executeQuery();
                                                                            while (rs.next()) {
                                                                                if(rs.getString(1).equalsIgnoreCase(objBodega.getCodigo_centro_costo())){
                                                                                    out.println("<option value = " + rs.getString(1) + " selected>" + rs.getString(1) + " " + rs.getString(2) + "</option>");
                                                                                }else{
                                                                                    out.println("<option value = " + rs.getString(1) + ">" + rs.getString(1) + " " + rs.getString(2) + "</option>");
                                                                                }
                                                                            }
                                                                        } catch (Exception e) {
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                               <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Editar Bodega">  
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
        <script src="js/validacion.js"></script>
    </body>
</html>