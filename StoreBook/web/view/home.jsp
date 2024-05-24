
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
        </style>
    </head>
    <body>

        <%@include file= "../component/nav_bar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" style="border-radius: 10px;">
                            <div class="carousel-item active" style="border-radius: 10px;">
                                <img class="d-block w-100" style="height: 550px;
                                     object-fit: cover;
                                     border-radius: 10px;" src="https://img.freepik.com/free-photo/book-composition-with-open-book_23-2147690555.jpg?size=626&ext=jpg&ga=GA1.1.1427958172.1701683531&semt=sph" alt="First slide">
                            </div>
                            <div class="carousel-item" style="border-radius: 10px;">
                                <img class="d-block w-100" style="height: 550px;
                                     object-fit: cover;
                                     border-radius: 10px;" src="https://img.freepik.com/premium-photo/education-concept-with-tree-knowledge-planting-opening-old-big-book-library-with-textbook_488220-26832.jpg?size=626&ext=jpg&ga=GA1.1.1427958172.1701683531&semt=sph" alt="Second slide">
                            </div>
                            <div class="carousel-item" style="border-radius: 10px;">
                                <img class="d-block w-100" style="height: 550px;
                                     object-fit: cover;
                                     border-radius: 10px;" src="https://img.freepik.com/free-photo/book-library-with-open-textbook_1150-5923.jpg?size=626&ext=jpg&ga=GA1.1.1427958172.1701683531&semt=sph" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>


                <!-- here is top product display-->

                <div class="col-12 col-md-3" style="height:550px">
                        <div class="card" >
                            <div class="card-header bg-success text-white text-uppercase">
                                <i class="fa fa-heart"></i> New product
                            </div>
                            <img class="img-fluid border-0 zoom-img" src="${newBook.book_img}" alt="Card image cap" style="margin: 10px;
                            border-radius: 10px;
                            box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px, rgba(17, 17, 26, 0.1) 0px 24px 80px;">
                        <div class="card-body">
                            <h4 class="card-title text-center card-title" style="margin-bottom:10px;"><a href="${pageContext.request.contextPath}/detail?bid=${newBook.book_id}" title="View Product" style="color: black;
                                                                                                         text-decoration: none;">${newBook.book_name}</a></h4>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">${newBook.price}$</p>
                                </div>
                                <div class="col">
                                    <a href="${pageContext.request.contextPath}/detail?bid=${newBook.book_id}" class="btn btn-success btn-block">View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Box of lastproduct  need to be fix UI-->
        <div class="container mt-3">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header bg-primary text-white text-uppercase">
                            <i class="fa fa-star"></i> Last products
                        </div>
                        <div class="card-body">
                            <div class="row" >
                                <c:forEach var="book" items="${lastbooks}">
                                    <div class="col-sm" style="height:auto;
                                         width: 250px;">
                                        <div class="card" style="
                                             justify-content: center;
                                             align-items: center;">
                                            <a href="${pageContext.request.contextPath}/detail?bid=${book.book_id}" style="margin-top: 20px;"> 
                                                <img class="card-img-top zoom-img" src="${book.book_img}" alt="Card image cap" style=" width: 180px;
                                                     height: 280px;
                                                     object-fit: cover;
                                                     justify-content: center;
                                                     align-items: center;
                                                     border-radius:10px;
                                                     box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                                                     ">
                                            </a>

                                            <div class="card-body d-flex flex-column align-items-center" style="width: 180px;">
                                                <span class="card-title"  style=" width: auto;
                                                      height: 80px;
                                                      display:flex;
                                                      object-fit: cover;
                                                      justify-content: center;
                                                      align-items: center;
                                                      color:black;
                                                      text-align: center;
                                                      font-size: 22px;"><a href="" title="View Product" style="color: gray;
                                                     text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
                                                     text-decoration: none">${book.book_name}</a>
                                                </span>
                                                <div class="row">
                                                    <div class="col">
                                                            <p class="btn btn-danger btn-block">${book.price}$</p>
                                                    </div>
                                                    <div class="col">
                                                        <a href="${pageContext.request.contextPath}/addCart?bid=${book.book_id}&quantity=1" class="btn btn-success btn-block custom-button" style="width: auto;">Add to cart                           
                                                        </a>
                                                    </div>

                                                    <div class="col">
                                                        <p>Sale : ${book.getBought()}</p>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container mt-3 mb-4">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header bg-primary text-white text-uppercase">
                            <i class="fa fa-trophy"></i> Best products
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach var="book" items="${bestbooks}">
                                    <div class="col-sm" style="height:auto;
                                         width: 250px;">
                                        <div class="card" style="
                                             justify-content: center;
                                             align-items: center;">
                                            <a href="${pageContext.request.contextPath}/detail?bid=${book.book_id}" style="margin-top: 20px;"> 
                                                <img class="card-img-top zoom-img" src="${book.book_img}" alt="Card image cap" style=" width: 180px;
                                                     height: 280px;
                                                     object-fit: cover;
                                                     justify-content: center;
                                                     align-items: center;
                                                     border-radius:10px;
                                                     box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;">
                                            </a>

                                            <div class="card-body d-flex flex-column align-items-center" style="width: 180px;">
                                                <span class="card-title"  style=" width: auto;
                                                      height: 80px;
                                                      display:flex;
                                                      object-fit: cover;
                                                      justify-content: center;
                                                      align-items: center;
                                                      color:black;
                                                      text-align: center;
                                                      font-size: 22px;"><a href="" title="View Product" style="color: gray;
                                                     text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
                                                     text-decoration: none">${book.book_name}</a></span>
                                                    <div class="row">
                                                        <div class="col">
                                                            <p class="btn btn-danger btn-block">${book.price}$</p>
                                                        </div>
                                                        <div class="col">
                                                            <a href="${pageContext.request.contextPath}/addCart?bid=${book.book_id}&quantity=1" class="btn btn-success btn-block custom-button" style="width: auto;">Add to cart                           
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Sale : ${book.getBought()}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <c:forEach var="book" items="${allBook}">
                    <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                        <div class="card h-100">
                            <a href="${pageContext.request.contextPath}/detail?bid=${book.book_id}">
                                <img src="${book.book_img}" class="card-img zoom-img" alt="${book.book_name}" style="width: 100%;
                                     height: 200px; /* Set your desired fixed height */
                                     overflow: hidden;
                                     object-fit: cover;">
                            </a>

                            <div class="card-body">
                                <span class="card-title" style="width: auto;
                                      height: 80px;
                                      display:flex;
                                      object-fit: cover;
                                      justify-content: center;
                                      align-items: center;
                                      color:black;
                                      text-align: center;
                                      font-size: 20px;">${book.book_name}
                                </span>

                                <p class="card-text" style="
                                   width: auto;
                                   object-fit: cover;
                                   justify-content: center;
                                   display: flex;
                                   align-items: center;">
                                    <b>Price </b> : ${book.price}$

                                </p>
                                <div class="col">
                                    <p>Sale : ${book.getBought()}</p>
                                </div>
                                <!-- Other details -->
                            </div>

                        </div>
                    </div>

                    <!-- Close the row and start a new row after every 5 items -->
                    <c:if test="${(status.index + 1) % 5 == 0}">
                    </div><div class="row">
                    </c:if>
                </c:forEach>
                <!-- Repeat the card structure for more book items -->
            </div>
        </div>




        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">

                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- JS -->
        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
        </script>

    </body>