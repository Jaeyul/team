<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/complete" method="post"
		enctype="multipart/form-data">
		제목: <input type="text" name="bName" /> <br /> 내용:
		<textarea name="bContent" cols="50" rows="13"></textarea>
		<br /> 리포트파일: <input type="file" name="imgFile" /> <br /> <input
			type="submit" />

	</form>
</body>
</html>