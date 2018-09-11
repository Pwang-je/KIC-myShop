<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="orderMgr" class="my.shop.product.OrderManager" />
<%
    String flag = request.getParameter("flag");
    String no = request.getParameter("no");
    String state = request.getParameter("state");

    boolean b = false;
    if (flag.equals("update")) {
        b = orderMgr.updateOrder(no, state);
    } else if (flag.equals("delete")){

    } else {
        response.sendRedirect("ordermanager.jsp");
    }

    if (b) {
%>
<script>
    alert("정상처리");
    location.href = "ordermanager.jsp";

</script>

<%
    } else {
%>
<script>
    alert("실패");
    location.href = "ordermanager.jsp";
</script>
<%
    }
%>
