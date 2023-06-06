<%-- 
    Document   : registration
    Created on : Feb 25, 2023, 12:07:18 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/register.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="registerSection">
            <form action="mainController" method="post" class="formRegister">
                <h1>Register</h1>
                <table>
                    <tr><td>Email</td><td><input type="text" name="txtemail" value="${requestScope.txtemail}" 
                                                 required="" class="inputInfo" pattern="^(\\w)+@(a-zA-Z]+([.](\\w+){1,2}"/></td></tr>
                    <tr><td>Full name</td><td><input type="text" name="txtfullname" value="${requestScope.txtfullname}"
                                                     required="" class="inputInfo"/></td></tr>
                    <tr><td>Password</td><td><input type="password" name="txtpassword" required=""class="inputInfo"/></td></tr>
                    <tr><td>Phone</td><td><input type="text" name="txtphone" value="${requestScope.txtphone}"
                                                 class="inputInfo"/></td></tr>
                    <tr><td colspan="2"><input type="submit" value="register" name="action" class="registerBtn"/></td></tr>
                </table>
                <div class="error_text">
                    ${requestScope.error_phone}
                    ${requestScope.error_email}
                </div>
            </form>

        </section>
    </body>
</html>
