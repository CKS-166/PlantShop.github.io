<%-- 
    Document   : ManageCategories
    Created on : Mar 17, 2023, 4:52:28 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/manage.css" type="text/css"/>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <c:set var="WARNING" value="You need to log in as Admin to view this page" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_loginedAdmin.jsp"/>
                </header>
                <section class="manageSection">
                <h3 style="color: greenyellow">${requestScope.noti}</h3>
                <h3 style="color: red">${requestScope.warning}</h3>
                <div style="z-index: 2; margin-right: auto; padding: 10px;">
                    <form action="mainController" method="get">
                    <input type="text" name="txtsearch" placeholder="Input Category Name" value="${param.txtsearch}">
                    <input type="submit" value="searchCategory" name="action">
                </form><br/>
                <form action="mainController" method="get">
                    <input type="text" name="catename" required="" placeholder="Input new cate name"/>
                    <input type="submit" value="addNewCate" name="action"/>
                </form><br/>
                </div>
                    <h1>Manage Categories</h1>
                <c:choose>
                    <c:when test="${requestScope.categoryList.isEmpty()}">
                        <h3>No result</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="detail">
                            <thead>
                                <tr>
                                    <th>Category ID</th>
                                    <th>Category Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cate" items="${requestScope.categoryList}">
                                    <tr>
                                        <td>${cate.cateID}</td>
                                        <td>${cate.cateName}</td>
                                        <td><a href="mainController?action=editCatePage&cid=${cate.cateID}">Edit name</a></td>
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
