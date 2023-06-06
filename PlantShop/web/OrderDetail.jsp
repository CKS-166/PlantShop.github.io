<%-- 
    Document   : OrderDetail
    Created on : Sep 4, 2022, 9:05:48 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail Page</title>
        <link rel="stylesheet" href="style/orderDetail.css" type="text/css">
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
                <section class="orderDetail">
                <div style="background-color: black; border: none;z-index: 2; margin-right: auto; padding: 5px; color: white; scale: 0.8;">
                        <h3 style="z-index: 2;">
                            <a href="mainController?from=&to=&action=searchOrders" style=" font-weight: bold;">View all orders</a>
                        </h3>
                    </div>
                <h1 style="margin: 10px 0px;">Order ID: ${requestScope.orderid}</h1>
                <c:choose>
                    <c:when test="${requestScope.detailList == null}">
                        <h3>You don't have any orders</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="order">
                            <thead style="background: #557153; color: white">
                                <tr>
                                    <td>Order ID</td>
                                    <td>Plant ID</td>
                                    <td>Plant Name</td>
                                    <td>Image</td>
                                    <td>Price</td>
                                    <td>Quantity</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${requestScope.detailList}">
                                    <tr>
                                        <td>${detail.orderID}</td>
                                        <td>${detail.FID}</td>
                                        <td>${detail.plantName}</td>
                                        <td><img class="imgPlantDetail" src="${detail.imgPath}"/></td>
                                        <td>${detail.price}</td>
                                        <td>${detail.quantity}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            
                        </table>
                        <div style="background-color: #cc0000; border: none; border-radius: 20px; color: yellow; z-index: 2; margin: 20px auto; padding: 5px 10px;">
                            <h3> Total money: ${requestScope.totalMoney}$</h3>
                        </div>
                        
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