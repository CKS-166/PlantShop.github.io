<%-- 
    Document   : viewCart
    Created on : Mar 15, 2023, 2:42:29 PM
    Author     : ASUS
--%>

<%@page import="java.util.Date"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/viewcart.css" type="text/css"/>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.user==null}">
                <c:import url="header.jsp"/>
            </c:when>
            <c:otherwise>
                <c:import url="header_loginedUser.jsp"/>
            </c:otherwise>
        </c:choose>
        <section style="min-height: 500px;">
            <c:if test="${sessionScope.user!=null}">
                <div style="position: absolute; bottom: 78%;background-color: black; border: none;z-index: 2; margin-right: auto; padding: 5px; color: white; scale: 0.8;">
                        <h3 style="z-index: 2;">
                            <a href="mainController?from=&to=&action=searchOrders" style=" font-weight: bold;">View all orders</a>
                        </h3>
                    </div>
            </c:if>          
            <h3 style="color: red;">${requestScope.WARNING}</h3>
            <c:choose>
                <c:when test="${sessionScope.cart.isEmpty() || sessionScope.cart == null}">
                    <h3 style="text-align: center; margin:100px auto;">Your cart is empty!</h3>
                </c:when>
                <c:otherwise>
                    <table class="productable">
                        <tr><td>Product id</td><td>Image</td><td>Price</td><td>Quantity</td><td>Action</td></tr>
                        <c:set var="total" value="0"/>
                        <c:forEach var="pid" items="${cart.keySet()}">
                            <c:set var="quantity" value="${cart[pid]}" />
                            <c:set var="plant" value="${PlantDAO.getPlant(pid.trim())}" />
                            <form action="mainController" method="post">
                                <tr>
                                    <td>
                                        <input type="hidden" value="${pid}" name="pid" />
                                        <a href="getPlantInfoServlet?pid=${pid}">${pid}</a>
                                    </td>
                                    <td><img src="${plant.imgpath}" class="plantimg"/></td>
                                    <td><c:out value="${plant.price}" /></td>
                                    <td><input type="number" value="${quantity}" name="quantity"/></td>
                                    <td>
                                        <input type="submit" value="update" name="action" />
                                        <input type="submit" value="delete" name="action" />
                                    </td>
                                </tr>
                                <c:set var="total" value="${total + plant.price * quantity}" />
                            </form>
                        </c:forEach>

                    </table>
                    <div style="display: flex; flex-direction: column; margin: auto;">
                        <h3 style=" margin:5px auto;">Total money: ${total}</h3>
                        <h3 style=" margin:5px auto;">Order Date: <%=(new Date()).toString()%></h3>
                        <h3 style=" margin:5px auto;">Ship Date: N/A</h3>
                        <div style=" margin:5px auto;">
                            <form action="mainController" method="post">
                                <input type="submit" value="saveOrder" name="action" class="submitOrder"/>                
                            </form>
                        </div> 
                    </div>


                </c:otherwise>
            </c:choose>

        </section>

        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
