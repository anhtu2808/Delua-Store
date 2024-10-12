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
        <link rel="stylesheet" href="css/login.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="login_form_wrapper">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <!-- login_wrapper -->
                        <div class="login_wrapper">
                            <h2>Register new account</h2>
                            <form action="./Login" method="POST"  onsubmit="return validatePassword()" >
                                <div class="formsix-pos">

                                    <div class="form-group i-email">
                                        <input type="text" name="user" class="form-control" required="" id="email2" placeholder="Username *">
                                    </div>
                                    <div class="form-group i-email">
                                        <input type="text" name="name" class="form-control" required="" id="email2" placeholder="Fullname *">
                                    </div>
                                    <div class="form-group i-email">
                                        <input type="text" name="phoneNum" class="form-control" required="" id="email2" placeholder="Phone Number *">
                                    </div>
                                    <div class="form-group i-email">
                                        <input type="text" name="email" class="form-control" required="" id="email2" placeholder="Email *">
                                    </div>
                                </div>
                                <div class="formsix-e">
                                    <div class="form-group i-password">
                                        <input type="password" name ="password" class="form-control" required="" id="password2" placeholder="Password *">
                                    </div>
                                </div>
                                <div class="formsix-e">
                                    <div class="form-group i-password">
                                        <input type="password" name ="repassword" class="form-control" required="" id="password2" placeholder="Repeat your password *">
                                    </div>
                                </div>



                                <div class="login_btn_wrapper">
                                    <input type="submit" name="action" class="btn btn-primary login_btn" value="Register"> 
                                </div>
                            </form>
                            <div class="login_message">
                                <c:if test="${not empty requestScope.msg}">
                                    <h5 class="text-danger"><c:out value="${requestScope.msg}"/></h5>
                                </c:if> 
                            </div>
                        </div>
                        <!-- /.login_wrapper-->
                    </div>
                </div>
            </div>
        </div>






        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
                                function validatePassword() {
                                    var password = document.getElementById("password").value;
                                    var repassword = document.getElementById("repassword").value;
                                    if (password !== repassword) {
                                        alert("Passwords do not match.");
                                        return false; // Prevent form submission
                                    }
                                    return true; // Allow form submission
                                }
        </script>
    </body>
</html> 
