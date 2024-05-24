<%-- 
    Document   : insert_page
    Created on : Nov 21, 2023, 7:35:56 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Product - Dashboard HTML Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/fontawesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->

        <!--STYLE-->
        <style>
            #authorList,
            #categoryList {
                cursor: pointer;
                border: 1px solid #000;
                display: none;
                margin-bottom: 16px;
                max-height: 100px;
                overflow-y: auto;
                padding: 10px;
                width: calc(100% - 22px);
            }
            .suggestion:hover {
                background-color: #ccc;
            }
            .suggestion {
                cursor: pointer;
                padding: 5px;
            }
        </style>
        <!--STYLE-->

        <!--SUGGESTION-->
        <script>
            var categories = [];
            var authors = [];
            var publishers = [];

            function fetchCategories() {
                console.log('fetchCategories called');
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'categoryServlet', true);
                xhr.onload = function () {
                    console.log('AJAX call completed');
                    if (this.status === 200) {
                        categories = JSON.parse(this.responseText);
                        console.log('Categories:', categories);
                    }
                };
                xhr.onerror = function () {
                    console.log('AJAX call failed');
                };
                xhr.send();
            }

            function suggestCategories(input) {
                var list = document.getElementById('categoryList');
                list.innerHTML = '';
                var lastWord = input.value.split(',').pop().trim();
                var suggestions = categories.filter(category => category.category_name.toLowerCase().includes(lastWord.toLowerCase()));
                suggestions.forEach(function (suggestion) {
                    var div = document.createElement('div');
                    div.textContent = suggestion.category_name;
                    div.classList.add('suggestion');
                    div.onclick = function () {
                        var words = input.value.split(',');
                        words.pop();
                        words.push(suggestion.category_name);
                        input.value = words.join(', ');
                        list.style.display = 'none';
                    };
                    list.appendChild(div);
                });
                list.style.display = lastWord && suggestions.length ? 'block' : 'none';
            }


            function fetchAuthor() {
                console.log('fetchAuthor called');
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'authorServlet', true);
                xhr.onload = function () {
                    console.log('AJAX call completed');
                    if (this.status === 200) {
                        authors = JSON.parse(this.responseText);
                        console.log('authors: ', authors);
                    }
                };
                xhr.onerror = function () {
                    console.log('AJAX call failed');
                };
                xhr.send();
            }

            function fetchPublisher() {
                console.log('fetchPublisher called');
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'publisherServlet', true);
                xhr.onload = function () {
                    console.log('AJAX call completed');
                    if (this.status === 200) {
                        publishers = JSON.parse(this.responseText);
                        console.log('Publisher ', publishers);
                    }
                };
                xhr.onerror = function () {
                    console.log('AJAX call failed');
                };
                xhr.send();
            }

            window.onload = function () {
                console.log('Page loaded');
                fetchCategories();
                fetchAuthor();
                fetchPublisher();
            };


            function suggestAuthor(input) {
                var list = document.getElementById('authorList');
                list.innerHTML = '';
                var lastWord = input.value.trim();
                var suggestions = authors.filter(author => author.author_name.toLowerCase().includes(lastWord.toLowerCase()));
                suggestions.forEach(function (suggestion) {
                    var div = document.createElement('div');
                    div.textContent = suggestion.author_name;
                    div.classList.add('suggestion');
                    div.onclick = function () {
                        input.value = suggestion.author_name;
                        list.style.display = 'none';
                    };
                    list.appendChild(div);
                });
                list.style.display = lastWord && suggestions.length ? 'block' : 'none';
            }

            function suggestPublisher(input) {
                var list = document.getElementById('publisherList');
                list.innerHTML = '';
                var lastWord = input.value.trim();
                var suggestions = publishers.filter(publisher => publisher.publisher_name.toLowerCase().includes(lastWord.toLowerCase()));
                suggestions.forEach(function (suggestion) {
                    var div = document.createElement('div');
                    div.textContent = suggestion.publisher_name;
                    div.classList.add('suggestion');
                    div.onclick = function () {
                        input.value = suggestion.publisher_name;
                        list.style.display = 'none';
                    };
                    list.appendChild(div);
                });
                list.style.display = lastWord && suggestions.length ? 'block' : 'none';
            }
        </script>
        <!--SUGGESTION-->
    </head>

    <body>
        <!--NAV BAR-->
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="main_allbook.jsp">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="../customer/register.jsp">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--NAV BAR-->

        <!--ADD A BOOK, PUBLISHER/AUTHOR/CATEGORY IF NEW-->
        <form action="addBook" method="post" class="tm-edit-product-form">
            <div class="container tm-mt-big tm-mb-big" id="product-details">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block" >Edit Product</h2>
                                </div>
                            </div>

                            <div class="row tm-edit-product-row">

                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <div class="form-group mb-3">
                                        <label for="name">Product Name</label>
                                        <input id="name" name="name" type="text" value = "${book.book_name}" class="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="price">Price</label>
                                        <input id="price" name="price" type="text" value = "${book.price}" class="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="quantity">Quantity</label>
                                        <input id="quantity" name="quantity" type="text" value = "${book.quantity}" class="form-control validate" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="languages">Languages</label>

                                        <select id="languages" name="languages" class="form-control selectpicker" data-live-search="true">

                                            <option data-tokens="english" selected>English</option>
                                            <option data-tokens="french">French</option>
                                            <option data-tokens="vietnamese">Vietnamese</option>
                                            <option data-tokens="germany">Germany</option>

                                        </select>                   
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="status">Status</label>
                                        <input id="status" name="status" type="text" value = "${book.status}" class="form-control validate" />
                                    </div>
                                    <div class="tm-product-img-edit mx-auto">
                                        <div class="form-group mb-3">
                                            <label for="description">Description</label>
                                            <input id="description" name="description" type="text" value = "${book.descriptions}" class="form-control validate tm-small"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12">


                                    <div class="custom-file mt-3 mb-3">
                                        <input id="imageUrlInput" name="imageUrlInput" type="text" value = "${book.book_img}" class="form-control" placeholder="Enter Image URL" onchange="previewImage();" />
                                    </div>

                                    <!-- Image preview -->
                                    <div id="imagePreviewContainer" style="display:flex; align-items: center; justify-content: center;">
                                        <img id="productImage" src="" alt="Image Preview" style="max-width: 25%;" />
                                    </div>

                                    <script>
                                        function previewImage() {
                                            var imageUrlInput = document.getElementById('imageUrlInput');
                                            var imageUrl = imageUrlInput.value;

                                            var previewImage = document.getElementById('productImage');
                                            previewImage.src = imageUrl;
                                            previewImage.style.display = 'block';

                                            var imagePreviewContainer = document.getElementById('imagePreviewContainer');
                                            imagePreviewContainer.style.display = 'block';
                                        }
                                    </script>


                                    <div class="form-group mb-3">
                                        <label for="publisher">Publisher</label>
                                        <input id="publisher" name="publisher" type="text" value = "${book.publisher.publisher_name}" class="form-control validate" oninput="suggestPublisher(this)"/>
                                    </div>
                                    <div id="publisherList"></div>

                                    <div class="form-group mb-3">
                                        <label for="author">Author</label>
                                        <input id="author" name="author" type="text" value = "${book.author.author_name}" class="form-control validate" oninput="suggestAuthor(this)"/>
                                    </div>
                                    <div id="authorList"></div>

                                    <div class="form-group mb-3">
                                        <label for="tags">Categories</label> 
                                        <input id="tags" name="tags" type="text" value = "${tags}" class="form-control validate" oninput="suggestCategories(this)"/>
                                    </div>  
                                    <div id="categoryList"></div>

                                    <div class="form-group mb-3">
                                        <label for="version">Version</label> 
                                        <input id="version" name="version" type="text" value = "${book.version}" class="form-control validate" />
                                    </div>  

                                    <div class="form-group mb-3">
                                        <input type="hidden" name="bid" value="${book.book_id}">
                                        <input type="submit" value="add" class="btn btn-primary"> 
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--ADD A BOOK, PUBLISHER/AUTHOR/CATEGORY IF NEW-->

        <!--FOOTER-->
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                </p>
            </div>
        </footer> 
        <!--FOOTER-->

        <script src="${pageContext.request.contextPath}/component/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/tooplate-script.min.js"></script>

    </body>
</html>
