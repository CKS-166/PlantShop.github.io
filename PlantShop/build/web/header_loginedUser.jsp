<%-- 
    Document   : header_loginedUser
    Created on : Feb 25, 2023, 11:01:06 PM
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
                    <li class="shopLogo"><a href=""><img src="images/logo.jpg"></a></li>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="mainController?action=changePro">Change profile</a></li>
                    <li><a href="mainController?action=viewCompletedOrd">Completed orders</a></li>
                    <li><a href="mainController?action=viewCanceledOrd">Canceled orders</a></li>
                    <li><a href="mainController?action=viewProcessingOrd">Processing orders</a></li>
                    <li><a href="mainController?action=logout">Log Out</a></li>
                    <li>
                        <form action="mainController" method="post">
                        <table>
                            <tr>
                                <td style="color: white;">Order date</td>
                                <td><input type="date" name="from"></td>
                            </tr>
                            <tr>
                                <td style="color: white;">Received date</td>
                                <td><input type="date" name="to"></td>
                            </tr>
                            <tr><td></td><td><input type="submit" value="searchOrders" name="action"></td></tr>
                        </table>
                    </form>
                    </li>
                    
                    
                </ul>
            </nav>
        </header>

    </body>
</html>
