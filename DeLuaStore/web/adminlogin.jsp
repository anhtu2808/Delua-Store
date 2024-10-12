<%-- 
    Document   : login
    Created on : Jun 27, 2024, 10:21:54 AM
    Author     : Anh Tu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container-flush">
            <div class="col-md-12">

                <div class="col-md-4 offset-md-4">
                    <h1>Login</h1>
                    <form action="./AdminLogin" method="POST">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="user" class="form-control" id="username" placeholder="Enter username">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name ="password" class="form-control" id="password" placeholder="Enter password">
                        </div>
                        <c:if test="${not empty requestScope.msg}">
                            <h5 class="text-danger"><c:out value="${requestScope.msg}"/></h5>
                        </c:if>


                        <button type="submit" class="btn btn-primary" value="Login">Login</button>
                    </form>
                </div>
            </div>
        </div>





        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html> 
