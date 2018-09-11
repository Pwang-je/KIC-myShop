<%@ page import="my.shop.product.OrderBean" %>
<%@ page import="my.shop.product.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager" />
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />
<%
    OrderBean order = orderMgr.getOrderDetail(request.getParameter("no"));
    ProductBean product = productMgr.getProduct(order.getProduct_no());
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp"%>

** 주문 상세보기 ** <br>
<form action="orderproc_admin.jsp" name="orderDetailFrm" method="post">
    <table style="width: 90%;">
        <tr>
            <td>고객 아이디 : <%=order.getId()%></td>
            <td>주 문 번 호 : <%=order.getNo()%></td>
            <td>상 품 번 호 : <%=product.getNo()%></td>
            <td>상  품  명 : <%=product.getName()%></td>
        </tr>
        <tr>
            <td>상품가격 : <%=product.getPrice()%></td>
            <td>주문수량 : <%=order.getQuantity()%></td>
            <td>재 고 수 : <%=product.getStock()%></td>
            <td>주 문 일 : <%=order.getSdate()%></td>
        </tr>
        <tr>
            <td colspan="4">총 액 : <%=Integer.parseInt(order.getQuantity()) * Integer.parseInt(product.getPrice())%></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                주문 상태 :
                <select name="state">
                    <option value="1">접수</option>
                    <option value="2">입금확인</option>
                    <option value="3">배송준비</option>
                    <option value="4">배송중</option>
                    <option value="5">처리완료</option>
                </select>
                <script>
                    document.orderDetailFrm.state.value = <%=order.getState()%>;
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <input type="button" value="수 정" onclick="orderUpdate(this.form)">
                <input type="button" value="삭 제">
                <input type="hidden" name="no" value="<%=order.getNo()%>">
                <input type="hidden" name="flag">
            </td>
        </tr>
    </table>
</form>
<%@include file="admin_bottom.jsp"%>

</body>
</html>
