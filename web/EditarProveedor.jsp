<%@page import="Modelos.Proveedor"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Proveedor</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <script src="ValidarRUT.js"></script>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>     
    <body class="nav-fixed">
        <%
         HttpSession sessionMostrar = request.getSession();
            Proveedor objProveedor= (Proveedor) sessionMostrar.getAttribute("objProveedor");
            String rut_proveedor = (String)sessionMostrar.getAttribute("rut_proveedor");
            objProveedor.setRut_proveedor(rut_proveedor);
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
                                <div class="col-lg-7">
                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                        <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Editar Proveedor</h3></div>
                                        <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                        <div class="card-body">
                                            <form action="UpdProveedor" id="frmAgregarProveedor" name="frmAgregarProveedor" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                                <div class="form-row">

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Rut</label>
                                                            <div class="form-group" id="fg_rut">
                                                                <input class="form-control py-4" id="txtRut_Proveedor"  name="txtRut_Proveedor"  type="text" placeholder="11.111.111.1" readonly="" value="<%= objProveedor.getRut_proveedor() %>"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Nombre</label>
                                                            <div class="form-group" id="fg_nombre">
                                                                <input class="form-control py-4" id="txtNombre_Proveedor"  name="txtNombre_Proveedor"  type="text" placeholder="Nombre" value="<%= objProveedor.getNombre_proveedor() %>" />
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="users"></i> Razón Social</label>
                                                            <div class="form-group" id="fg_razon_social">
                                                                <input class="form-control py-4" id="txtRazonSocial_Proveedor" name="txtRazonSocial_Proveedor" type="text" placeholder="Ingrese Razón Social" value="<%= objProveedor.getRazon_social_proveedor() %>" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="phone"></i> Telefono</label>
                                                            <div class="form-group" id="fg_fono">
                                                                <input class="form-control py-4" id="txtFono_Proveedor"  name="txtFono_Proveedor" type="tel" placeholder=" 22 XX-XX-XXX" value="<%= objProveedor.getFono_proveedor() %>"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="phone"></i> Telefono</label>
                                                            <div class="form-group" id="fg_direccion">
                                                                <input class="form-control py-4" id="txtDireccion_Proveedor" name="txtDireccion_Proveedor" type="text" placeholder="Ingrese Dirección" value="<%= objProveedor.getDireccion_proveedor() %>" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="small mb-1" for="inputLastName"><i data-feather="phone"></i> Telefono</label>
                                                            <div class="form-group"  id="fg_correo">
                                                                <input class="form-control py-4" id="txtCorreo_Proveedor" name="txtCorreo_Proveedor" type="email" aria-describedby="emailHelp" placeholder="proveedor@ejemplo.com" value="<%= objProveedor.getCorreo_proveedor() %>"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                            <div class="form-group mt-4 mb-0">
                                                    <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Editar Proveedor">
                                                </div>
                                    </div>
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
