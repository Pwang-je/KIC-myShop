<%@ page import="java.util.ArrayList" %>
<%@ page import="my.shop.member.ZipcodeBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<%
    request.setCharacterEncoding("UTF-8");

    String check = request.getParameter("check");
    String p_area3 = request.getParameter("area3");

    ArrayList<ZipcodeBean> list = memberMgr.zipRead(p_area3);
%>
<html>
<head>
    <title>Title</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script>
        window.onload = function () {
            document.getElementById("btnZipfind").onclick = dongCheck;
            document.getElementById("btnZipclose").onclick = function () {
                window.close();
            }
        }
        function dongCheck() {
            if (zipForm.area3.value === "") {
                alert("검색할 동을 입력하세요");
                zipForm.area3.focus();
                return;
            }
            zipForm.submit();
        }

        // 우편번호, 주소 회원가입 창의 textfield 에 넣어버리기.
        function send(zip, area_1, area_2, area_3, area_4) {
            // alert(zip + " " + area_1);
            opener.document.regForm.zipcode.value = zip;
            var addr = area_1 + " " + area_2 + " " + area_3 + " " + area_4 + " ";
            opener.document.regForm.address.value = addr;
            window.close(); // 주소검색 창 닫기.
        }

    </script>
</head>
<body>
<b>** 우편번호 찾기 **</b>
<form action="zipcheck.jsp" name="zipForm" method="post">
    <table>
        <tr>
            <td>
                동이름 입력 : <input type="text" name="area3">
                <input type="button" value="검색" id="btnZipfind">
                <input type="button" value="닫기" id="btnZipclose">
                <input type="hidden" name="check" value="n">
            </td>
        </tr>
    </table>
</form>

<%
    if (check.equalsIgnoreCase("n")) {
        if (list.isEmpty()) {
%>
            <b>검색결과가 없습니다.</b>
<%
        } else {
%>
            <table>
                <tr>
                    <td>
                        검색자료를 클릭하면 자동으로 주소가 등록됩니다.
                    </td>
                </tr>

                <tr>
                    <td>
                        <%
                            for (int i = 0; i < list.size(); i++) {
                                ZipcodeBean bean = list.get(i);
                                String zipcode = bean.getZipcode();
                                String area_1 = bean.getArea1();
                                String area_2 = bean.getArea2();
                                String area_3 = bean.getArea3();
                                String area_4 = bean.getArea4();
                                if (area_4 == null) {
                                    area_4 = "";
                                }
                        %>
                                <a href="javascript:send('<%=zipcode%>','<%=area_1%>','<%=area_2%>','<%=area_3%>','<%=area_4%>')">
                                    <%=zipcode%> <%=area_1%> <%=area_2%> <%=area_3%> <%=area_4%> <br>
                                </a>
                        <%
                            }
                        %>
                    </td>
                </tr>
            </table>
<%
        }
    }
%>

</body>
</html>
