<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="my.shop.member.MemberBean" />
<jsp:setProperty name="bean" property="*" />
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("idKey");
    boolean b = memberMgr.memberUpdate(bean, id);

    if (b) {
%>
<script>
    alert("수정 성공");
    location.href = "../guest/guest_index.jsp";
</script>
<% }else{ %>
<script>
    alert("수정 실패");
    history.back();
</script>
<%
    }
%>
</body>
</html>
