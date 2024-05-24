<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/HomeController">BookStation</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" >
                    Category
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/search?cid=1">Friction</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/search?cid=2">Science friction</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/search?cid=3">Fantasy</a>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/login" class="custom-button">
                <button>Login</button>
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="custom-button">
                <button>Log out</button>
            </a>

            <form method="post" action="search" class="form-inline my-2 my-lg-0 ">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" name="searchValue" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>

                </div>
            </form>
            <a class="btn btn-success btn-sm ml-3" href="${pageContext.request.contextPath}/showCart">
                <i class="fa fa-shopping-cart"></i> Cart
                <span class="badge badge-light"></span>
            </a>
            <a class="btn btn-success btn-sm ml-3" href="${pageContext.request.contextPath}/showHistory" style="background-color: blue;">
                <i class="fa fa-shopping-cart"></i> Purchase History
                <span class="badge badge-light"></span>
            </a>



        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Welcome to my shop</h1>
        <p class="lead text-muted mb-0">If you would tell me the heart of a man, tell me not what he reads, but what he rereads</p>
    </div>
</section>
