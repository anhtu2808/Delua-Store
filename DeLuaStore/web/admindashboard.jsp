<%-- 
    Document   : admindashboard
    Created on : Jul 10, 2024, 4:03:15 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="${pageContext.request.contextPath}/">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Admin - Dashboard</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <jsp:include page="/adminheader.jsp" flush="true" />
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                    </div>
                </div>
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Latest Hits</h2>
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Performance</h2>
                            <canvas id="barChart"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller">
                            <h2 class="tm-block-title">Storage Information</h2>
                            <div id="pieChartContainer">
                                <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                            <h2 class="tm-block-title">Notification List</h2>
                            <div class="tm-notification-items">
                                <!-- Notifications -->
                                <c:forEach var="notification" items="${notifications}">
                                    <div class="media tm-notification-item">
                                        <div class="tm-gray-circle"><img src="${notification.imgSrc}" alt="Avatar Image" class="rounded-circle"></div>
                                        <div class="media-body">
                                            <p class="mb-2"><b>${notification.sender}</b> and <b>${notification.count} others</b> sent you new <a href="#" class="tm-notification-link">${notification.type}</a>. ${notification.message}</p>
                                            <span class="tm-small tm-text-color-secondary">${notification.timeAgo}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                            <h2 class="tm-block-title">Orders List</h2>
                            <form id="filterForm" action="AdminDashboard" method="POST">
                                <input type="hidden" name="action" value="filterOrders">
                                <div class="form-group">
                                    <label for="statusFilter">Filter by Status:</label>
                                    <select class="custom-select" id="statusFilter" name="status" onchange="submitForm()">
                                        <option value="">Select Status</option>
                                        <option value="pending">Pending</option>
                                        <option value="cancelled">Cancelled</option>
                                        <option value="shipping">Shipping</option>
                                        <option value="shipped">Shipped</option>
                                    </select>
                                </div>
                            </form>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ORDER ID.</th>
                                        <th scope="col">ORDER DATE</th>
                                        <th scope="col">STATUS</th>
                                        <th scope="col">PHONE NUM</th>
                                        <th scope="col">TOTAL PRICE</th>
                                        <th scope="col">USER NAME</th>
                                        <th scope="col">ADDRESS</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${requestScope.listNewestOrder}">
                                        <tr>
                                            <th scope="row"><b>#${order.orderId}</b></th>
                                            <td><b>${order.getCreateDateWithFormat()}</b></td>
                                            <td>
                                                <form id="statusForm" action="./AdminDashboard" method="GET">
                                                    <input type="hidden" name="action" value="changeOrderStatus">
                                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                                    <select class="custom-select tm-select-accounts" name="newStatus" value="" onChange="submitForm()"  >
                                                        <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>Pending</option>
                                                        <option value="cancelled" ${order.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                                                        <option value="shipping" ${order.status == 'shipping' ? 'selected' : ''}>Shipping</option>
                                                        <option value="shipped" ${order.status == 'shipped' ? 'selected' : ''}>Shipped</option>
                                                    </select>

                                                </form>
                                            </td>
                                            <td><b>${order.phoneNum}</b></td>
                                            <td><b>${order.totalPrice}</b></td>
                                            <td><b>${order.user.name}</b></td>
                                            <td><b>${order.address.street} ${order.address.city} ${order.address.state}</b></td>


                                        </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved.
                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/tooplate-scripts.js"></script>
        <script src="js/admindashboard.js"></script>
        <script>
                                                        Chart.defaults.global.defaultFontColor = 'white';
                                                        let ctxLine, ctxBar, ctxPie;
                                                        $(function () {
                                                            drawLineChart(); // Line Chart
                                                            drawBarChart(); // Bar Chart
                                                            drawPieChart(); // Pie Chart

                                                            $(window).resize(function () {
                                                                updateLineChart();
                                                                updateBarChart();
                                                            });
                                                        })
        </script>
    </body>

</html>
