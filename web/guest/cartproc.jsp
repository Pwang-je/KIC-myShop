<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cartMgr" class="my.shop.product.CartManager" scope="session" />
<jsp:useBean id="order" class="my.shop.product.OrderBean" />
<jsp:setProperty name="order" property="*" />
<%
    request.setCharacterEncoding("UTF-8");
    String flag = request.getParameter("flag");
    String id = (String) session.getAttribute("idKey");

    if (id == null) {
        response.sendRedirect("../member/login.jsp");
    } else {
        if (flag == null) {
            // cart 에 주문상품 담기.
            order.setId(id);
            cartMgr.addCart(order);
%>
    <script>
        alert("장바구니에 담았음");
        location.href = "cartlist.jsp";
    </script>
<%
        } else if (flag.equals("update")) {
            order.setId(id);
            cartMgr.updateCart(order);
%>
    <script>
        alert("장바구니 내용을 수정하였습니다.");
        location.href = "cartlist.jsp";
    </script>
<%
        }  else if (flag.equals("delete")) {
            cartMgr.deleteCart(order);
%>
    <script>
        alert("장바구니 내용을 삭제하였습니다.");
        location.href = "cartlist.jsp";
    </script>
<%
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
