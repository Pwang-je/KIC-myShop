<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/board.css">
    <script>
        function check() {
            // if (frm.id.value() === "" || frm.pwd.value() === "") {
            //     alert("자료를 입력하세요");
            //     return;
            // }
            frm.submit();
        }
    </script>
</head>
<body>
<form action="adminLogin.jsp" name="frm" method="post">

    <table>
        <tr>
            <td>
                <%
                    String sessionValue = (String) session.getAttribute("adminOk");
                    if (sessionValue != null) {
                        %>
                        이미 롤그인을 했습니다. <br><br>
                    [<a href="adminLogout.jsp">로그아웃</a>]
                    [<a href="javascript:window.close()">창닫기</a>]
                <%
                    } else {
                %>


                <table style="width: 100%;">
                    <tr>
                        <td>i d :</td>
                        <td><input type="text" name="id"></td>
                    </tr>

                    <tr>
                        <td>pwd :</td>
                        <td><input type="text" name="pwd"></td>
                    </tr>

                    <tr>
                        <td>
                            [<a href="#" onclick="check()">로그인</a>]
                            [<a href="javascript:window.close()">창닫기</a>]
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                <%
                    }
                %>
</form>
</body>
</html>
