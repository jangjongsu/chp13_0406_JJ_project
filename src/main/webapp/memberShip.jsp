<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원전용공간</title>
</head>
<body>
	반갑습니다<br>
	여기는 회원전용 공간입니다.<br>
	회원탈퇴를 하려면 버튼을 눌러 주세요<br>
	<table border="0">
		<tr>
			<td>
				<form action="main.jsp">
					<input type="submit" value="◀ 메인 화면">
				</form>
			</td>
			<td>
				<form action="withdraw.jsp">
					<input type="submit" value="회원 탈퇴하기 ▶">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>