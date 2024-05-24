<c:forEach var="book" items="${books}">
    <div class="col-sm">
        <div class="card" style="
             justify-content: center;
             align-items: center;">
            <a href="${pageContext.request.contextPath}/detail"> 
                <img class="card-img-top" src="${book.book_img}" alt="Card image cap" style=" width: 180px;
                     height: 280px;
                     object-fit: cover;
                     justify-content: center;
                     align-items: center;">
            </a>


            <div class="card-body d-flex flex-column align-items-center">
                <h4 class="card-title"><a href="" title="View Product">${book.book_name}</a></h4>
                <div class="row w-100">
                    <div class="col">
                        <p class="btn btn-danger btn-block">${book.price}$</p>
                    </div>
                    <div class="col">
                        <a href="${pageContext.request.contextPath}/addCart?bookid=${book.book_id}" class="btn btn-success btn-block">Add to cart                           
                        </a>
                    </div>
                </div>
            </div>


        </div>
    </div>
</c:forEach>

