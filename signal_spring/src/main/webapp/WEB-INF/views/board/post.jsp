<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${boardVO.bName}</title>
</head>
<script>
	function updateCall(res) {
		alert("Update Complete");
		location.href = "/board";
	}
	
	function deleteCall(res) {
		alert("Delete Complete");
		location.href = "/board";
	}
	
	function updateBoard(bNo, imgId) {
		var param = {
			bNo : bNo,
			imgId : imgId
		};
		var ajax = new AjaxUtil("/board/update", param);
		ajax.send(updateCall);
	}
	
	function deleteBoard(bNo, imgId) {
		var param = {
			bNo : bNo,
			imgId : imgId
		};
		var ajax = new AjaxUtil("/board/delete", param);
		ajax.send(deleteCall);
	}
	
</script>
<link href='https://fonts.googleapis.com/css?family=Faustina'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Fjalla One'
	rel='stylesheet'>
<style>
body p {
	font-family: 'Faustina';
	font-size: 22px;
}

h1 h2 h3 h4 {
	font-family: 'Fjalla One';
}
</style>
<body>
	<div id='content' class="ui segment">
		<h2 style='font-family: Fjalla one;'
			class="title ui left floated header">Title : ${boardVO.bName}</h2>
		<h4 class="ui right floated header" style="margin-top: 7px">
			<i class="user circle icon"></i>Writer : ${boardVO.uiId}
		</h4>
		<c:if test="${loginUiId == boardVO.uiId}">
			<button id="delete"
				class="title ui right floated negative labeled button icon"
				onclick="deleteBoard('${boardVO.bNo}','${imageVO.imgId}')">
				<i class="trash alternate icon"></i>Delete
			</button>
			<button id="update"
				class="ui right floated basic labeled top attached button icon"
				onclick="updateBoard('${boardVO.bNo}','${imageVO.imgId}')">
				<i class="edit outline alternate icon"></i>Update
			</button>
		</c:if>
		<div class="ui clearing divider"></div>
		<img class="ui spaced image" src="/web/upload_images/${imageVO.imgId}">
		<p>${boardVO.bContent}</p>
	</div>

</body>



</html>