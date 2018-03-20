<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="/css/components/input.css" type="text/css">
<link rel="styleSheet" href="/css/components/button.css" type="text/css">
<link rel="styleSheet" href="/css/components/icon.css" type="text/css">
<link rel="styleSheet" href="/css/components/form.css" type="text/css">
<link rel="styleSheet" href="/css/components/container.css"
	type="text/css">
<script src="/js/adapter.js"></script>
<script src="/js/groupcall/conferenceroom.js"></script>
<script src="/js/groupcall/participant.js"></script>
<script src="/js/kurento-utils.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="wrapper">
			<div id="join" class="animate join">
				<h1>Join a Room</h1>
				<form onsubmit="register(); return false;" class="ui form"
					accept-charset="UTF-8">
					<div class="ui input">
						<input type="text" name="roomName" value="" id="roomName"
							placeholder="RoomName" required>
					</div>

					<div class="fifteen fields">
						<div class="field">
							<label>RoomSize</label><select name="roomSize" id="roomSize"
								class="ui fluid dropdown">
								<option>1/2</option>
								<option>1/3</option>
								<option>1/4</option>
								<option>1/5</option>
								<option>1/6</option>
							</select>
						</div>
					</div>

					<div class="ui input">
						<input type="text" name="RoomTag" value="" id="RoomTag"
							placeholder="RoomTag" required>
					</div>


					<p class="submit">
						<button class="ui secondary button" name="commit">Join!</button>
					</p>
				</form>
			</div>
			<div id="room" style="display: none;">
				<h2 id="room-header"></h2>
				<div id="participants"></div>
				<button class="ui secondary button" id="button-leave"
					onmouseup="leaveRoom();" value="Leave room"></button>
			</div>
		</div>
	</div>
</body>
</html>