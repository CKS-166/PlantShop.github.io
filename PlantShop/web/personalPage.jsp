<%-- 
    Document   : personalPage
    Created on : Aug 2, 2022, 6:20:22 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>
        <link rel="stylesheet" href="style/orders.css" type="text/css">
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin != null}">
                <c:set var="noti" value="That's not a page for admin" scope="request"/>
                <jsp:forward page="adminPage.jsp"/>
            </c:when>
            <c:when test="${sessionScope.user == null}">
                <c:set var="WARNING" value="Need to login to continue" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_loginedUser.jsp"/>
                </header>
                <section class="orderSection">
                <h1 style="margin: 10px 0px;">Welcome back ${sessionScope.user.fullname}</h1>
                <c:choose>
                    <c:when test="${requestScope.orderlist == null}">
                        <h3>You have no orders</h3>
                    </c:when>
                    <c:otherwise>
                        
                        <table class="order">
                            <thead style="background: #557153; color: #E6E5A3">
                                <tr>
                                    <td>Order ID</td>
                                    <td>Order Date</td>
                                    <td>Ship Date</td>
                                    <td>Order's status</td>
                                    <td colspan="2">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ord" items="${requestScope.orderlist}">
                                    <tr>
                                        <td>${ord.orderID}</td>
                                        <td>${ord.orderDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.shipDate == null}">N/A</c:when>
                                                <c:otherwise>${ord.shipDate}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.status eq 1}">Processing</c:when>
                                                <c:when test="${ord.status eq 2}">Completed</c:when>
                                                <c:otherwise>Canceled</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.status eq 1}">
                                                    <a href="mainController?action=cancel&orderid=${ord.orderID}">Cancel Order</a>
                                                </c:when>
                                                <c:when test="${ord.status eq 2}">
                                                    <a href="mainController?action=reorder&orderid=${ord.orderID}">ReOrder</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="mainController?action=reorder&orderid=${ord.orderID}">ReOrder</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><a href="mainController?action=viewOrdDetail&orderid=${ord.orderID}">Detail</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </section>
                    </c:otherwise>
                </c:choose>
                <footer>
                    <c:import url="footer.jsp"/>
                </footer>
            </c:otherwise>
        </c:choose>
    </body>
</html>