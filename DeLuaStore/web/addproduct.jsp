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
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Add Product</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="./Product" METHOD="GET" class="tm-edit-product-form">
                                    <input name="productId" type="text" value="${requestScope.maxId}" readonly>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <form>
                                            <input
                                                id="productName"
                                                name="proName"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description
                                        </label>


                                        <textarea
                                            name ="description"
                                            class="form-control validate"
                                            rows="3"
                                            required
                                            ></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Image Path
                                        </label>
                                        <form>
                                            <input
                                                id="imagePath"
                                                name="imagePath"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                />
                                            <div class="form-group mb-3">

                                                <label
                                                    for="category"
                                                    >Category</label
                                                >
                                                <select
                                                    name ="categoryId"
                                                    class="custom-select tm-select-accounts"
                                                    id="category"
                                                    >
                                                    <c:forEach var= "category" items="${requestScope.listCategory}">
                                                        <option value="${category.categoryId}">${category.categoryName}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <div class="form-group mb-3">
                                                <label
                                                    for="category"
                                                    >Brand</label
                                                >
                                                <select
                                                    name ="brandId"
                                                    class="custom-select tm-select-accounts"
                                                    id="brand"
                                                    >
                                                    <option selected>Select brand</option>
                                                    <c:forEach var= "brand" items="${requestScope.listBrand}">
                                                        <option value="${brand.brandId}">${brand.brandName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <input name ="action" value ="insert" type="hidden">
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
                                                    <input id="fileInput" name="file" type="file" style="display:none;" />
                                                    <input
                                                        type="button"
                                                        class="btn btn-primary btn-block mx-auto"
                                                        value="UPLOAD PRODUCT IMAGE"
                                                        onclick="document.getElementById('fileInput').click();"
                                                        />
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                            </div>
                        </div>
                    </div>

                    </html>
