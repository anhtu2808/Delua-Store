<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        <!-- import CSS Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/checkout.css">
        <!--        <link rel="stylesheet" href="css/main.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container mt-5">
            <h1 class="mb-4 header">Check Out</h1>
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Your cart</span>
                        <span class="badge badge-secondary badge-pill">${cartList.size()}</span>
                    </h4>
                    <ul class="list-group mb-3">
                         <c:set var="toltal" value="${0}" />
                        <c:forEach var="item" items="${cartList}">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <c:set var="variant" value="${item.variant}" />
                                <c:set var="product" value="${variant.product}" />
                                <c:set var="brand" value="${product.brand.brandName}" />
                                <c:set var="total" value ="${total+item.quantity*variant.price}"/>
                                <c:set var="productName" value="${brand} ${product.productName} ${variant.color}" />

                                <div>
                                    <h6 class="my-0">${productName}</h6>
                                    <small class="text-muted">x${item.quantity}</small>
                                </div>
                                <span class="text-muted">$${variant.price}</span>
                            </li>
                        </c:forEach>

                       
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (USD)</span>
                            <strong>$${total}</strong>
                          
                        </li>
                    </ul>

                </div>


                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Billing address</h4>
                    <form action="./Checkout" method="GET" class="needs-validation" novalidate="">
                        
                        <input type="hidden" name="total" value="${total}">
                        <div class="mb-3">
                            <label for="orderId" >Order ID</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="orderId" placeholder="orderId" required="" value="${maxOrderId}" readonly>                              

                                <div class="invalid-feedback" style="width: 100%;">
                                    Your name is required.
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="name">Name</label>
                            <div class="input-group">
                                <input  name="name" type="text" class="form-control" id="name" placeholder="name"   required="" value="${sessionScope.usersession.name} ">                              

                                <div class="invalid-feedback" style="width: 100%;">
                                    Your name is required.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="username">Username</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">@</span>
                                </div>
                                <input name="userName" type="text" class="form-control" id="username"  value="${sessionScope.usersession.username}" placeholder="Username" readonly>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Your username is required.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">Email <span class="text-muted">(Optional)</span></label>
                            <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com" value="${sessionScope.usersession.email}">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address">Street</label>
                            <input name="street" type="text" class="form-control" id="address" placeholder="1234 Main St" required="" value="${sessionScope.usersession.address.street}">
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="city">City/Town</label>
                                <input name="city" type="text" class="form-control" id="city" placeholder=""  required=""value="${sessionScope.usersession.address.city}">
                                <div class="invalid-feedback">
                                    Valid City/Town is required.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="state">State</label>
                                <input name="state" type="text" class="form-control" id="state" placeholder="" required="" value="${sessionScope.usersession.address.state}">
                                <div class="invalid-feedback">
                                    Valid State is required.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>  
                    </form>
                </div>
                <hr class="mb-4">


            </div>
        </div>

        <!-- import JS Bootstrap and dependencies-->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
