<%-- 
    Document   : adminheader
    Created on : Jul 10, 2024, 4:16:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-xl">
    <div class="container h-100">
        <a class="navbar-brand" href="./AdminDashboard">
            <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item">
                    <a class="nav-link " href="./AdminDashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        Dashboard
                        <span class="sr-only"></span>
                    </a>
                </li>
                <li class="nav-item dropdown">

                <li class="nav-item">
                    <a class="nav-link" href="./Variant?action=variantManager">
                        <i class="fas fa-shopping-cart"></i>
                        Variants
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./Product?action=productManager">
                        <i class="fas fa-shopping-cart"></i>
                        Products
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="./UserManager">
                        <i class="far fa-user"></i>
                        Accounts
                    </a>
                </li>

            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link d-block" href="./AdminLogin?action=logout">
                        Admin, <b>Logout</b>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</nav>
