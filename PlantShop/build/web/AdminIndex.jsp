<%-- 
    Document   : AdminIndex
    Created on : Mar 17, 2023, 1:01:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <c:set var="WARNING" value="You need to log in as Admin to view this page!" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <c:import url="header_loginedAdmin.jsp"/>
                <section style="min-height: 500px; display: flex;">
                    <h1 style="margin:auto;">I am admin</h1>
                </section>

                <c:import url="footer.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
