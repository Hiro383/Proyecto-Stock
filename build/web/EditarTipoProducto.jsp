
<%@page import="Modelos.TipoProducto"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tipo Producto</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
            HttpSession sessionMostrar = request.getSession();
            TipoProducto objTipoProducto = (TipoProducto)sessionMostrar.getAttribute("objTipoProMod");
        
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
                            <!-- Create Organization-->
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <div class="card mt-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="icons-org-create align-items-center mx-auto"><i class="icon-users" data-feather="users"></i><i class="icon-plus fas fa-plus"></i></div>
                                        <div class="h3 text-primary font-weight-300 mb-0">Editar Tipo de Usuario</div>
                                    </div>
                                    <hr class="m-0" />
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="card-body p-5">
                                        <form action="UpdTipoProducto" id="frmEditarTipoProducto" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            <input id="txtIdTipoProducto" name="txtIdTipoProducto" type="hidden" value="<%=objTipoProducto.getId_tipo_producto()%>">
                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Categoria Tipo Producto</label>
                                        <div class="form-group"id="fg_categoria_tipo_producto">
                                            <input class="form-control py-4" id="txtCategoria_tipo_producto" name="txtCategoria_tipo_producto" type="text" value="<%=objTipoProducto.getCategoria_tipo_producto()%>" placeholder="Electronica,Aseo..." />
                                        </div>
                                        <div class="form-group mt-4 mb-0">
                                            <button class="btn btn-primary btn-block" type="submit">Editar Tipo de Producto</button>
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
    </body>
</html>
