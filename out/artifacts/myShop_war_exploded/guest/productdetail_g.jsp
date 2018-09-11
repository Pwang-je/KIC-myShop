<%@ page import="my.shop.product.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />
<%
    String no = request.getParameter("no");
    ProductBean bean = productMgr.getProduct(no);
%>
<html>
<head>
    <title>상품 상세보기</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
** 상품 상세보기 **
<%@include file="guest_top.jsp"%>
<form action="cartproc.jsp">
    <table style="width: 90%;">
        <tr>
            <td style="width: 20%;">
                <img src="../data/" alt="">
                <img src="../data/<%=bean.getImage()%>" width="150">
            </td>
            <td style="width: 50%;">
                <table style="width: 100%;">
                    <tr>
                        <td>번  호 : <%=bean.getNo()%></td>
                        <td>상품명 : <%=bean.getName()%></td>
                        <td>가  격 : <%=bean.getPrice()%></td>
                        <td>등  록 : <%=bean.getSdate()%></td>
                        <td>재고량 : <%=bean.getStock()%></td>
                    </tr>
                    <tr>
                        <td>
                            주문 수:
                            <input type="text" name="quantity" value="1" size="5" style="text-align: center;">
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%; vertical-align: top;">
                ** 상품설명 ** <br>
                <%=bean.getDetail()%>
            </td>
        </tr>
        
        <tr>
            <td colspan="3" style="text-align: center;">
                <br>
                <input type="hidden" name="product_no" value="<%=bean.getNo()%>">
                <input type="submit" value="장바구니에 담기">
                <input type="button" value="이전화면" onclick="history.back()">
            </td>
        </tr>
    </table>
</form>
<%@include file="guest_bottom.jsp"%>
</body>
</html>
