<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="my.shop.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/> <!--클라이언트에서 넘어온데이터를받겟다 -->
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" scope="page"></jsp:useBean>
<!--scope ="page" 현재페이지에서만 유효  -->
<%
    String spage = request.getParameter("page");
//    System.out.println(bean.getNum() + " " + bean.getPass());

    boolean b = boardMgr.checkPass(bean.getNum(), bean.getPass());
    if (b) {
        boardMgr.editData(bean);
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
