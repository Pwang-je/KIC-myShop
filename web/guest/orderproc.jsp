<%@ page import="java.util.Enumeration" %>
<%@ page import="my.shop.product.OrderBean" %>
<%@ page import="java.util.Hashtable" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cartMgr" class="my.shop.product.CartManager" scope="session" />
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager" />
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />
<%
    Hashtable hCart = cartMgr.getCartList();

    Enumeration enu = hCart.keys();
    if (hCart.size() == 0) {
%>
<script>
    alert("주문 내역이 없음");
    location.href = "orderlist.jsp";
</script>
<%
    } else {
        while (enu.hasMoreElements()) {
            OrderBean order = (OrderBean) hCart.get(enu.nextElement());
            orderMgr.insertOrder(order);    // 주문상품 db에 저장.
            productMgr.reduceProduct(order);    // 주문 수 만큼 상품 재고량 빼기
            cartMgr.deleteCart(order);
        }
%>
<script>
    alert("주문 처리가 잘되따");
    location.href = "orderlist.jsp";
</script>
<%
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
