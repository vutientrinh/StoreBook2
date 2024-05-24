<%-- 
    Document   : bookdetail
    Created on : Nov 18, 2023, 2:25:50 PM
    Author     : acer
--%>

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
                <!-- Image -->
                <div class="col-12 col-lg-6">
                    <div class="card bg-light mb-3">
                        <div class="card-body">
                            <a href="" data-toggle="modal" data-target="#productModal">
                                <img class="img-fluid" src="${detail.book_img}" />
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Add to cart -->
                <div class="col-12 col-lg-6 add_to_cart_block">
                    <div class="card bg-light mb-3">
                        <div class="card-body">
                            <h2>${detail.book_name}</h2>
                            <p class="price"> Price : ${detail.price}$</p>
                            <div style = "
                                 text-decoration: none;
                                 margin-top: 10px;
                                 margin-bottom: 10px;
                                 ">
                                <span><a href="#" style="color:black;">${book.author.getAuthor_name()} </a>( Author )</span>
                                <span><a href="#" style="color:black;">${book.publisher.publisher_name()}</a>( Publisher )</span>
                            </div>
                            <div class="product-detail" style="
                                 border-collapse: collapse;
                                 width: 100%;
                                 margin-top: 10px;
                                 margin-bottom: 10px;
                                 ">
                                <h3>Product detail</h3>
                                <table class="table-detail" style="
                                       margin-left: 10px;
                                       padding: 10px;
                                       width: fit-content;">
                                    <tr>
                                        <td style="width: 200px">Publisher</td>
                                            <td>${book.publisher.getPublisher_name()}</td>
                                        </tr>

                                        <tr>
                                            <td>Language</td>
                                            <td>English</td>
                                        </tr>
                                        <tr>
                                            <td>Type</td>
                                            <td>Hardcover</td>
                                        </tr>
                                    </table>
                                </div>

                                <form method="post" action="addCart">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="idProduct"
                                               name="bid" value="${detail.book_id}">
                                        <label>Quantity : ${detail.getQuantity()}</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control"  id="quantity" name="quantity" min="1" max="100" value="1">
                                            <div class="input-group-append">
                                                <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-success btn-lg btn-block    text-uppercase"
                                           value="Add to cart">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Description -->
                    <div class="col-12">
                        <div class="card border-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> Description</div>
                            <div class="card-body">
                                <p class="card-text">
                                    Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.
                                </p>
                                <p class="card-text">
                                    Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans. Un professeur du Hampden-Sydney College, en Virginie, s'est intéressé à un des mots latins les plus obscurs, consectetur, extrait d'un passage du Lorem Ipsum, et en étudiant tous les usages de ce mot dans la littérature classique, découvrit la source incontestable du Lorem Ipsum. Il provient en fait des sections 1.10.32 et 1.10.33 du "De Finibus Bonorum et Malorum" (Des Suprêmes Biens et des Suprêmes Maux) de Cicéron. Cet ouvrage, très populaire pendant la Renaissance, est un traité sur la théorie de l'éthique. Les premières lignes du Lorem Ipsum, "Lorem ipsum dolor sit amet...", proviennent de la section 1.10.32.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                //Plus & Minus for Quantity product
                $(document).ready(function () {
                    var quantity = 1;

                    $('.quantity-right-plus').click(function (e) {
                        e.preventDefault();
                        var quantity = parseInt($('#quantity').val());
                        $('#quantity').val(quantity + 1);
                    });

                    $('.quantity-left-minus').click(function (e) {
                        e.preventDefault();
                        var quantity = parseInt($('#quantity').val());
                        if (quantity > 1) {
                            $('#quantity').val(quantity - 1);
                        }
                    });

                });
            </script>

        </body>

    </html>
