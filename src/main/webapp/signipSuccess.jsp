<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 성공</title>
</head>
<body>
<h2>회원 등록 성공</h2>
<hr>
축하합니다<br>
회원등록에 성공하셨습니다<br>
관리자인 경우만 로그인 수행이 가능합니다<br>
	<table border="0">
		<tr>
			<td>
				<form action="memberShip.jsp">
					<input type="submit" value="◀ 사용자공간 이동">
				</form>
			</td>
			<td>
				<form action="login.jsp">
					<input type="submit" value="관리자 모드 이동 ▶">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>