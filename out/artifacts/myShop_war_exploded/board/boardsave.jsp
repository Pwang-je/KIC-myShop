<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="my.shop.board.BoardBean"></jsp:useBean> 
<jsp:setProperty property="*" name="bean"/> <!--클라이언트에서 넘어온데이터를받겟다 -->
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager" scope="page"></jsp:useBean>
<!--scope ="page" 현재페이지에서만 유효  -->

<%
bean.setBip(request.getRemoteAddr());/*아이피 집어넣고.  */
bean.setBdate(); // 등록일 집어넣음
//System.out.print(bean.getBdate());
int maxNum = boardMgr.currentGetMaxNum() +1;
bean.setNum(maxNum);
bean.setGnum(maxNum);
boardMgr.saveData(bean); /*boardMananer에 가서 insert참여  */

response.sendRedirect("boardlist.jsp?page=1");
%>