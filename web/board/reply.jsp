<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" />
<jsp:useBean id="dto" class="my.shop.board.BoardDto" />
<%
    String num = request.getParameter("num");
    String spage = request.getParameter("page");
    dto = boardMgr.getReplayData(num);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/board.css">
    <script type="text/javascript">
        function check(){
            if(frm.name.value ==""){
                alert("이름을 입력하시오");
                frm.name.focus(); //네임에 커서
                return;
            }
            //나머지 입력자료 검사 생략

            frm.submit(); // 밑에 내용을 넘겨야함.
        }
    </script>
</head>
<body>

<h2>** 댓글쓰기 **</h2>
<form action="replysave.jsp" name="frm" method="post">
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="page" value="<%=spage%>">
    <input type="hidden" name="gnum" value="<%=dto.getGnum()%>">
    <input type="hidden" name="onum" value="<%=dto.getOnum()%>">
    <input type="hidden" name="nested" value="<%=dto.getNested()%>">
    <table border="1">
        <tr>
            <td>작성자</td>
            <td><input type="text" name="name" size="15"></td>
        </tr>
        <tr>
            <td>암 호</td>
            <td><input type="password" name="pass" size="15"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="mail" size="25"></td>
        </tr>
        <tr>
            <td>글제목</td>
            <td><input type="text" name="title" size="50" value="[Re:]:<%=dto.getTitle()%>"></td>
        </tr>
        <tr>
            <td>글내용</td>
            <td><textarea rows="10" cols="50" name="cont"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="button" value="작 성" onclick="check()">&nbsp;
                <input type="button" value="목 록" onclick="location.href='boardlist.jsp?page=<%=spage%>'">
            </td>

        </tr>


    </table>

</form>



</body>
</html>
