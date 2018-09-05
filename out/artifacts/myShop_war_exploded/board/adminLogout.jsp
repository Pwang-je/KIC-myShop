<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("adminOk");
%>
로그아웃 성공!
<br><br>
[<a href="javascript:window.close()">창닫기</a>]
</body>
</html>
