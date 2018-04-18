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
.thumbnail {
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
	var files = {};
	var previewIndex = 0;
	var forEachIndex = 0;

	$(document).ready(function() {
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		})
	});
	// image preview 기능 구현
	// input = file object[]
	function addPreview(input) {

		if (input[0].files.length < 7) {
			for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
				var file = input[0].files[fileIndex];

				var reader = new FileReader();
				reader.onload = function(img) {
					if (validation(file.name, file.size,
							$(".preview-box").length)) {
						return;
					} else {
						//div id="preview" 내에 동적코드추가.
						//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
						var imgNum = previewIndex++;
						$("#preview")
								.append(
										"<div class=\"preview-box\" value=\"" + imgNum +"\">"
												+ "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
												+ "<p class=\"ui grey inverted header\">"
												+ file.name
												+ "</p>"
												+ "<a class=\"ui negative button\" href=\"#\" value=\""
												+ imgNum
												+ "\" onclick=\"deletePreview(this)\">"
												+ "Delete" + "</a>" + "</div>");
						files[imgNum] = file;
					}
				};
				reader.readAsDataURL(file);

			}
		} else
			alert("6개를 초과한 이미지를 올릴수는 없습니다."); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	}

	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(obj) {
		var imgNum = obj.attributes['value'].value;
		delete files[imgNum];
		$(".preview-box[value=" + imgNum + "]").remove();
	}

	//client-side validation
	//always server-side validation required
	function validation(fileName, size, count) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
			alert('오로지 jpg, gif, png의 형식의 파일만 업로드 가능합니다. ');
			return true;
		} else if (size > 2000000) {
			alert('크기가 2MB 미만의 이미지만 업로드 가능합니다. ');
			return true;
		} else if (count > 5) {
			alert("6개를 초과한 이미지를 올릴수는 없습니다.");
			return true;
		} else {
			return false;
		}
	}
	
	function updateComplete(){
		var imgNoList = [];
		var priviewNo = $("#previewNo")
		console.log(priviewNo);
		for(var input of priviewNo){
			console.log(input.value);
			imgNoList.push(input.value);
		}
		$("#imgNoList").val(imgNoList);
	}
</script>
<body>
	<div id='content' class="ui container">
		<br> <br> <br>
		<form id="uploadForm" action="/board/update/complete" method="post"
			enctype="multipart/form-data" class="ui form">

			<div class="field">
				<h3 class="ui dividing inverted header">Title</h3>
				<input name="bName" class="ui input" value="${param.bName}">
			</div>

			<div class="field">
				<h3 class="ui dividing inverted header">Text</h3>
				<textarea name="bContent">${param.bContent}</textarea>

			</div>

			<!-- 첨부 버튼 -->
			<div id="attach">
				<label class="ui button inverted labeled icon" for="uploadInputBox">
					<i class="upload icon"></i>Image Upload
				</label> <input id="uploadInputBox" style="display: none" type="file"
					name="filedata" multiple />
			</div>
			<br>
			<!-- 미리보기 영역 -->
			<div id="preview" class="content"></div>
			<c:forEach items="${imageVOList}" var="imageVO" varStatus="status">
				<div class="preview-box" value="${status.index}">
					<img class="thumbnail"
						src="src/main/resources/static/web/upload_images\\${imageVO.imgId}" />
					<p class="ui grey inverted header">${imageVO.imgName}</p>
					<a class="ui negative button" href="\#" value="${status.index}"
						onclick="deletePreview(this)"> Delete </a>
				</div>
				<input id="previewNo" value="${imageVO.imgNo}" style="display: none">
			</c:forEach>
			<input id="imgNoList" name="imgNoList" value="${imageVO.imgNo}"
				style="display: none"><input type="hidden" name="bNo"
				value="${param.bNo}" />
			<button class="ui purple button" onclick="updateComplete()">Save</button>
		</form>
	</div>
</body>
</html>