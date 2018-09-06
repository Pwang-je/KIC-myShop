<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<table style="width: 90%">
    <tr>
        <td>전문 쇼핑몰</td>
    </tr>
</table>

<%@include file="guest_top.jsp"%>
<table width="90%">
    <%
        if (memid != null) {
    %>
    <tr>
        <td style="text-align: center;">
            <%=memid%> 님 어서오세요
            <img src="../images/pic2.gif" alt="">
        </td>
    </tr>
    <%
        } else {
    %>
    <tr>
        <td style="font-size: 20px; height: 600px; background-image: url(../images/pic.jpg);">
            고갱님 환영합니다. <br><br><br>
            로그인 후 이용 가능합니다.
        </td>
    </tr>
    <%
        }
    %>
    <tr>
        <td>본문</td>
    </tr>
</table>
<%@include file="guest_bottom.jsp"%>
</body>
</html>
