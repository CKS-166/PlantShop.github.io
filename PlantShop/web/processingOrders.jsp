<%-- 
    Document   : processingOrder
    Created on : Aug 5, 2022, 2:53:28 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing Order Page</title>
        <link rel="stylesheet" href="style/orders.css" type="text/css">
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <c:set var="WARNING" value="Need to login to continue" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_loginedUser.jsp"/>
                </header>
                <section class="orderSection">
                <div style="background-color: black; border: none;z-index: 2; margin-right: auto; padding: 5px; color: white; scale: 0.8;">
                        <h3 style="z-index: 2;">
                            <a href="mainController?from=&to=&action=searchOrders" style=" font-weight: bold;">View all orders</a>
                        </h3>
                    </div>
                <h1>Processing Orders</h1>
                <c:if test="${param.action == 'cancel'}">
                    <div style="border: 0.5px solid; z-index: 2; background-color: #800000;color: white; ">
                        <h3 style=" font-size: 1em;">You have canceled order ID ${param.orderid}!!</h3>
                    </div>
                </c:if>
                <c:choose>
                    <c:when test="${requestScope.processingList == null}">
                        <h3 style="color: red;">There are no processing orders</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="order">
                            <thead style="background: #557153; color: #fff">
                                <tr>
                                    <td>Order ID</td>
                                    <td>Order Date</td>
                                    <td>Ship Date</td>
                                    <td>Order's status</td>
                                    <td colspan="2">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ord" items="${requestScope.processingList}">
                                    <tr>
                                        <td>${ord.orderID}</td>
                                        <td>${ord.orderDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ord.shipDate == null}">N/A</c:when>
                                                <c:otherwise>${ord.shipDate}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>Processing</td>
                                        <td><a href="mainController?action=cancel&orderid=${ord.orderID}&page=process">Cancel Order</a></td>
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