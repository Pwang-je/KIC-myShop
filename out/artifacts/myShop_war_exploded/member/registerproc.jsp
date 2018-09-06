<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memBean" class="my.shop.member.MemberBean" />
<jsp:setProperty name="memBean" property="*" />
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<%
    boolean b = memberMgr.memInsert(memBean);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if (b) {
        out.println("회원가입을 축하함.<br>");
        out.println("<a href='login.jst'>로그인</a>");
    } else {
        out.println("회원가입 실패! 관리자에게 문의하시옹.<br>");
        out.println("<a href='register.jst'>가입 재시도</a>");
    }
%>
</body>
</html>
