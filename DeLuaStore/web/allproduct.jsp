<%-- Document : allproduct Created on : Jul 10, 2024, 7:24:33 PM Author : Anh Tu --%>

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
        <link rel="stylesheet" href="css/allproduct.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">

    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="/header.jsp" flush="true" />
                <div class="container">
                    <form action="./Product" id="filterForm">
                        <div class="col-12 row">
                            <aside class="left-side-container col-3">
                                <div class="side-bar">


                                    <div class="widget widget-clean">
                                        <label>Filters:</label>
                                        <a href="./Product" class="sidebar-filter-clear">Clean All</a>
                                    </div>
                                    <!-- filter component category -->


                                    <div class="filter-component">

                                        <div class="">
                                            <div class="title-container ">
                                                <h3 class="widget-title"> Category </h3>
                                                <a  id="expandCate" data-toggle="collapse" href="#inputFieldsCollapse1" 
                                                    role="button"
                                                    aria-expanded="false" aria-controls="inputFieldsCollapse">
                                                    <i class="fas fa-chevron-down"></i>

                                                </a>
                                            </div>
                                        </div>

                                        <!-- Đặt div collapse ở đây để đảm bảo nó hiển thị dưới title-container -->
                                        <div class="collapse col-12" id="inputFieldsCollapse1">
                                            <div class="menu">
                                                <div class="">
                                                    <c:forEach var="category" items="${requestScope.categoryList}">
                                                        <div class="input-row">
                                                            <input class="" name="category" type="checkbox" value="${category.categoryId}" id="category${category.categoryId}"
                                                                   <c:if  test="${cateF.contains(category.categoryId)}">
                                                                       checked
                                                                   </c:if>    
                                                                   onchange="submitForm()"
                                                                   >
                                                            <label class="" for="category${category.categoryId}">
                                                                ${category.categoryName}
                                                            </label>
                                                        </div>
                                                    </c:forEach>
                                                </div>

                                                <!-- Thêm các checkbox khác tại đây -->
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <!--   End of filter component-->

                                    <!-- filter component brand-->


                                    <div class="filter-component">

                                        <div class="">
                                            <div class="title-container ">
                                                <h3 class="widget-title"> Brand </h3>
                                                <a id="expandBrand" data-toggle="collapse" href="#inputFieldsCollapse2" role="button"
                                                   aria-expanded="false" aria-controls="inputFieldsCollapse">
                                                    <i class="fas fa-chevron-down"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Đặt div collapse ở đây để đảm bảo nó hiển thị dưới title-container -->
                                        <div class="collapse col-12" id="inputFieldsCollapse2">
                                            <div class="menu">
                                                <div class="">
                                                    <c:forEach var="brand" items="${requestScope.listAllBrand}">
                                                        <div class="input-row">

                                                            <input class="" name="brand" type="checkbox" value="${brand.brandId}" id="brand${brand.brandId}"
                                                                   <c:if  test="${brandF.contains(brand.brandId)}">
                                                                       checked
                                                                   </c:if>  
                                                                   onchange="submitForm()"
                                                                   >

                                                            <label class="" for="brand${brand.brandId}">
                                                                ${brand.brandName}
                                                            </label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <!-- Thêm các checkbox khác tại đây -->
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <!--   End of filter component-->





                                </div>
                            </aside>
                            <div class="card-container all-product col-9">
                                <div class="col-12 text-right">

                                    <label  for="pSort" >Sort by:    </label >
                                    <select name="pSort" class="form-select form-select-sm" id="pSort" onchange="submitForm()">
                                        <option value="ASC" <c:if test="${requestScope.pSort == 'ASC'}">selected</c:if>>Price Increase</option>
                                        <option value="DESC" <c:if test="${requestScope.pSort == 'DESC'}">selected</c:if>>Price Decrease</option>
                                        </select>
                                    </div>
                                <c:set var="index" value="${0}"/>
                                <c:set var="listSize" value="${requestScope.variantList.size()}"/>
                                <c:forEach  begin="1" end="${listSize-listSize%3}">

                                    <c:set var="variant" value="${requestScope.variantList[index]}"/>
                                    <c:set var="index" value="${index+1}"/>
                                    <div class="card">
                                        <div class="img-container">
                                            <a href="./Product?action=detail&id=${variant.variantId}">
                                                <img src="assets/images/products/${variant.imagePath}" alt="">
                                            </a>

                                        </div>
                                        <div class="description">
                                            <a class="category-link">
                                                ${variant.product.category.categoryName}
                                            </a>
                                            <h3 class="product-title">
                                                <a href="./Product?action=detail&id=${variant.variantId}">${variant.product.brand.brandName} ${variant.product.productName} ${variant.color}</a>
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
                        <!-- Container cho menu filter -->
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="/footer.jsp" flush="true" />

        <!--import JS Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="js/allproduct.js"></script>

        <script> document.getElementById('expandCate').click()</script>

        <c:if test="${not empty brandF}">
            <script> document.getElementById('expandBrand').click()</script>
        </c:if>
    </body>

</html>