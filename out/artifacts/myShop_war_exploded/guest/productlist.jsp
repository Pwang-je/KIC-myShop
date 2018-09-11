<%@ page import="java.util.ArrayList" %>
<%@ page import="my.shop.product.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />
<html>
<head>
    <title>상품 목록</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<p>쇼핑몰 상품 목록</p>
<%@include file="guest_top.jsp"%>
<table style="width: 90%;">
    <tr>
        <th>상품이미지</th>
        <th>상품</th>
        <th>가격</th>
        <th>재고량</th>
        <th>특징</th>
        <th>상세보기</th>
    </tr>
    <%
        ArrayList<ProductBean> list = productMgr.getProductAll();
        for (ProductBean p:list) {
    %>
        <tr style="text-align: center; border: 1px solid black;" >

            <th><img src="../data/<%=p.getImage()%>" alt=""></th>
            <th><%=p.getName()%></th>
            <th><%=p.getPrice()%></th>
            <th><%=p.getStock()%></th>
            <th><%=p.getDetail()%></th>
            <th><a href="javascript:productDetail('<%=p.getNo()%>')">보기</a></th>

        </tr>
    <%
        }
    %>

</table>
<%@include file="guest_bottom.jsp"%>
<form action="productdetail_g.jsp" name="detailFrm" method="post">
    <input type="hidden" name="no">
</form>
</body>
</html>
