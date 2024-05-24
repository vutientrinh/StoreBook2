<%-- 
    Document   : insert_page
    Created on : Nov 21, 2023, 7:35:56 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

    <body>
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
    <div class="container tm-mt-big tm-mb-big" id="product-details">
      <div class="row">
          <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
              <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                  <div class="row">
                      <div class="col-12">
                          <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                      </div>
                  </div>
                  <div class="row tm-edit-product-row">
                      <div class="col-xl-6 col-lg-6 col-md-12">
                          <form action="" method="post" class="tm-edit-product-form">
                              <div class="form-group mb-3">
                                  <label for="id">ID</label>
                                  <input id="id" name="id" type="text" value="" class="form-control validate" readonly />
                              </div>
                              <div class="form-group mb-3">
                                  <label for="name">Product Name</label>
                                  <input id="name" name="name" type="text" value=""
                                      class="form-control validate" />
                              </div>
                              <div class="form-group mb-3">
                                  <label for="price">Price</label>
                                  <input id="price" name="price" type="text" value="" class="form-control validate" />
                              </div>
                              <div class="form-group mb-3">
                                  <label for="quantity">Quantity</label>
                                  <input id="quantity" name="quantity" type="text" value="" class="form-control validate" />
                              </div>
                              <div class="form-group mb-3">
                               <label
                                for="expire_date"
                                >Publication
                                 </label>
                                    <input
                            id="expire_date"
                            name="expire_date"
                            type="text"
                            class="form-control validate"
                            data-large-mode="true"
                                 />
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
                                          
                          </form>
                         
                        </div>
                        
                        <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                          <div class="tm-product-img-edit mx-auto">
                            <div class="form-group mb-3">
                              <label for="description">Description</label>
                              <textarea id="description" name="description" class="form-control validate tm-small"
                                  rows="5" required>
                              </textarea>
                          </div>
                            <img id="productImage" src="img/product-image.jpg" alt="Product image" class="img-fluid d-block mx-auto">
                            <i
                              class="fas fa-cloud-upload-alt tm-upload-icon"
                              onclick="document.getElementById('fileInput').click();"
                            ></i>
                          </div>
                          <div class="custom-file mt-3 mb-3">
                            <input id="fileInput" type="file" style="display:none;" onchange="previewImage(this);" />
                            <input
                              type="button"
                              class="btn btn-primary btn-block mx-auto"
                              value="CHANGE IMAGE NOW"
                              onclick="document.getElementById('fileInput').click();"
                            />
                          </div>
                          <div class="form-group mb-3">
                            <label for="publisher">Publisher</label>
                            <input id="publisher" name="publisher" type="text" value=""
                                class="form-control validate" />
                        </div>
                        <div class="form-group mb-3">
                            <label for="author">Author</label>
                            <input id="author" name="author" type="text" value="" class="form-control validate" />
                        </div>
                        <div class="form-group mb-3">
                                  <label for="version">Version</label>
                                  <input id="version" name="version" type="text" value="" class="form-control validate" />
                        </div>    
                        </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  
    <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
          
            
            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
        </p>
        </div>
    </footer> 

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
        
    function previewImage(input) {
    var file = input.files[0];

    if (file) {
      var reader = new FileReader();

      reader.onload = function (e) {
        document.getElementById('productImage').src = e.target.result;
      };

      reader.readAsDataURL(file);
    }
  }    
        
         $(document).ready(function () {
        $('.selectpicker').selectpicker();
    });
      $(function() {
        $("#expire_date").datepicker({
          defaultDate: "10/22/2020"
        });
      });
    </script>
  </body>
</html>
