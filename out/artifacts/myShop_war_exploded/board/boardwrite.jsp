<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!--정보입력  -->
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css"/>
<script type="text/javascript">
function check(){
	if(frm.name.value ==""){
		alert("이름을 입력하시오");
		frm.name.focus(); //네임에 커서
		return;
	}
	//나머지 입력자료 검사 생략
	
	frm.submit(); // 밑에 내용을 넘겨야함.
}


</script>
</head>
<body>
<h2>**글쓰기 **</h2>
<form action="boardsave.jsp" name="frm" method="post">
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" size="15"></td>
	</tr>
	<tr>
		<td>암 호</td>
		<td><input type="password" name="pass" size="15"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="email" name="mail" size="25"></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td><input type="text" name="title" size="50"></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td><textarea rows="10" cols="50" name="cont"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="button" value="메 인" onclick="location.href='../index.jsp'">&nbsp;
		<input type="button" value="작 성" onclick="check()">&nbsp;
		<input type="button" value="목 록" onclick="location.href='boardlist.jsp'">
		</td>
		
	</tr>
	
	
</table>

</form>
</body>
</html>