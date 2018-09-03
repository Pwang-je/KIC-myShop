<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="my.shop.board.BoardBean" />
<jsp:setProperty name="bean" property="*" />    <!-- 여기까지 클라이언트에서 쓴 데이터가 넘어옴 -->
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" />

<%
    boardMgr.savdData(bean);
%>