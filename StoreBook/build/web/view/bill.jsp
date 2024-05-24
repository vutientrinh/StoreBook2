
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Bill</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../component/style.css">
        <script>
            // Lấy giá và số lượng sách từ dữ liệu
            var bookPrice = $${book.book.price};
            var quantity = ${book.getQuantity()};

            // Tính tổng giá và đặt kết quả vào thẻ <td>
            var totalPrice = bookPrice * quantity;

            // Định dạng kết quả và gán vào thẻ <td> với id là "totalPrice"
            document.getElementById("totalPrice").innerText = "$" + totalPrice.toFixed(2);
        </script>
        <style>

            /* These styles are only for rendering in a browser */

            /*
              The styles here for use when generating a PDF invoice with the HTML code.
            
              * Set up a repeating page counter
              * Place the .footer-info in the last page's footer
            */
            /*
              Common invoice styles. These styles will work in a browser or using the HTML
              to PDF anvil endpoint.
            */

            body {
                font-size: 16px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table tr td {
                padding: 0;
            }

            table tr td:last-child {
                text-align: right;
            }

            .bold {
                font-weight: bold;
            }

            .right {
                text-align: right;
            }

            .large {
                font-size: 1.75em;
            }

            .total {
                font-weight: bold;
                color: #fb7578;
            }

            .logo-container {
                margin: 20px 0 70px 0;
            }

            .invoice-info-container {
                font-size: 0.875em;
            }

            .invoice-info-container td {
                padding: 4px 0;
            }

            .client-name {
                font-size: 1.5em;
                vertical-align: top;
            }

            .line-items-container {
                margin: 70px 0;
                font-size: 0.875em;
            }


            .line-items-container td img {
                max-height: 40px;
                display: inline-block;
                vertical-align: middle;
                /* Thêm thuộc tính vertical-align */
                margin-right: 25px;
            }

            .line-items-container th {
                text-align: left;
                color: #999;
                border-bottom: 2px solid #ddd;
                padding: 10px 0 15px 0;
                font-size: 0.75em;
                text-transform: uppercase;
            }

            .line-items-container th:last-child {
                text-align: right;
            }

            .line-items-container td {
                padding: 15px 0;
            }

            .line-items-container tbody tr:first-child td {
                padding-top: 25px;
            }

            .line-items-container.has-bottom-border tbody tr:last-child td {
                padding-bottom: 25px;
                border-bottom: 2px solid #ddd;
            }

            .line-items-container.has-bottom-border {
                margin-bottom: 0;
            }

            .line-items-container th.heading-quantity {
                width: 50px;
            }

            .line-items-container th.heading-price {
                text-align: right;
                width: 100px;
            }

            .line-items-container th.heading-subtotal {
                width: 100px;
            }

            .payment-info {
                width: 38%;
                font-size: 0.75em;
                line-height: 1.5;
            }

            .footer {
                margin-top: 100px;
            }

            .footer-thanks {
                font-size: 1.125em;
            }

            .footer-thanks img {
                display: inline-block;
                position: relative;
                top: 1px;
                width: 16px;
                margin-right: 4px;
            }

            .footer-info {
                float: right;
                margin-top: 5px;
                font-size: 0.75em;
                color: #ccc;
            }

            .footer-info span {
                padding: 0 5px;
                color: black;
            }

            .footer-info span:last-child {
                padding-right: 0;
            }

            .page-container {
                display: none;
            }

            .footer {
                margin-top: 30px;
            }

            .footer-info {
                float: none;
                position: running(footer);
                margin-top: -25px;
            }

            .page-container {
                display: block;
                position: running(pageContainer);
                margin-top: -25px;
                font-size: 12px;
                text-align: right;
                color: #999;
            }

            .page-container .page::after {
                content: counter(page);
            }

            .page-container .pages::after {
                content: counter(pages);
            }


            @page {
                @bottom-right {
                    content: element(pageContainer);
                }

                @bottom-left {
                    content: element(footer);
                }
            }

            .web-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 50px;
            }

        </style>
    </head>

    <body>

        <div class="web-container">


            <table class="invoice-info-container">
                <tr>
                    <td rowspan="2" class="client-name">
                        Client Name
                    </td>
                    <td>
                        Anvil Co
                    </td>
                </tr>
                <tr>
                    <td>
                        123 Main Street
                    </td>
                </tr>
                <tr>
                    <td>
                        Invoice Date: <strong>${newbill.payment_date}</strong>
                    </td>
                    <td>
                        ${user.address}
                    </td>
                </tr>
                <tr>
                    <td>
                        Invoice No: <strong>12345</strong>
                    </td>
                    <td>
                        ${user.customer_email}
                    </td>
                </tr>
            </table>


            <table class="line-items-container">
                <thead>
                    <tr>
                        <th class="heading-quantity">Qty</th>
                        <th class="heading-description">Description</th>
                        <th class="heading-price">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${listproduct}">
                        <tr>
                            <td>${book.getQuantity()}</td>
                            <td> <img src="${book.book.book_img}" alt="book">${book.book.book_name}</td>
                            <td class="right">$${book.book.price}</td>
                            <td class="bold" id="totalPrice"></td>

                        </tr>

                    </c:forEach>

                </tbody>
            </table>


            <table class="line-items-container has-bottom-border">
                <thead>
                    <tr>
                        <th>Due By</th>
                        <th>Total Due</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td class="large">${newbill.payment_date}</td>
                        <td class="large total">${total}$</td>
                    </tr>
                </tbody>

            </table>
            <a href="${pageContext.request.contextPath}/HomeController"><!-- comment -->
                <button>Return</button>
            </a>
        </div>




    </body>

</html>
