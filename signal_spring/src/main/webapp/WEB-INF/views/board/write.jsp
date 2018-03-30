<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#preview img {
	width: 100px;
	height: 100px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	border: 1px solid;
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
}
</style>
<script>
	imgCnt = 0;
	$(document).on('click', '#uploadImg', function() {
		$('#uploadFile').trigger('click');
		fn_fileAdd();

		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		})
	});

	function fn_fileDelete(obj) {
		obj.parent().remove();
	}

	function fn_fileAdd() {
		var str = "<div id='attach'><label class='ui inverted button' for='fileUpload'>파일첨부</label><input id='fileUpload' type='file' name='file_"
				+ (imgCnt++)
				+ "' style='display:none;'/><button id='deleteAddImg' type='button' class='ui floated negative labeled button icon'><i name='delete' class='trash alternate icon'></i>Delete</button></div> ";

		$("#fileDiv").append(str);
		$("#deleteAddImg").on("click", function(e) {
			fn_fileDelete($(this));
		})

		// image preview 기능 구현
		// input = file object[]
		function addPreview(input) {
			if (input[0].files) {
				//파일 선택이 여러개였을 시의 대응
				for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
					var file = input[0].files[fileIndex];

					if (validation(file.name))
						continue;

					var reader = new FileReader();
					reader.onload = function(img) {
						//div id="preview" 내에 동적코드추가.
						//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
						var imgNum = previewIndex++;
						$("#preview")
								.append(
										"<div class=\"preview-box\" value=\"" + imgNum +"\">"
												+ "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
												+ "<p>"
												+ file.name
												+ "</p>"
												+ "<a href=\"#\" value=\""
												+ imgNum
												+ "\" onclick=\"deletePreview(this)\">"
												+ "삭제" + "</a>" + "</div>");
						files[imgNum] = file;
					};
					reader.readAsDataURL(file);
				}
			} else
				alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
		}

		//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
		function deletePreview(obj) {
			var imgNum = obj.attributes['value'].value;
			delete files[imgNum];
			$("#preview .preview-box[value=" + imgNum + "]").remove();
			resizeHeight();
		}
	}
</script>
<body>
	<div id='content' class="ui container">
		<br> <br> <br>
		<form action="/board/complete" method="post"
			enctype="multipart/form-data" class="ui form">

			<div class="field">
				<h3 class="ui dividing inverted header">Title</h3>
				<input name="bName" type="text" class="ui input">
			</div>

			<div class="field">
				<h3 class="ui dividing inverted header">Text</h3>
				<textarea name="bContent"></textarea>
			</div>

			<div id="fileDiv" class="field"></div>

			<div id="preview" class="content"></div>

			<button type="button" id="uploadImg"
				class="ui button inverted labeled icon">
				<i class="upload icon"></i>Image Upload
			</button>
			<button class="ui primary button">Save</button>
		</form>
	</div>
</body>
</html>