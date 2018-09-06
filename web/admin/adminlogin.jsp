<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 로그인</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
    <script>
        window.onload = function () {
            document.getElementById("btnAdminLogin").onclick = funcAdminLogin;
            document.getElementById("btnHome").onclick = funcHome;
        }
        function funcAdminLogin() {
            if (adminloginForm.adminid.value === "") {
                alert("ID를 입력하세요");
                adminloginForm.adminid.focus();
                return;
            }
            if (adminloginForm.adminpasswd.value === "") {
                alert("PASSWORD를 입력하세요");
                adminloginForm.adminpasswd.focus();
                return;
            }
            adminloginForm.submit();
        }
        function funcHome() {
            location.href = "../index.jsp";
        }
    </script>
</head>
<body>
<form action="adminloginproc.jsp" name="adminloginForm" method="post">
    <table>
        <tr>
            <td>** 관리자 로그인 **</td>
        </tr>

        <tr>
            <td>i  d :</td>
            <td><input type="text" name="adminid"></td>
        </tr>

        <tr>
            <td>password :</td>
            <td><input type="text" name="adminpasswd"></td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="button" value="관리자 로그인" id="btnAdminLogin">
                <input type="button" value="메인페이지" id="btnHome">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
