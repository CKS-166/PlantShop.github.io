<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="searchResult">
            <c:if test="${not empty sessionScope.user}">
                <div style="position: absolute; bottom: 95%;background-color: black; border: none;z-index: 2; margin-right: auto; padding: 5px; color: white; scale: 0.8;">
                        <h3 style="z-index: 2;">
                            <a href="mainController?from=&to=&action=searchOrders" style=" font-weight: bold;">View all orders</a>
                        </h3>
                    </div>
            </c:if>
            <c:set var="keyword" value="${param.txtsearch}"/>
            <c:set var="searchby" value="${param.searchby}"/>
            <c:choose>
                <c:when test="${empty keyword and empty searchby}">
                    <c:set var="list" value="${PlantDAO.getPlants('','')}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="list" value="${PlantDAO.getPlants(keyword,searchby)}"/>
                </c:otherwise>
            </c:choose>
            <c:if test="${not empty list}">
                <c:forEach var="p" items="${list}">
                    <div class="productIndex">
                        <div><img src="${p.imgpath}" class="plantimg"/></div>
                        <div class="productName">${p.name}</div>
                        <div class="description">
                            <div>Product ID: ${p.id}</div>
                            <div>Price: ${p.price}</div>
                            <div>Status: ${p.status eq 0 ? 'out of stock' : 'available'}</div>
                            <div>Category: ${p.catename}</div>
                        </div>
                        <div class="buyBtn"><a href="mainController?action=addtocart&amp;pid=${p.id}">Add to your cart</a></div>
                    </div>
                </c:forEach>
            </c:if>    
        </section>
        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
