<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<%
    String adminid = request.getParameter("adminid");
    String adminpasswd = request.getParameter("adminpasswd");

    boolean b = memberMgr.adminLoginChk(adminid, adminpasswd);

    if (b) {
        session.setAttribute("adminKey", adminid);
        response.sendRedirect("admin_index.jsp");
    } else {
%>
<script>
    alert("관리자 입력자료 불일치!");
    location.href = "adminlogin.jsp";
</script>
<%
    }
%>