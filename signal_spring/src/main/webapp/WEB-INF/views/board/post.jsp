<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드 결과 페이지</title>

</head>
<body>
	<p>파일 ID : ${imageVO.imgId}</p>
	<p>저장된 파일 이름 : ${imageVO.imgName}</p>
	<p>파일 길이 : ${imageVO.imgSize}</p>
	<p>MIME 타입 : ${imageVO.imgType}</p>
	<img src="/web/upload_images/${imageVO.imgId}.jpg">
</body>

</html>