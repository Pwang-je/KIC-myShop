<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="my.shop.member.MemberBean" />
<jsp:setProperty name="bean" property="*" />
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />

<%
    boolean b = memberMgr.memberUpdate(bean, bean.getId());
    if (b) {
%>
        <script>
            alert("수정 성공");
            location.href = "../admin/membermanager.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("수정 실패\n관리자에게 문의 해주세요.");
            history.back();
        </script>
<%
    }
%>
