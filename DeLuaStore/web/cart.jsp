<%@page import="DeLuaStore.Variant.VariantDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <base href="${pageContext.request.contextPath}/">
        <!-- import CSS Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>

        <%@ include file="header.jsp" %>
        <h1 class="mb-4 header">Shopping Cart</h1>
        <div class="container">
            <nav aria-label="breadcrumb-container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Shop</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
                </ol>
            </nav>
            <div class="shopping-cart">

                <div class="row">
                    <div class="col-md-9">
                        <div class="row border-bottom py-2  ">
                            <div class="col-4"><strong>Product</strong></div>
                            <div class="col-1"><strong>Price</strong></div>
                            <div class="col-3 d-flex price align-items-center"><strong>Delete</strong></div>  
                            <div class="col-2"><strong>Quantity</strong></div>
                            <div class="col-2"><strong>Total</strong></div>
                        </div>

                        <c:set var="index" value="-1" />
                        <c:set var="subTotal" value="0" />

                        <c:forEach var="item" items="${sessionScope.cartList}">
                            <c:set var="index" value="${index+1}" />
                            <div class="row py-2 product">
                                <div class="col-md-4 d-flex justify-content-start">
                                    <img src="assets/images/products/${item.variant.imagePath}" alt="Not found" class="product-img" >
                                    ${item.variant.product.brand.brandName} ${item.variant.product.productName}
                                </div>  
                                <div class="col-md-1 d-flex price align-items-start">
                                    <div class="strikethrough"> ${item.variant.price}</div> <br>
                                    <div style="margin-top:-30px">${item.variant.price *(100-item.variant.discount)/100} </div>
                                </div>
                                <div class="col-md-3 d-flex  align-items-center">

                                    <form action="./Cart" method="GET"> 
                                        <input type="hidden" name="index" value="${index}">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn-primary">Delete</button>
                                    </form>
                                </div>

                                <div class="col-md-2 quantity-controls">
                                    <form action="./Cart" method="GET"> 
                                        <input type="hidden" name="index" value="${index}">
                                        <input type="hidden" name="action" value="decreaseQuantity">
                                        <button type="submit" class="btn btn-outline-secondary btn-sm btn-decrement" min>-</button>
                                    </form>

                                    <input type="text" name="quantity" class="form-control quantity" value="${item.quantity}" min="1" readonly>

                                    <form action="./Cart" method="GET">
                                        <input type="hidden" name="index" value="${index}">
                                        <input type="hidden" name="action" value="increaseQuantity">
                                        <button type="submit" class="btn btn-outline-secondary btn-sm btn-increment">+</button>
                                    </form>

                                </div>


                                <div class="col-md-2 d-flex align-items-center">  ${item.quantity*item.variant.price *(100-item.variant.discount)/100}  </div>
                                <c:set var="subTotal" value="${subTotal+item.quantity*item.variant.price *(100-item.variant.discount)/100}" />
                                <hr> 
                            </div>  
                            <hr>
                        </c:forEach>     





                    </div>
                    <div class="col-md-3">
                        <div class="cart-total">
                            <h3> <strong>Cart Total</strong></h3>
                            <p>Total:${subTotal} </p>
                            <a href="./Cart?action=checkout&total=${subTotal}">
                                <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
                            </a>

                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="/footer.jsp" flush="true" />
            <script src="js/cart.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
