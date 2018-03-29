<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bulletin_Board</title>
</head>
<script>
	function goPost(id) {
		$('#putData').val(id);
		$('#form').submit();
	}
</script>
<body>
	<div id='content' class="ui container">
		<br> <br>
		<table class="ui selectable padded table center aligned">
			<thead>
				<tr>
					<th class="one wide">번호</th>
					<th class="six wide">제목</th>
					<th class="one wide center">글쓴이</th>
					<th class="two wide">날짜</th>
					<th class="one wide">조회</th>
					<th class="one wide">추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="post">
					<tr id="${post.bNo}" onclick='goPost(id)' style='cursor: pointer'>
						<td>${post.bNo}</td>
						<td>${post.bName}</td>
						<td>${post.uiId}</td>
						<td>${post.bRegDate}</td>
						<td>${post.bHit}</td>
						<td>${post.bRecom}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<a href="/board/write" class='ui labeled Inverted button icon'><i class="pencil alternate icon"> </i>Write</a>
	</div>
	<form id='form' action='/board/post' style="display:none">
		<input id='putData' name='bNo' type='hidden' />
	</form>
</body>
</html>