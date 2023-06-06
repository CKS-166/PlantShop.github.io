<%-- 
    Document   : editCate
    Created on : Mar 17, 2023, 5:04:12 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/register.css" type="text/css"/>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_loginedAdmin.jsp"/>
                </header>
                <section class="registerSection" style="min-height: 500px;">
                <a href="mainController?action=manageCategories" style="background-color:black; color: white; z-index: 2; margin:4px auto auto 4px; padding: 5px;">Back to Manage Category Page</a>
                <form action="mainController" method="get" class="formRegister">
                    <table>
                        <tr>
                            <th colspan="2">Category ID: ${param.cid}
                                <input type="hidden" name="cid" value="${param.cid}"/>
                            </th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Category new name</th>
                            <td><input type="text" name="catename" value="${param.catename}" placeholder="Input new category name"></td>
                        </tr>
                        <tr><td colspan="2"><input type="submit" value="editCate" name="action"></td></tr>
                    </table>
                </form>
                </section>
                <footer>
                    <c:import url="footer.jsp"/>
                </footer>
            </c:otherwise>
        </c:choose>
    </body>
</html>
