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
            .custom{
                background-color: #a6a8a9;
                border-radius: 10px;
            }
        </style>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/fontawesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/templatemo-style.css">




    </head>

    <body id="reportsPage">
        <div class="" id="home">

            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="#">
                        <h1 class="tm-site-title mb-0">Product Admin</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/adminhome">
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
                                <a class="nav-link" href="${pageContext.request.contextPath}/accountServlet">
                                    <i class="far fa-user"></i>
                                    Accounts
                                </a>
                            </li>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-block" href="${pageContext.request.contextPath}/logout">
                                        <i class="far fa-user"></i>
                                        Admin, <b>Logout</b>
                                    </a>
                                </li>
                            </ul>
                    </div>
                </div>

            </nav>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                    </div>
                </div>

                <div class="row tm-content-row">
                    <div class="col-12 tm-block-col">
                        <div class=" tm-block custom">
                            <h2 class="tm-block-title">Statistical tables</h2>
                            <canvas id="myChart" style="width:600px;height: auto"></canvas>
                        </div>
                    </div>

                    <div class="col-12 tm-block-col">
                        <div class="tm-block tm-block-taller tm-block-scroll custom">
                            <h2 class="tm-block-title">Orders List</h2>
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">CUSTOMER NAME</th>
                                        <th scope="col">PHONE NUMBER</th>
                                        <th scope="col">ADRESS</th>
                                        <th scope="col">CUSTOMER EMAIL</th>

                                        <th scope="col">&nbsp;</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="bill" items="${bills}">
                                        <tr <c:if test="${bill.getStatus() eq 1}">class="inactive-row"</c:if>>
                                            <td>${bill.customer.getCustomer_name()}</td>
                                            <td class="tm-product-name">${bill.customer.getPhone_number()}</td>
                                            <td>${bill.customer.getAddress()}</td>
                                            <td>${bill.customer.getCustomer_email()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/sendMail?cusEmail=${bill.customer.getCustomer_email()}&billID =${bill.getBill_id()}" class="tm-product-edit-link">
                                                    <button type="button" class="btn btn-info">Accept</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="${pageContext.request.contextPath}/component/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/tooplate-script.min.js"></script>

        <style>
            .inactive-row {
                background-color: #7F7F7F; /* Gray color for inactive rows */
            }
        </style>
        <script>
            // Data for 12 months
            const months = [
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ];
            // Replace this data with your actual values
            const monthlyMoney = [0,0,0,0,0,0,7,6,5,20,10,40];
            // Create the line chart
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: months,
                    datasets: [{
                            label: 'Monthly Money',
                            data: monthlyMoney,
                            borderColor: 'rgba(0, 0, 0, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                font: {
                                    family: "'Arial', sans-serif",
                                    size: 12,
                                    color: '#333'
                                }
                            }
                        },
                        x: {
                            ticks: {
                                font: {
                                    family: "'Arial', sans-serif",
                                    size: 12,
                                    color: '#333'
                                }
                            }
                        }
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: 'Monthly Money Line Chart',
                            font: {
                                family: "'Arial', sans-serif",
                                size: 16,
                                weight: 'bold',
                                color: '#333'
                            }
                        }
                    }
                }
            });

        </script>

    </body>
</html>