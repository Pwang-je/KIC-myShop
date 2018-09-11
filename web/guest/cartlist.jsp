<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="my.shop.product.OrderBean" %>
<%@ page import="my.shop.product.ProductBean" %>
<%@ page import="java.util.Hashtable" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cartMgr" class="my.shop.product.CartManager" scope="session" />
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />    <!-- 저장할때 product 의 정보가 필요해서 -->
<html>
<head>
    <title>장바구니</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
** 카트(장바구니) 목록 **
<%@include file="guest_top.jsp"%>
<table style="width: 90%;">
    <tr style="background-color: lightgray;">
        <th>주문상품</th>
        <th>가격(소계)</th>
        <th>수량</th>
        <th>수정 및 삭제</th>
        <th>조회</th>
    </tr>
    <%
        int totalPrice = 0;
        Hashtable hCart = cartMgr.getCartList();
//        Hashtable hCart = cartMgr.getCartList();  // return 받은거임.
        if (hCart.size() == 0) {
    %>
    <tr>
        <td colspan="5">주문건수가 없습니다.</td>
    </tr>
    <%
        } else {
            Enumeration enu = hCart.keys();
            while (enu.hasMoreElements()) {
                OrderBean order = (OrderBean)hCart.get(enu.nextElement());
                ProductBean product = productMgr.getProduct(order.getProduct_no());
                int price = Integer.parseInt(product.getPrice());
                int quantity = Integer.parseInt(order.getQuantity());
                int subTotal = price * quantity;    // 소계.
                totalPrice += subTotal; // 총계.
    %>
    <form action="cartproc.jsp" method="post">
        <input type="hidden" name="flag">
        <input type="hidden" name="product_no" value="<%=product.getNo()%>">
    </form>
    <tr>
        <td><%=product.getName()%></td>
        <td><%=subTotal%></td>
        <td>
            <input type="text" name="quantity" size="5" style="text-align: center;" value="<%=quantity%>">
        </td>
        <td>
            <input type="button" value="수정" onclick="cartUpdate(this.form)" style="background-color: cadetblue;"> /
            <input type="button" value="삭제" onclick="cartDelete(this.form)" style="background-color: cadetblue;">
        </td>
        <td>상세보기</td>
    </tr>
    <%
            }
    %>
        <tr>
            <td colspan="5">
                <br>
                <b>총 결제금액 : <%=totalPrice%></b>
                %nbsp;%nbsp;%nbsp;%nbsp;
                <a href="orderproc.jsp">주문하기</a>
            </td>
        </tr>
    <%
        }
    %>

</table>
<%@include file="guest_bottom.jsp"%>
</body>
</html>
