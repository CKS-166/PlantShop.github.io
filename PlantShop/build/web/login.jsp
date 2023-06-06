<%-- 
    Document   : login
    Created on : Feb 25, 2023, 12:02:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/login.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="loginSection">
            <form action="mainController" method="post" class="formLogin">
                <font style="color: red;">${requestScope.WARNING}</font>
                <h1>Login</h1>
                <table>
                    <tr><td>Email</td><td><input type="text" name="txtemail" class="inputInfo"/></tr>
                    <tr><td>Password</td><td><input type="password" name="txtpassword" class="inputInfo"/></td></tr>
                    <tr><td colspan="2"><input type="submit" value="login" name="action" class="loginBtn"/></td></tr>
                </table>
            </form>
        </section>

    </body>
</html>
