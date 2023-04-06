<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	<%
		String uid = request.getParameter("uId");
		String upw = request.getParameter("uPw");
		
		if(uid.equals("admin") && upw.equals("12345")){
			session.setAttribute("adminId", uid);
			out.print("관리자님"+uid+"님 로그인 하셨습니다.");
		} else{
			response.sendRedirect("loginErr.jsp");
		}
	%>
	<table border="0">
		<tr>
			<td>
				<form action="memberLisr.jsp">
					<input type="submit" value="◀ 회원명단 열람">
				</form>
			</td>
			<td>
				<form action="logout.jsp">
					<input type="submit" value="로그 아웃하기 ▶">
				</form>
			</td>
		</tr>
	</table>
	
</body>
</html>