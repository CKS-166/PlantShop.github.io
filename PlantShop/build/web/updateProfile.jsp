<%-- 
    Document   : updateProfile
    Created on : Mar 14, 2023, 1:20:48 PM
    Author     : ASUS
--%>

<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/register.css" type="text/css" />
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <c:set var="WARNING" value="Need to login to continue" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <c:import url="header_loginedUser.jsp"/>
                <c:set var="user" value="${sessionScope.user}"/>
                <section class="registerSection">
                    <form action="mainController" method="post" class="formRegister">
                        <h1>Change profile</h1>
                        <table>
                            <tr><td>Full name</td><td><input type="text" name="txtfullname" required="" value="${user.fullname}" style="width: 250px; height: 25px;"/></td></tr>
                            <tr><td>Phone</td><td><input type="text" name="txtphone" required="" value="${user.phone}" style="width: 250px; height: 25px;"/></td></tr>
                            <tr><td colspan="2"><input type="submit" value="change" name="action"/></td></tr>
                        </table>
                        <div class="error_text">
                            <%= (request.getAttribute("error_phone") == null) ? "" : request.getAttribute("error_phone")%>
                        </div>
                    </form>
                </section>
                <c:import url="footer.jsp"/>
            </c:otherwise>
        </c:choose>



    </body>
</html>
