<%@ page import="java.util.ArrayList" %>
<%@ page import="my.shop.member.MemberBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>

** 관리자 : 전체 회원 관리 ** <br>
<%@ include file="admin_top.jsp"%>
<table style="width: 90%;">
    <tr style="background-color: cyan;">
        <td>아이디</td>
        <th>회원명</th>
        <th>비밀번호</th>
        <th>이메일</th>
        <th>전화</th>
        <th>수정</th>
    </tr>
<%
    ArrayList<MemberBean> list = memberMgr.getMemberAll();
    for (MemberBean m:list) {
        %>
    <tr>
        <td><%=m.getId()%></td>
        <td><%=m.getName()%></td>
        <td><%=m.getPasswd()%></td>
        <td><%=m.getEmail()%></td>
        <td><%=m.getPhone()%></td>
        <td>
            <a href="javascript:memUpdate('<%=m.getId()%>')">수정하기</a>
        </td>
    </tr>
    <%
    }
%>

</table>
<%@ include file="admin_bottom.jsp"%>

<form action="memberupdateManager.jsp" name="updateFrm" method="post">
    <input type="hidden" name="id">
</form>
</body>
</html>
