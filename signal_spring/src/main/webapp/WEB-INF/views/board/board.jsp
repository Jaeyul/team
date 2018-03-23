<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="ui container">
		<table class="ui definition table center aligned">
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
					<tr>
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
		<button class="ui button">
			<a href="/board/write">글쓰기 
		</button>
	</div>


</body>
</html>