<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="memberMgr" class="my.shop.member.MemberManager" />
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");

    boolean b = memberMgr.loginCheck(id, passwd);

    if (b) {
        session.setAttribute("idKey", id);
        response.sendRedirect("login.jsp");
    } else {
        response.sendRedirect("loginfail.html");

    }

%>