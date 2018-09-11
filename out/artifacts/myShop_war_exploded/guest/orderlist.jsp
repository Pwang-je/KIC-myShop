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
<%@include file="guest_top.jsp"%>
** 주문 상품 목록 **
<table style="width: 90%;">
    <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>주문수</th>
        <th>주문일</th>
        <th>주문상태</th>
    </tr>
    <%
        String id = (String) session.getAttribute("idKey");

        ArrayList<OrderBean> list = orderMgr.getOrder(id);
        if (list.size() == 0) {
    %>
    <tr>
        <td colspan="5">주문한 상품이 없음</td>
    </tr>
    <%
        } else {
            for (OrderBean o:list) {
                ProductBean product = productMgr.getProduct(o.getProduct_no());
    %>
    <tr>
        <td><%=o.getNo()%></td>
        <td><%=o.getProduct_no()%></td>
        <td><%=o.getQuantity()%></td>
        <td><%=o.getSdate()%></td>
        <td>
            <%
                switch (Integer.parseInt(o.getState())) {
                    case 1: out.println("접수"); break;
                    case 2: out.println("입금확인"); break;
                    case 3: out.println("배송준비"); break;
                    case 4: out.println("배송중"); break;
                    case 5: out.println("처리완료"); break;
                    default: out.println("접수중");
                }
            %>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
<%@include file="guest_bottom.jsp"%>
</body>
</html>
