<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="my.shop.board.BoardManager"></jsp:useBean>
<jsp:useBean id="dto" class="my.shop.board.BoardDto"></jsp:useBean>

<%
	String num = request.getParameter("num");
	String spage = request.getParameter("page");
	//System.out.println(num + " " + spage);

	boardMgr.updateReadcnt(num);
	dto = boardMgr.getData(num); //해당자료읽기
	
	String name = dto.getName();
	String pass = dto.getPass();
	String mail = dto.getMail();
	String title = dto.getTitle();
	String cont = dto.getCont();
	String bip = dto.getBip();
	String bdate = dto.getBdate();
	int cnt = dto.getReadcnt();

    // 비밀번호 관리자만 보이게.
    String apass = "******";
	String adminOk = (String) session.getAttribute("adminOk");
	if (adminOk != null) {
	    if (adminOk.equals("admin")) apass = pass;
    }
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판-상세보기</title>
	<link rel="stylesheet" href="../css/board.css">
</head>
<body>
<table>
	<tr>
		<td><b>비밀번호:<%=pass %></b></td>
		<td style="text-align: right;">
			<a href="reply.jsp?num=<%=num%>&page=<%=spage%>">
				<img src="../images/reply.gif" alt="reply">
			</a>

			<a href="edit.jsp?num=<%=num%>&page=<%=spage%>">
				<img src="../images/edit.gif" alt="reply">
			</a>

			<a href="delete.jsp?num=<%=num%>&page=<%=spage%>">
				<img src="../images/del.gif" alt="reply">
			</a>

			<a href="boardlist.jsp?page=<%=spage%>">
				<img src="../images/list.gif" alt="reply">
			</a>
		</td>
	</tr>
	<tr>
		<td>작성자 : <a href="mailto:<%=name%>"><%=name %></a>
		ip : <%=bip %>)</td>
		<td>작성일 : <%=bdate %> </td> 
		<td>조회수 : <%=cnt %> </td>
			
	</tr>
	<tr>
		<td colspan="2" style="background-color:cyan">제목:<%=title %>
	</tr>
	<tr>
		<td colspan="2"> 
		<textarea rows="10" readonly><%=cont %></textarea>
	</td>
	</tr>

</table>

</body>
</html>