<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
        <title>Shopping cart</title>
        <style>

            .image-container {
                width: 15px; /* Set the width of the container */
                height: 20px; /* Set the height of the container */
                overflow: hidden; /* Hide overflowing content */
                border: 1px solid #ccc; /* Optional: Add a border */
            }

            .fixed-size-image {
                width: 100%; /* Set the width of the image to fill its container */
                height: auto; /* Allow the height to adjust proportionally */
                display: block; /* Ensure the image is a block element */
            }
            .center{
                align-items: center;

            }
        </style>

    </head>
    <body>
        <%@include file= "../component/nav_bar.jsp" %>
        <div class="container mb-4">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
<!--                        <div class="alert alert-danger" role="alert">
                           ${message}
                        </div>-->
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col"> </th>
                                    <th scope="col">Product</th>
                                    <th scope="col" class="text-center">Quantity</th>
                                    <th scope="col" class="text-right">Price</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="book" items="${product}">

                                    <tr>
                                        <td class="align-middle center"><img class="fixed-size-image" src="${book.getBook().book_img}" style="width:30px;height: 50px;" /> </td>
                                        <td class="center">${book.getBook().book_name}</td>
                                        <td><input class="form-control center" type="text" value="${book.getQuantity()}" /></td>
                                        <td class="text-right ">${book.getBook().price}$</td>
                                        <td class="text-right"><a href="${pageContext.request.contextPath}/deleteCart?bid=${book.id}"> <button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button></a> </td>
                                    </tr>

                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><strong>Total</strong></td>
                                    <td class="text-right"><strong><%= request.getAttribute("total")%> $</strong></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col mb-2">
                    <div class="row">
                        <div class="col-sm-12  col-md-6"  >
                            <a href="${pageContext.request.contextPath}/HomeController" style="text-decoration: none;">
                                <button class="btn btn-block btn-light">Continue Shopping</button>
                            </a>
                        </div>
                        <div class="col-sm-12 col-md-6 text-right" >
                            <a href="${pageContext.request.contextPath}/bill?total=${total}" style="text-decoration: none;
                               ">
                                <button class="btn btn-lg btn-block btn-success text-uppercase" style="text-decoration: none;">Checkout</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
