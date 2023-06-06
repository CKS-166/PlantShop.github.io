<%-- 
    Document   : viewPlant
    Created on : Mar 16, 2023, 9:58:20 PM
    Author     : ASUS
--%>

<%@page import="sample.dto.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .productDetail{
                width: 60%;
                border: 1px solid;
                margin: 30px auto;
                text-align: center;
                display: grid;
                grid-template-columns: 1fr 1fr;
                border-radius: 10px;
               
            }
            
            .imgPlantDetail{
                padding: 20px 0;
            }
            .imgPlantDetail img{
                width: 280px;
                height: auto;
                border-radius: 10px;
            }
            
            .descriptionDetail{
                text-align: left;
                padding-top: 40px;
                font-size: 18px;
                font-weight: bold;
            }
            .descriptionDetail div{
                margin-bottom: 6px;
            }
                    
        </style>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        
        <section style="min-height: 500px;">
            <h3 style="color: red;">${requestScope.error}</h3>
            <jsp:useBean id="plant" class="sample.dto.Plant" scope="request"/>
            
            <div class="productDetail">
                <div class="imgPlantDetail"><img src="${plant.imgpath}"/></div>
                <div class="descriptionDetail">
                    <div>ID: ${plant.id}</div>
                <div>Plant name: ${plant.name}</div>
                <div>Price: ${plant.price}</div>
                <div>Description: ${plant.description}</div>
                <div>Status: ${plant.status}</div>
                <div>Cate ID: ${plant.cateid}</div>
                <div>Category:  ${plant.catename}</div>
                </div>
                
            </div>
            
        </section>
        
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
