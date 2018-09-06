<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminid = (String) session.getAttribute("adminKey");
    if (adminid == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<table style="width: 90%;">
    <tr style="background-color: lightsalmon;">
        <td>
            <a href="../index.jsp">홈페이지</a>
            <a href="adminlogout.jsp">로그아웃</a>
            <a href="membermanager.jsp">회원관리</a>
            <a href="productmanager.jsp">상품관리</a>
            <a href="ordermanager.jsp">주문관리</a>
        </td>
    </tr>
</table>