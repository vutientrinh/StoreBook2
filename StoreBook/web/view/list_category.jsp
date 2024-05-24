
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
            <h2 >You search book have tag : ${txtSearch}</h2>
            <br></br>
            <div class="row">

                <c:forEach var="book" items="${listProduct}">
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
                                    <b>Price</b> : ${book.price}$
                                </p>
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

    </body>
</html>
