<%-- 
    Document   : header
    Created on : Feb 22, 2023, 11:14:16 AM
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
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="mainController?action=viewcart">View cart</a></li>
                    
                    <li class="formsearch">
                        <div>
                           <form action="mainController" method="post" >
                               <input type="text" name="txtsearch" value="${requestScope.txtsearch}">
                            <select name="searchby">
                                <option>By name</option>
                                <option>By category</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form> 
                        </div>
                        </li>
                </ul>
            </nav>    
        </header>
    </body>
</html>
