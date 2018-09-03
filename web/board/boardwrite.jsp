<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/board.css">
    <script>
        function check() {
            if (frm.name.value == " ") {
                alert("이름을 입력하시오");
                frm.name.focus();
                return;
            }
            frm.submit();
        }

        // 입력자료 오류 검사 생략.
    </script>
</head>
<body>
<h2>** 글쓰기 **</h2>
<form action="boardsave.jsp" name="frm" method="post">
    <table border="1">
        <tr>
            <td>작성자</td>
            <td><input type="text" name="name" size="15"></td>
        </tr>

        <tr>
            <td>암호</td>
            <td><input type="password" name="pass" size="10"></td>
        </tr>

        <tr>
            <td>메일</td>
            <td><input type="email" name="mail" size="25"></td>
        </tr>

        <tr>
            <td>글제목</td>
            <td><input type="text" name="title" size="50"></td>
        </tr>

        <tr>
            <td>글내용</td>
            <td><textarea name="cont" cols="50" rows="10"></textarea></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="button" value="메인" onclick="location.href='../index.jsp'">&nbsp;
                <input type="button" value="작성" onclick="check()">&nbsp;
                <input type="button" value="목록보기" onclick="location.href='boardlist.jsp'">&nbsp;
            </td>            
        </tr>
    </table>
</form>



</body>
</html>
