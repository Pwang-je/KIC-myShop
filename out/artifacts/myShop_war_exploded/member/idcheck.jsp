<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    boolean b = memberMgr.checkId(id);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<br><br>
<%=id%>
<%
    if (b) {
        %>
    는(은) 이미 사용 중인 ID 입니다. <p>
    <a href="#" onclick="opener.document.regForm.id.focus(); window.close()">닫기</a>
<%
    } else {
%>
    는(은) 사용 가능한 ID 입니다. <p>
    <a href="#" onclick="opener.document.regForm.id.focus(); window.close()">닫기</a>
<%
    }
%>
</body>
</html>
