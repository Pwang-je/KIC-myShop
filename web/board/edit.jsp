<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" />
<jsp:useBean id="dto" class="my.shop.board.BoardDto" />
<%
    String num = request.getParameter("num");
    String spage = request.getParameter("page");
    dto = boardMgr.getData(num);
%>

<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="../css/board.css">
    <script>
        function check() {
            if (frm.pass.value() === "") {
                frm.pass.focus();
                alert("비밀번호를 입력하세요");
                return;
            }
            if (confirm("정말 수정함?")) {
                frm.submit();
            }
        }
    </script>
</head>
<body>

<h2>** 글수정 **</h2>
<form action="editsave.jsp" name="frm" method="post">
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="page" value="<%=spage%>">
    <table border="1">
        <tr>
            <td>작성자</td>
            <td><input type="text" name="name" size="15" value="<%=dto.getName()%>"></td>
        </tr>
        <tr>
            <td>암 호</td>
            <td><input type="password" name="pass" size="15"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="mail" size="25" value="<%=dto.getMail()%>"></td>
        </tr>
        <tr>
            <td>글제목</td>
            <td><input type="text" name="title" size="50" value="<%=dto.getTitle()%>"></td>
        </tr>
        <tr>
            <td>글내용</td>
            <td><textarea rows="10" cols="50" name="cont"><%=dto.getCont()%></textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="button" value="수 정" onclick="check()">&nbsp;
                <input type="button" value="목 록" onclick="location.href='boardlist.jsp?page=<%=spage%>'">
            </td>

        </tr>
    </table>
</form>

</body>
</html>
