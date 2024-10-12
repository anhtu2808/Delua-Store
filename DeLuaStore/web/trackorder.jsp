<%-- 
    Document   : successfullorder
    Created on : Jul 12, 2024, 3:06:21 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Track Order Detail</title>
        <!-- import CSS Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/trackorderdetail.css">
        <!--        <link rel="stylesheet" href="css/main.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
</button>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body ">
                <div class="text-right"> <i class="fa fa-close close" data-dismiss="modal"></i> </div>
                
                <div class="px-4 py-5">

                    <h5 class="text-uppercase">${order.user.name}</h5>



                <h4 class="mt-5 theme-color mb-5">Thanks for your order</h4>

                <span class="theme-color">Payment Summary</span>
                <div class="mb-3">
                    <hr class="new1">
                </div>
                <c:forEach var="item" items="${order.listOrderDetail}">
                <div class="d-flex justify-content-between">
                    <span class="font-weight-bold">${item.variant.product.productName}</span>
                     
                    <span class="text-muted">${item.variant.price}</span>
                </div>

                <div class="d-flex justify-content-between">
                   
                      <span class="text-muted">Quantity:${item.quantity} </span>
                </div>
                </c:forEach>

                
                
                <div class="d-flex justify-content-between mt-3">
                    <span class="font-weight-bold">Total</span>
                    <span class="font-weight-bold theme-color">
                        ${order.priceFormat()}</span>
                </div>  



                <div class="text-center mt-5">

                    <a href="./Home" class="btn btn-primary">Finish Order</a>
                  <!--  <button class="btn btn-primary">Finish Order</button> -->
                    


                </div>                   

                </div>


            </div>
        </div>
    </div>
    </body>
</html>
