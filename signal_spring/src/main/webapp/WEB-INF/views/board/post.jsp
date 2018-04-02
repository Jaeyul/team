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
	function goUpdateBoard() {
		$("#goUpdate").click();
	}
	
	function commentCall() {
		location.reload(true);
	}
	
	function deleteCall(res) {
		alert("Delete Complete");
		location.href = "/board";
	}
	
	function reconmmandCall(res){
		if(res.msg){
			alert(res.msg);
		}
	}

	function deleteBoard(bNo) {
		var param = {
			bNo : bNo
		};
		var ajax = new AjaxUtil("/board/delete", param);
		ajax.send(deleteCall);
	}

	function addComment(bNo, uiNickName) {
		var bcText = $("#commentText").text();
		var param = {
			bNo : bNo,
			bcText : bcText,
			uiNickName : uiNickName
		};
		var ajax = new AjaxUtil("/board/comment", param);
		ajax.send(commentCall);
	}
	
	function thumbsUp(bNo,uiNo){
		var param = {
			bNo : bNo,
			uiNo : uiNo
		};
		var ajax = new AjaxUtil("/board/reconmmand", param);
		ajax.send(reconmmandCall);
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
		<h4 id="bNo" style='font-family: Fjalla one;'
			class="title ui left floated purple header">Number :
			${boardVO.bNo}</h4>
		<h2 style='font-family: Fjalla one;'
			class="title ui left floated header">Title : ${boardVO.bName}</h2>
		<h4 class="ui right floated header">
			<i class="user circle icon"></i>Writer : ${boardVO.uiId}
		</h4>
		<c:if test="${loginUiId == boardVO.uiId}">
			<button id="delete"
				class="title ui right floated negative labeled button icon"
				onclick="deleteBoard('${boardVO.bNo}')">
				<i class="trash alternate icon"></i>Delete
			</button>
			<button id="update"
				class="ui right floated basic labeled top attached button icon"
				onclick="goUpdateBoard()">
				<i class="edit outline alternate icon"></i>Update
			</button>
		</c:if>

		<div class="ui clearing divider"></div>

		<c:forEach items="${imageVOList}" var="imageVO">
			<img class="ui spaced image"
				src="/web/upload_images/${imageVO.imgId}">
		</c:forEach>

		<p>${boardVO.bContent}</p>
		<br>
		<br>
		<button class="ui labeled basic button icon" onclick="thumbsUp('${boardVO.bNo}','${UserInfoVO.uiNo}')">
			<i class="thumbs up outline icon"></i>Thumbs Up
		</button>
		<button class="ui labeled inverted yellow button icon" onclick="boardExpose()">
			<i class="exclamation icon"></i>Expose
		</button>
	</div>
	<form action="/board/update" method="post"
		enctype="multipart/form-data" style="display: none">
		<input name="bNo" value="${boardVO.bNo}" /><input name="bName"
			value="${boardVO.bName}" /><input name="bContent"
			value="${boardVO.bContent}" />
		<button id="goUpdate"></button>
	</form>

	<div id='content' class="ui segment">
		<div class="ui comments">
			<h3 class="ui dividing header">Comments</h3>
			<c:if test="${comentList}!=NULL">
				<c:forEach items="${comentList}" var="comment">
					<div class="comment">
						<a class="ui avatar threaded image"> <img
							src="/img/basic_user.png">
						</a>
						<div class="content">
							<a class="author">nickName</a>
							<div class="metadata">
								<span class="date">${comment.bcRegDate}</span>
							</div>
							<div class="text">${comment.bcText}</div>
							<div class="actions">
								<a class="reply">Reply</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>

		<div class="ui reply form">
			<div class="field">
				<textarea id="commentText"></textarea>
			</div>
			<button id="addComment" class="ui blue labeled submit icon button"
				onclick="addComment('${boardVO.bNo}','${uiNickName}')">
				<i class="icon edit"></i> Add Reply
			</button>
		</div>
	</div>

</body>



</html>