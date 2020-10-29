<%-- 
    Document   : Index
    Created on : 09-sep-2020, 16:29:52
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<html lang="en">
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
    <body class="nav-fixed">
        <%
            HttpSession sessionMostrar = request.getSession();
            String rut_usuario = (String)sessionMostrar.getAttribute("rut_usuario");
            if(rut_usuario.equalsIgnoreCase("")){
                response.sendRedirect("IniciarSesion.jsp");
            }
        %>
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
                                    <div class="page-header-icon"><i data-feather="activity"></i></div>
                                    <span>Dashboard</span>
                                </h1>
                                <div class="page-header-subtitle">Example dashboard overview and content summary</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        
                        <div class="card-deck">
                            <div class="card mb-4">
                                <img class="card-img-top" src="assets/img/drawkit/color/drawkit-charts-and-graphs.svg" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Interactive Charts</h5>
                                    <p class="card-text">The interactive charts in this theme are powered by Chart.js, a simple, yet flexible, JavaScript charting library for designers &amp; developers.</p>
                                </div>
                                <a class="card-footer d-flex align-items-center justify-content-between" href="/charts.html">View charts<i data-feather="arrow-right"></i></a>
                            </div>
                            <div class="card mb-4">
                                <img class="card-img-top" src="assets/img/drawkit/color/drawkit-developer-woman.svg" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Documentation</h5>
                                    <p class="card-text">This theme includes code samples for each component, along with detailed documentation and usage instructions!</p>
                                </div>
                                <a class="card-footer d-flex align-items-center justify-content-between" href="https://docs.startbootstrap.com/sb-admin-pro/">View documentation<i data-feather="arrow-right"></i></a>
                            </div>
                            <div class="card mb-4">
                                <img class="card-img-top" src="assets/img/drawkit/color/drawkit-folder-man.svg" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Pre-Built Pages</h5>
                                    <p class="card-text">A number of pre-built page examples and page layouts are included with this theme to make prototyping your next web application fast and efficient!</p>
                                </div>
                                <a class="card-footer d-flex align-items-center justify-content-between" href="#!">Explore pages<i data-feather="arrow-right"></i></a>
                            </div>
                            <div class="card mb-4">
                                <img class="card-img-top" src="assets/img/drawkit/color/drawkit-content-man.svg" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Deep Customization</h5>
                                    <p class="card-text">Overried and extend the SCSS variables included with this project to deeply customize the theme to make it pefrectly fit your brand!</p>
                                </div>
                                <a class="card-footer d-flex align-items-center justify-content-between" href="#!">Learn more<i data-feather="arrow-right"></i></a>
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
