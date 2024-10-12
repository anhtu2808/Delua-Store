<%-- 
    Document   : usermanager
    Created on : Jul 9, 2024, 7:30:32 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>De Lua Store</title>
<base href="${pageContext.request.contextPath}/">
<!-- import CSS Bootstrap-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/usermanager.css">
<!--            <link rel="stylesheet" href="css/main.css">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">
</head>
<body id="reportsPage">
    <jsp:include page="/adminheader.jsp" flush="true" />

    <div class="container mt-5">
        <div class="row tm-content-row">
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <h2 class="tm-block-title">List of Accounts</h2>
                    <p class="text-white">Accounts</p>
                    <select class="custom-select">
                        <option value="0">Select account</option>
                        <option value="1">Admin</option>
                        <option value="2">Customer</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- row -->
        <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                <h2 class="tm-block-title">USER MANAGEMENT</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">USER ID.</th>
                            <th scope="col">STATUS</th>
                            <th scope="col">USERNAME</th>
                            <th scope="col">LOCATION</th>
                            <th scope="col">PHONE</th>
                            <th scope="col">CREATE DATE</th>
                            <th scope="col">EMAIL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${requestScope.listAllUser}">

                            <tr>
                                <th scope="row"><b>&nbsp;&nbsp;&nbsp;&nbsp;#${user.userId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b></th>
                                <td>
                                    
                                        <div class="tm-status-circle ${user.status}">
                                        </div><a style="color: white" href="UserManager?action=changeUserStatus&userId=${user.userId}" >${user.status} </a>

                                </td>
                                <td><b>${user.username}</b></td>
                                <td><b>${user.address.street} ${user.address.city} ${user.address.state}</b></td>
                                <td><b>${user.phoneNum}</b></td>
                                <td>${user.getCreateDateWithFormat()}</td>
                                <td>${user.email}</td>
                            </tr>



                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--import JS Bootstrap -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
