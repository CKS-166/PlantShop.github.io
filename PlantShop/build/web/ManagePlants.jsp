<%-- 
    Document   : managePlants
    Created on : Mar 17, 2023, 4:20:50 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/manage.css" type="text/css" />
    </head>
    <body>
         <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <c:set var="WARNING" value="You need to log in as Admin to view this page!" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_loginedAdmin.jsp"/>
                </header>
                <section class="manageSection">
                    <div style="margin-right: auto; padding: 10px; z-index: 2;">
                        <form action="mainController" method="post">
                    <input type="text" name="txtsearch" placeholder="input plant name" value="${param.txtsearch}">
                    <input type="submit" value="searchPlant" name="action">
                </form><br/>
                <a style="background-color: black; color: white; padding: 5px;" href="addNewPlant.jsp">Add new Plant</a>
                    </div>
                    <h1>Manage Plants</h1>
                <h3 style="color: greenyellow">${requestScope.noti}</h3>
                <c:choose>
                    <c:when test="${requestScope.plantList.isEmpty()}">
                        <h3>No result</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="detail">
                            <thead>
                                <tr>
                                    <th>Plant ID</th>
                                    <th>Plant Name</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Category ID</th>
                                    <th>Category Name</th>
                                    <th colspan="2">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${requestScope.plantList}">
                                    <tr>
                                        <td>${p.id}</td>
                                        <td>${p.name}</td>
                                        <td>${p.price}</td>
                                        <td><img src="${p.imgpath}" style="width: 20%"></td>
                                        <td>${p.description}</td>
                                        <td><c:choose>
                                                <c:when test="${p.status eq 1}">Available</c:when>
                                                <c:when test="${p.status eq 0}">Unavailable</c:when>
                                            </c:choose></td>
                                        <td>${p.cateid}</td>
                                        <td>${p.catename}</td>
                                        <td>
                                            <c:url var="stocklink" value="mainController">
                                                <c:param name="pid" value="${p.id}"></c:param>
                                                <c:param name="status" value="${p.status}"></c:param>
                                                <c:param value="updatePlantStatus" name="action" ></c:param>
                                            </c:url>
                                            <c:choose>
                                                <c:when test="${p.status eq 1}"><a href="${stocklink}">Out of stock</a></c:when>
                                                <c:otherwise><a href="${stocklink}">In stock</a></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><a href="mainController?action=editPlant&pid=${p.id}">Edit Plant</a></td>
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
