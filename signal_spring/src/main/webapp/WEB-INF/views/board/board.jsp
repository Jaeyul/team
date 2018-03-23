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
	<table class="ui five column table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회</th>
				<th>추천</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>John</td>
				<td>Approved</td>
				<td>22</td>
				<td>Male</td>
				<td>None</td>
			</tr>
			<tr>
				<td>Jamie</td>
				<td>Approved</td>
				<td>32</td>
				<td>Male</td>
				<td>Requires call</td>
			</tr>
			<tr>
				<td>Jill</td>
				<td>Denied</td>
				<td>22</td>
				<td>Female</td>
				<td>None</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>3 People</th>
				<th>2 Approved</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</tfoot>
	</table>
	<button>
		<a href="/board/write">글쓰기
	</button>

</body>
</html>