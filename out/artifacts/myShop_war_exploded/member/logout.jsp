<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("idKey");
%>
<script>
    alert("로그아웃 성공");
    // location.href = "login.jsp";
    location.href = "../guest/guest_index.jsp";
</script>
</body>
</html>
