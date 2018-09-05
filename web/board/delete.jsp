<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" class="my.shop.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/> <!--클라이언트에서 넘어온데이터를받겟다 -->
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" scope="page"></jsp:useBean>
<!--scope ="page" 현재페이지에서만 유효  -->
<%
    String spage = request.getParameter("page");
    String num = request.getParameter("num");
%>

<%

%>
<script>
    function check() {
        if (confirm("정말 삭제함?")) {
            frm.submit();
        }
    }
</script>
<%

%>

<html>
<head>
    <title>Title</title>

</head>
<body>
<h2>** 삭제 **</h2>
<form action="deleteOk.jsp" name="frm" method="post">
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="page" value="<%=spage%>">
    비밀번호를 입력하세요 : <input type="password" name="pass">
    <input type="button" value="삭제" onclick="check()">
    <input type="button" value="목록" onclick="location.href='boardlist.jsp?page=<%=spage%>'">
</form>
</body>
</html>
