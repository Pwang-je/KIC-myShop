<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    if (id.equals("admin") && pwd.equals("aaa")) {
        session.setAttribute("admin", id);
        out.println("로그인 성공<br>");
    } else {
        out.println("로그인 실패");
    }
%>
[<a href="javascript:window.close()">창닫기</a>]
</body>
</html>
