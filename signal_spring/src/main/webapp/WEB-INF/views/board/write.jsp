<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
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
	<form action="/board/complete" method="post"
		enctype="multipart/form-data">
		<div class="ui form">
			<div class="field">
				<label>Title</label> <input name="bName" width="150" type="text">
			</div>
			<div class="field">
				<label>Text</label>
				<textarea name="bContent" rows="100" cols="100"
					style="height: 300px;">
					
				</textarea>
			</div>

			<div class="field">
				<label>Image Upload</label>
				<button type="button" id="uploadImg" class="ui button">
					<i class="upload icon"></i>
				</button>
			</div>
			<button class="ui primary button">Save</button>
			<input id="uploadFile" type="file" name="imgFile"
				style="visibility: hidden;">
		</div>
	</form>
</body>
</html>