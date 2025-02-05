<%-- 
    Document   : addproduct
    Created on : Jul 10, 2024, 10:59:30 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="${pageContext.request.contextPath}/">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Admin - Dashboard</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>
    <body>
        <jsp:include page="/adminheader.jsp" flush="true" />
        <form action="./Variant" method="POST">
            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <h2 class="tm-block-title">List of Products</h2>
                        <p class="text-white">Product</p>
                        <select class="custom-select" name= "productId" value="">
                            <c:forEach  var="product" items="listAllProduct">
                                <option value="${product.productId}">${product.brand.brandName} ${product.productName}</option>
                            </c:forEach>

                        </select>
                    </div>
                </div>
            </div>
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block">Add Variant</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <form action="" class="tm-edit-product-form">
                                        <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >Product Name
                                            </label>
                                            <form>
                                                <input
                                                    id="name"
                                                    name="name"
                                                    type="text"
                                                    class="form-control validate"
                                                    required
                                                    />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="description"
                                                >Description</label
                                            >
                                            <textarea
                                                class="form-control validate"
                                                rows="3"
                                                required
                                                ></textarea>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="category"
                                                >Category</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                >
                                                <option selected>Select category</option>
                                                <option value="1">New Arrival</option>
                                                <option value="2">Most Popular</option>
                                                <option value="3">Trending</option>
                                            </select>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="category"
                                                >Brand</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                >
                                                <option selected>Select brand</option>
                                                <option value="1">Apple</option>
                                                <option value="2">Samsung</option>
                                                <option value="3">Lenovo</option>
                                            </select>
                                        </div>
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="expire_date"
                                                    >Expire Date
                                                </label>
                                                <input
                                                    id="expire_date"
                                                    name="expire_date"
                                                    type="text"
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="stock"
                                                    >Units In Stock
                                                </label>
                                                <input
                                                    id="stock"
                                                    name="stock"
                                                    type="text"
                                                    class="form-control validate"
                                                    required
                                                    />
                                            </div>
                                        </div>

                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                    <div class="tm-product-img-dummy mx-auto">
                                        <i
                                            class="fas fa-cloud-upload-alt tm-upload-icon"
                                            onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                    </div>
                                    <div class="custom-file mt-3 mb-3">
                                        <input id="fileInput" type="file" style="display:none;" />
                                        <input
                                            type="button"
                                            class="btn btn-primary btn-block mx-auto"
                                            value="UPLOAD PRODUCT IMAGE"
                                            onclick="document.getElementById('fileInput').click();"
                                            />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
</html>
