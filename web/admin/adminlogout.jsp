<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("adminKey");
%>
<script>
    alert("로그아웃 성공");
    location.href = "../index.jsp";
</script>
</body>
</html>
