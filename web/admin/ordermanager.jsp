<%@ page import="java.util.ArrayList" %>
<%@ page import="my.shop.product.OrderBean" %>
<%@ page import="my.shop.product.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager" />
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>

</head>
<body>
* 주문된 상품목록 * <br>
<%@include file="admin_top.jsp"%>
<table style="width: 90%;">
    <tr>
        <th>주문번호</th>
        <th>주문자</th>
        <th>주문상품</th>
        <th>주문수량</th>
        <th>주문일</th>
        <th>주문상태</th>
        <th>보기</th>
    </tr>
    <%
        ArrayList<OrderBean> list = orderMgr.getOrderAll();
        if (list.size() == 0) {
    %>
    <tr>
        <td colspan="7">주문 내역이 없어요.</td>
    </tr>
    <%
        } else {
            for (int i = 0; i < list.size(); i++) {
                OrderBean order = (OrderBean)list.get(i);
                ProductBean product =
                    productMgr.getProduct(order.getProduct_no());
    %>
    <tr>
        <td><%=order.getNo()%></td>
        <td><%=order.getId()%></td>
        <td><%=product.getName()%></td>
        <td><%=order.getQuantity()%></td>
        <td><%=order.getSdate()%></td>
        <td>
            <%
                switch (Integer.parseInt(order.getState())) {
                    case 1: out.println("접수"); break;
                    case 2: out.println("입금확인"); break;
                    case 3: out.println("배송준비"); break;
                    case 4: out.println("배송중"); break;
                    case 5: out.println("처리완료"); break;
                    default: out.println("접수중");
                }
            %>
        </td>
        <td><a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
    </tr>
    <%
            }
        }
    %>
</table>
<%@include file="admin_bottom.jsp"%>

<form action="orderdetail.jsp" name="detailFrm" method="post">
    <input type="hidden" name="no">
</form>


</body>
</html>
