<%@ page import="my.shop.product.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="productMgr" class="my.shop.product.ProductManager" />
<%
    String no = request.getParameter("no");
    ProductBean bean = productMgr.getProduct(no);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
** 상품 상세보기 ** <br>
<%@include file="admin_top.jsp"%>
<table style="width: 90%;">
    <tr>
        <td style="width: 20%;">
            <img src="../data/<%=bean.getImage()%>" width="150px">
        </td>

        <td style="width: 50%;">
            <table style="width: 100%;">
                <tr>
                    <td>번 호: </td>
                    <td><%=bean.getNo()%></td>
                </tr>

                <tr>
                    <td>상품명: </td>
                    <td><%=bean.getName()%></td>
                </tr>

                <tr>
                    <td>가 격: </td>
                    <td><%=bean.getPrice()%></td>
                </tr>

                <tr>
                    <td>등록일: </td>
                    <td><%=bean.getSdate()%></td>
                </tr>

                <tr>
                    <td>재 고: </td>
                    <td><%=bean.getStock()%></td>
                </tr>
            </table>
        </td>

        <td style="width: 30%; vertical-align: top;">
            <b>상품설명</b>
            <%=bean.getDetail()%>
        </td>
    </tr>

    <tr style="text-align: center;">
        <td>
            <a href="javascript:productUpdate('<%=bean.getNo()%>')">수정하기</a>
            <a href="javascript:productDelete('<%=bean.getNo()%>')">삭제하기</a>
        </td>
    </tr>
</table>

<%@include file="admin_bottom.jsp"%>

<form action="productupdate.jsp" name="updateFrm" method="post">
    <input type="hidden" name="no">
</form>
<form action="productproc.jsp?flag=delete" name="delFrm" method="post">
    <input type="hidden" name="no">
</form>

</body>
</html>
