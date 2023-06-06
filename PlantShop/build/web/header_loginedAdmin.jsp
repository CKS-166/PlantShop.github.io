<%-- 
    Document   : header_loginedAdmin.jsp
    Created on : Mar 17, 2023, 12:59:26 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <nav class="nav">
                <ul>
                    <li class="shopLogo"><a href="index.jsp"><img src="images/logo.jpg"></a></li>
                    <li><a href="mainController?action=manageAccounts">Manage Accounts</a></li>
                    <li><a href="mainController?action=manageOrders">Manage Orders</a></li>
                    <li><a href="mainController?action=managePlants">Manage Plants</a></li>
                    <li><a href="mainController?action=manageCategories">Manage Categories</a></li>
                    <li><a href="mainController?action=logout">Log Out</a></li>
                    <li style="font-size: 18px; color: white; font-weight: bold;">Welcome ${sessionScope.name}</li>
                </ul>
            </nav>

        </header>
    </body>
</html>
