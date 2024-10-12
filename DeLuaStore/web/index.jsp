<%-- Document : index.jsp Created on : Jun 24, 2024, 2:52:41 PM Author : Anh Tu --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>



<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>De Lua Store</title>
        <base href="${pageContext.request.contextPath}/">
        <!-- import CSS Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="/header.jsp" flush="true" />
                <div id="demo" class="carousel slide" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>

                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="assets/images/banner/30_FOR_SALE.png" alt="Los Angeles" width="1800" height="500">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/images/banner/30_FOR_SALE.png" alt="Chicago" width="1800" height="500">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/images/banner/30_FOR_SALE.png" alt="New York" width="1800" height="500">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
                <!--                container cho brand-->
                <div class=" brand-container container">

                    <h2>Explore Popular Brand</h2>
                    <div class="brand-logo-container ">
                        <c:forEach var="brand" items="${requestScope.listPopularBrand}">
                            <a href="Product?brand=${brand.brandId}" class="brand">                               
                                <img src="assets/images/brands/${brand.imagePath}" alt="brand ${brand.brandId}">
                                <h4>${brand.brandName}</h4>                                
                            </a>

                        </c:forEach>

                    </div>
                    <!--                container cho new arrived-->
                    <div class="container top-selling">
                        <div class="row">
                            <div class="col-md-7 ">
                                <h2>Top Selling Product</h2>
                            </div>

                            <div class="col-md-5 selling-nav-container row">
                                <div class="view-all col-md-6">
                                    <a href="">View All</a>
                                </div>
                                <c:forEach var="category" items="${requestScope.categoryList}">
                                    <div class="selling-nav col-md-2">
                                        <a href=Home?cateId=${category.categoryId}>${category.categoryName}</a>
                                    </div>
                                </c:forEach>

                            </div>
                            <div class="card-container ">
                                <c:forEach var="variant" items="${requestScope.bestSellingVariantList}">
                                    <div class="card">
                                        <div class="img-container">
                                            <a href="./Product?action=detail&id=${variant.variantId}" >
                                                <img src="assets/images/products/${variant.imagePath}" alt=""> 
                                            </a>

                                        </div>
                                        <div class="description">
                                            <a class="category-link">
                                                ${variant.product.category.categoryName}
                                            </a>
                                            <h3 class="product-title">
                                                <a href="./Product?action=detail&id=${variant.variantId}"> ${variant.product.brand.brandName} ${variant.product.productName} ${variant.color}</a>
                                            </h3>
                                            <div class="product-price">
                                                ${variant.price} $  
                                            </div>
                                        </div>
                                        <div class="add-view-container ">
                                            <div class="add-to-cart ">
                                               
                                                <a href="./Cart?action=addToCart&id=${variant.variantId}">Add to cart</a>
                                            </div>
                                            <div class="view-detail ">
                                                <a href="./Product?action=detail&id=${variant.variantId}">View Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- forEach -->                               

                            </div>
                        </div>
                    </div>
                    
                    <!--                        PHONE CONTAINER-->
                    <div class="container top-selling">
                        <div class="row">
                            <div class="col-md-7 text-left ">
                                <h2>PHONE</h2>
                            </div>

                            <div class="col-md-5 selling-nav-container row">
                                <div class="view-all col-md-6">
                                </div>
                            </div>
                            <div class="card-container ">
                                <c:forEach var="variant" items="${requestScope.listPhoneVariant}">
                                    <div class="card">
                                        <div class="img-container">
                                            <a href="./Product?action=detail&id=${variant.variantId}" >
                                                <img src="assets/images/products/${variant.imagePath}" alt=""> 
                                            </a>

                                        </div>
                                        <div class="description">
                                            <a class="category-link">
                                                ${variant.product.category.categoryName}
                                            </a>
                                            <h3 class="product-title">
                                                <a href="./Product?action=detail&id=${variant.variantId}"> ${variant.product.brand.brandName} ${variant.product.productName} ${variant.color}</a>
                                            </h3>
                                            <div class="product-price">
                                                ${variant.price} $  
                                            </div>
                                        </div>
                                        <div class="add-view-container ">
                                            <div class="add-to-cart ">
                                                <a href="./Cart?action=addToCart&id=${variant.variantId}">Add to cart</a>
                                            </div>
                                            <div class="view-detail ">
                                                <a href="./Product?action=detail&id=${variant.variantId}">View Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- forEach -->                               

                            </div>
                        </div>
                    </div>
                    <!--                        TABLET CONTAINER-->
                    <div class="container top-selling">
                        <div class="row">
                            <div class="col-md-7 text-left ">
                                <h2>TABLET</h2>
                            </div>

                            <div class="col-md-5 selling-nav-container row">
                                <div class="view-all col-md-6">
                                </div>
                            </div>
                            <div class="card-container ">
                                <c:forEach var="variant" items="${requestScope.listTabletVariant}">
                                    <div class="card">
                                        <div class="img-container">
                                            <a href="./Product?action=detail&id=${variant.variantId}" >
                                                <img src="assets/images/products/${variant.imagePath}" alt=""> 
                                            </a>

                                        </div>
                                        <div class="description">
                                            <a class="category-link">
                                                ${variant.product.category.categoryName}
                                            </a>
                                            <h3 class="product-title">
                                                <a href="./Product?action=detail&id=${variant.variantId}"> ${variant.product.brand.brandName} ${variant.product.productName} ${variant.color}</a>
                                            </h3>
                                            <div class="product-price">
                                                ${variant.price} $  
                                            </div>
                                        </div>
                                        <div class="add-view-container ">
                                            <div class="add-to-cart ">
                                                <a href="./Cart?action=addToCart&id=${variant.variantId}">Add to cart</a>
                                            </div>
                                            <div class="view-detail ">
                                                <a href="./Product?action=detail&id=${variant.variantId}">View Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- forEach -->                               

                            </div>
                        </div>
                    </div>
                    <!--                        lAPTOP CONTAINER-->
                    <div class="container top-selling">
                        <div class="row">
                            <div class="col-md-7 text-left ">
                                <h2>LAPTOP</h2>
                            </div>

                            <div class="col-md-5 selling-nav-container row">
                                <div class="view-all col-md-6">
                                </div>
                            </div>
                            <div class="card-container ">
                                <c:forEach var="variant" items="${requestScope.listLaptopVariant}">
                                    <div class="card">
                                        <div class="img-container">
                                            <a href="./Product?action=detail&id=${variant.variantId}" >
                                                <img src="assets/images/products/${variant.imagePath}" alt=""> 
                                            </a>

                                        </div>
                                        <div class="description">
                                            <a class="category-link">
                                                ${variant.product.category.categoryName}
                                            </a>
                                            <h3 class="product-title">
                                                <a href="./Product?action=detail&id=${variant.variantId}"> ${variant.product.brand.brandName} ${variant.product.productName} ${variant.color}</a>
                                            </h3>
                                            <div class="product-price">
                                                ${variant.price} $  
                                            </div>
                                        </div>
                                        <div class="add-view-container ">
                                            <div class="add-to-cart ">
                                                <a href="./Cart?action=addToCart&id=${variant.variantId}">Add to cart</a>
                                            </div>
                                            <div class="view-detail ">
                                                <a href="./Product?action=detail&id=${variant.variantId}">View Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- forEach -->                               

                            </div>
                        </div>
                    </div>




                </div>
            </div>
                <div></div>
            <jsp:include page="/footer.jsp" flush="true" />

            <!--import JS Bootstrap -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>