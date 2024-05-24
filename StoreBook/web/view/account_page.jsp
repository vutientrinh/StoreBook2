<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />         
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <script src="https://kit.fontawesome.com/ac89cb7114.js" crossorigin="anonymous"></script>

        <style>
            .material-symbols-outlined {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
            }
        </style>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/fontawesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/templatemo-style.css">

        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="index.html">
                        <h1 class="tm-site-title mb-0">Product Admin</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/adminhome">
                                    <i class="fas fa-tachometer-alt"></i>
                                    Dashboard
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/productController">
                                    <i class="fas fa-shopping-cart"></i>
                                    Products
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/accountServlet">
                                    <i class="far fa-user"></i>
                                    Accounts
                                </a>
                            </li>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-block" href="${pageContext.request.contextPath}/logout">
                                        Admin, <b>Logout</b>
                                    </a>
                                </li>
                            </ul>
                    </div>
                </div>
        </div>
        <div class="container mt-5">

            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-settings">
                        <h2 class="tm-block-title">Account Settings</h2>
                        <form action="" class="tm-signup-form row" method ="post">
                            <div class="form-group col-lg-6">
                                <label for="name">Account Name</label>
                                <input
                                    id="name"
                                    name="name"
                                    type="text"
                                    class="form-control validate"
                                    value="Vu Tien Trinh"
                                    />
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="email">Account Email</label>
                                <input
                                    id="email"
                                    name="email"
                                    type="email"
                                    class="form-control validate"
                                    value="vutientrinh.0357@gmail.com"
                                    />
                            </div>
                            
                            <div class="form-group col-lg-6">
                                <label for="phone">Phone</label>
                                <input
                                    id="phone"
                                    name="phone"
                                    type="tel"
                                    class="form-control validate"
                                    value="0987654321"
                                    />
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
</body>
</html>
