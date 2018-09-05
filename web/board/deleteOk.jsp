<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" class="my.shop.board.BoardBean"></jsp:useBean>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" scope="page"></jsp:useBean>
<%
    String spage = request.getParameter("page");
    String num = request.getParameter("num");
    String pass = request.getParameter("pass");

    boolean b = boardMgr.checkPass(Integer.parseInt(num), pass);
    if (b) {
        boardMgr.delData(num);
        response.sendRedirect("boardlist.jsp?page=" + spage);
    } else {
%>
<script>
    alert("비밀번호 불일치");
    history.back();
</script>
<%
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
