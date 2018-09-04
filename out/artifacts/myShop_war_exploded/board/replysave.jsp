<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="my.shop.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/> <!--클라이언트에서 넘어온데이터를받겟다 -->
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" scope="page"></jsp:useBean>
<!--scope ="page" 현재페이지에서만 유효  -->
<%
    String spage = request.getParameter("page");
    int num = bean.getNum();
    int gnum = bean.getGnum();
    int onum = bean.getOnum() + 1;  // 댓글이라서 1 증가.
    int nested = bean.getNested() + 1;

    // 같은 그룹 내에서 새로운 댓글의 onum 보다 크거나 같은 값을 댓글 입력 전에
    // 먼저 수정하기. 작으면 수정 안함.
    boardMgr.updateOnum(gnum,onum); // onum 갱신 작업.

    bean.setOnum(onum);
    bean.setNested(nested);
    bean.setBip(request.getRemoteAddr());
    bean.setBdate();
    bean.setNum(boardMgr.currentGetMaxNum() + 1);

    boardMgr.saveReplyData(bean);
    response.sendRedirect("boardlist.jsp?page=" + spage);





%>