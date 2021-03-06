<%@ page import="my.shop.member.MemberBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberMgr"  class="my.shop.member.MemberManager" />
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    MemberBean bean = memberMgr.getMember(id);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
    <script type="text/javascript">
        window.onload = function(){
            document.getElementById("btnUpdateAdmin").onclick = memUpdateAdminFunc;
            document.getElementById("btnUpdateCancleAdmin").onclick = memUpdateCancleAdminFunc;
        }
    </script>
</head>
<body>
<br>
<table class="table">
    <tr>
        <td align="center" valign="middle" style="background-color: #FFFFCC">
            <form name="updateFormAdmin" method="post" action="memberupdateprocManager.jsp">
                <table border="1">
                    <tr align="center" style="background-color: #8899aa">
                        <td colspan="2"><b style="color: #FFFFFF">회원 가입</b></td>
                    </tr>

                    <tr>
                        <td width="16%">아이디</td>
                        <td width="57%">
                            <%=bean.getId()%> <%=bean.getName()%> 님의 정보 수정 화면.
                            <input type="hidden" name="id" value="<%=bean.getId()%>">
                        </td>
                    </tr>

                    <tr>
                        <td>패스워드</td>
                        <td><input type="password" name="passwd" size="15" value="<%=bean.getPasswd()%>"></td>
                    </tr>

                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="name" size="15" value="<%=bean.getName()%>"></td>
                    </tr>

                    <tr>
                        <td>이메일</td>
                        <td><input type="text" name="email" size="27" value="<%=bean.getEmail()%>"></td>
                    </tr>

                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="phone" size="20" value="<%=bean.getPhone()%>"></td>
                    </tr>

                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" name="zipcode" size="7" value="<%=bean.getZipcode()%>">
                        </td>
                    </tr>

                    <tr>
                        <td>주소</td>
                        <td><input type="text" name="address" size="60" value="<%=bean.getAddress()%>"></td>
                    </tr>

                    <tr>
                        <td>직업</td>
                        <td>
                            <select name=job>
                                <option value="<%=bean.getJob()%>"> <%=bean.getPasswd()%> </option>
                                <option value="회사원">회사원</option>
                                <option value="학생">학생</option>
                                <option value="자영업">자영업</option>
                                <option value="주부">주부</option>
                                <option value="기타">기타</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <input type="button"
                                   value="수정완료" id="btnUpdateAdmin">
                            <input type="button"
                                   value="수정취소" id="btnUpdateCancleAdmin">
                        </td>
                    </tr>
                </table>
            </form>
        </td>

    </tr>

</table>
</body>
</html>
