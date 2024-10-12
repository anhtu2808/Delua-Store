<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Document : header Created on : Jun 24, 2024, 2:52:49 PM Author : Anh Tu --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="col-md-12" style="padding:0px">
    <div class="row header-top ">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    Call:+8438 9275 513
                </div>


                <c:choose >
                    <c:when test="${not empty sessionScope.usersession}">
                        <div class="col-md-2 header-right">
                            <a href="./Login?action=logout">Logout</a>
                        </div>
                        <div class="col-md-2 header-right">
                            <a >Welcome : ${sessionScope.usersession.username}</a>
                        </div>
                    </c:when>
                    <c:otherwise>

                        <div class="col-md-2 header-right">
                            <a href="login.jsp">Sign In/Sign Up</a>
                        </div>
                        <div class="col-md-2 header-right">
                            <a href="adminlogin.jsp">Admin Sign In</a>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>

        </div>

    </div>
    <div class="row header-middle">
        <div class="container">
            <div class="row">

                <div class="col-md-3 d-flex justify-content align-items-center">
                    <img src="assets/logo_1.png" alt="">
                </div>
                <div class="col-md-6">
                    <form action="/search" method="GET" class="rounded-form">
                        <div class="input-group">
                            <input type="text" placeholder="Search product..." name="query"
                                   class="form-control">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="submit"><i
                                        class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-3  col-md-3 d-flex justify-content-end align-items-center"   >
                    <a  class=" large-font" href="./Cart?action=viewCart"><i class="fas fa-shopping-cart"></i> Cart</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row header-bottom">

        <div class="col-md-12">
            <nav class="navbar  navbar-expand-lg navbar-light bg-light">

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="./Home">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./Product?action=list">Product</a>
                        </li>
                        <c:forEach var="category" items="${requestScope.categoryList}">
                        
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="phoneDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${category.categoryName}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="phoneDropdown">
                                    <!-- forEach -->
                                    <c:forEach var="brand" items="${requestScope.listAllBrand}">
                                        <a class="dropdown-item" href="./Product?brand=${brand.brandId}&category=${category.categoryId}">${brand.brandName}</a>
                                    </c:forEach>


                                </div>
                            </li>
                            
                            
                        </c:forEach>
                        
                    </ul>
                </div>
            </nav>
        </div>

    </div>
</header>