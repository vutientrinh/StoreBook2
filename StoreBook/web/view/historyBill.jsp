
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Site meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>BookStore</title>
        <!-- CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
        <style>
            /* Add hover effect and zoom to the image */
            .zoom-img {
                transition: transform 0.3s ease;
            }

            .zoom-img:hover {
                transform: scale(1.1); /* Adjust the scale factor to your preference */
            }
            /* Styles for the custom button */
            .custom-button {
                /* Add your desired button styles here */
                /* For example: */
                padding: 10px 20px;
                border-radius: 5px;
                transition: all 0.3s ease;
                /* Other basic button styles */
            }

            /* Hover effect */
            .custom-button:hover {
                /* Add effects to apply on hover */
                /* For example: */
                transform: scale(1.1);
                /* Other hover effects */
            }

            /* Click effect */
            .custom-button:active {
                /* Add effects to apply on click */
                /* For example: */
                transform: scale(0.9);
                /* Other click effects */
            }
            .card-title{
                font-weight: 600;
            }
            .card-title:hover {
                /* Add effects to apply on hover */
                /* For example: */
                transform: scale(1.1);
                /* Other hover effects */
            }

            /* Click effect */
            .card-title a:active {
                /* Add effects to apply on click */
                /* For example: */
                color: red; /* Change color on click */
                /* Other click effects */
            }
        </style>
    </head>
    <body>
        <%@include file= "../component/nav_bar.jsp" %>
        <div class="container">

            <div class="row">
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">History Bill</h2>
                        <table class="table table-hover tm-table-small tm-product-table">
                            <thead>
                                <tr>
                                    <th scope="col">USER NAME</th>
                                    <th scope="col">ADRESS</th>
                                    <th scope="col">PHONE NUMBER</th>
                                    <th scope="col">STATUS</th>
                                    <th scope="col">Payment Date</th>
                                    <th scope="col">&nbsp;</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="bill" items="${bill}">
                                    <tr>
                                        <td>${bill.customer.getCustomer_name() }</td>
                                        <td class="tm-product-name">${bill.customer.getAddress()}</td>
                                        <td>${bill.customer.getPhone_number()}</td>
                                        <td>${bill.getStatus()}</td>
                                        <td>${bill.getPayment_date()}</td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/component/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/tooplate-script.min.js"></script>

    </body>
</html>
