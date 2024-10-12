<%-- 
    Document   : productmanage
    Created on : Jul 11, 2024, 2:20:56 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>De Lua Store</title>
        <base href="${pageContext.request.contextPath}/">
        <!-- import CSS Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/usermanager.css">
        <!--            <link rel="stylesheet" href="css/main.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </nav> <jsp:include page="/adminheader.jsp" flush="true" />
    <div class="container mt-5">
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-products">
                    <div class="tm-product-table-container">
                        <table class="table table-hover tm-table-small tm-product-table">
                            <thead>
                                <tr>
                                    <th scope="col">&nbsp;</th>
                                    <th scope="col">VARIANT ID</th>
                                    <th scope="col">PRODUCT NAME</th>
                                    
                                    <th scope="col">STOCK</th>
                                    <th scope="col">RAM</th>
                                     <th scope="col">PRICE</th>
                                    
                                    <th scope="col">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="variant" items="${requestScope.listAllVariant}">
                                    <tr>
                                        <th scope="row"><input type="checkbox" /></th>
                                        <td class="tm-variant-name">${variant.variantId}</td>
                                        
                                        <td>${variant.product.brand.brandName } ${variant.product.productName} </td>
                                        <td>${variant.stock}</td>
                                        <td>${variant.ram}</td>
                                        <td>${variant.price}</td>
                                        <td>
                                           <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn-primary">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- table container -->
                    <a
                        href="./Variant?action=addNewProduct"
                        class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                    <button class="btn btn-primary btn-block text-uppercase">
                        Delete selected products
                    </button>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                    <h2 class="tm-block-title">Product Categories</h2>
                    <div class="tm-product-table-container">
                        <table class="table tm-table-small tm-product-table">
                            <tbody>
                                <c:forEach var="category" items="${requestScope.listCategory}">
                                    <tr>
                                        <td class="tm-product-name">${category.categoryName}</td>
                                        <td class="text-center">
                                            <a href="" class="tm-product-delete-link">
                                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                            </a>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- table container -->
       
                    <button class="btn btn-primary btn-block text-uppercase mb-3">
                        Add new category
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- table container -->


</body>
</html>
