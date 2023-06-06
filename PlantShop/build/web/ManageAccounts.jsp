<%-- 
    Document   : ManageAccounts
    Created on : Mar 17, 2023, 1:36:50 PM
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
        <header>
            <c:import url="header_loginedAdmin.jsp"/>
        </header>
        <section class="manageSection">
            <div style="z-index: 2; margin-right: auto; padding: 10px;">
                <form action="mainController" method="post" ">
            <input type="text" name="txtSearch" />
            <input type="submit" value="searchAccount" name="action"/>
        </form>
            </div>
        
        <h1>Manage Accounts</h1>
        <table class="detail">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Full name</th>
                <th>Status</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            
            <c:forEach var="acc" items="${requestScope.accountList}">
                <tr>
                    <td><c:out value="${acc.getAccID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullname()}"></c:out></td>
                        <td>
                            <c:choose>
                                <c:when test="${acc.getStatus() eq 1}">active</c:when>
                                <c:otherwise>inactive</c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${acc.getPhone()}"></c:out></td>
                        <td>
                            <c:choose>
                                <c:when test="${acc.getRole() eq 1}">admin</c:when>
                                <c:otherwise>user</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                        <c:if test="${acc.getRole() eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/Unblock</a>
                        </c:if>
                        </td>
                </tr>
            </c:forEach>
            
        </table>
        </section>
        
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
