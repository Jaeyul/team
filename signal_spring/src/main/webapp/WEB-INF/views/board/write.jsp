<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).on('click', '#uploadImg', function() {
		$('#uploadFile').trigger('click');
	});
</script>
<body>
	<div id='content' class="ui container">
	<br><br><br>
		<form action="/board/complete" method="post"
			enctype="multipart/form-data" class="ui form">
			<div class="field">
				<h3 class="ui dividing inverted header">Title</h3> <input name="bName" type="text"
					class="ui input">
			</div>
			<div class="field">
				<h3 class="ui dividing inverted header">Text</h3>
				<textarea name="bContent"></textarea>
			</div>
			<div class="field">
				<h3 class="ui dividing inverted header">Image Upload</h3>
				<button type="button" id="uploadImg" class="ui button" style="width: 53;">
					<i class="upload icon"></i>
				</button>
			</div>
			
			<button class="ui primary button">Save</button>
			<input id="uploadFile" type="file" name="imgFile"
				style="visibility: hidden;">
		</form>
	</div>
</body>
</html>