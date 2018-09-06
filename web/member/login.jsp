<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id  = (String) session.getAttribute("idKey");
%>
<html>
<head>
    <title>Title</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script src="../js/script.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            document.getElementById("btnLogin");
            addEventListener("click", funcLogin, false);
            document.getElementById("btnNewmember");
            addEventListener("click", funcNew, false);
        }
        function funcLogin () {
            if (loginForm.id.value === "" || loginForm.passwd.value) {
                alert("자료를 채우시오");
            } else {
                loginForm.action = "loginproc.jsp";
                loginForm.method = "post";
                loginForm.submit();
            }
        }
        function funcNew() {
            location.href = "register.jsp";
        }
    </script>
</head>
<body style="margin-top: 20px;">
<%
    if (id != null) {
        response.sendRedirect("../guest/guest_index.jsp");
%>
        <%--
        <b><%=id%>님 환영합니다.</b>
        준비된 기능을 사용할 수 있습니다.<<br>
        <a href="logout.jsp">로그아웃</a>
        --%>
<%
    } else {
%>
        <form name="loginForm">
            <table>
                <tr>
                    <td colspan="2">** 로그인 **</td>
                </tr>

                <tr>
                    <td>아이디 : </td>
                    <td><input type="text" name="id"></td>
                </tr>

                <tr>
                    <td>비밀번호 : </td>
                    <td><input type="text" name="passwd"></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="button" value="로그인" id="btnLogin">
                        <input type="button" value="회원가입" id="btnNewmember">
                    </td>
                </tr>
            </table>
        </form>
<%
    }
%>

</body>
</html>
