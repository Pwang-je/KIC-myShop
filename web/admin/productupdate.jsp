<%@ page import="my.shop.product.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />
<%
    ProductBean bean = productMgr.getProduct(request.getParameter("no"));
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp"%>
<form action="productproc.jsp?flag=update" method="post">
    <table style="width: 90%;">
        <tr>
            <td colspan="2">
                ** 상품 수정 **
            </td>
        </tr>

        <tr>
            <td>상품명</td>
            <td><input type="text" name="name" value="<%=bean.getName()%>"></td>
        </tr>

        <tr>
            <td>가 격</td>
            <td><input type="text" name="price" value="<%=bean.getPrice()%>"></td>
        </tr>

        <tr>
            <td>설 명</td>
            <td><input type="text" name="detail" value="<%=bean.getDetail()%>"></td>
        </tr>

        <tr>
            <td>재고량</td>
            <td><input type="text" name="stock" value="<%=bean.getStock()%>"></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align: center;"></td>
            <td>
                <input type="hidden" name="no" value="<%=bean.getNo()%>">
                <input type="submit" value="상품 수정">
                <input type="button" value="수정 취소" onclick="history.back()">
            </td>
        </tr>
    </table>
</form>
<%@include file="admin_bottom.jsp"%>
</body>
</html>
