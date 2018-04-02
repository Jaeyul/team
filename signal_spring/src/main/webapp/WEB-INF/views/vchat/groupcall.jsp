<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="/css/groupcall/style.css" type="text/css" media="screen">
<script src="/js/jquery-3.3.1.js"></script>
<script src="/js/adapter.js"></script>
<script src="/js/groupcall/conferenceroom.js"></script>
<script src="/js/groupcall/participant.js"></script>
<script src="/js/kurento-utils.js"></script>

<title>Insert title here</title>
<style>

.chatSpace {
  position: absolute;
  top: 60%;
  left: 51%; 
  width: 570px;
}


</style>



</head>
<body onload="register()">
<div id="container">
		<div id="wrapper">
			
			<div id="room" style="display: none;">
				<h2 id="room-header"></h2>
				<div id="participants"></div>
				<input type="button" id="button-leave" onmouseup="leaveRoom();"	value="Leave room">
			</div>
		</div>
		
		
		<div id="chatSpace" class="chatSpace" >
				<fieldset>
			        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
			        <br/>			        
			        <input id="inputMessage" type="text"/>
			        <input type="submit" value="send" onclick="send()" />
			    </fieldset>					
		</div>
		
		<input type="hidden" id="rName" value=${rName }>
		<input type="hidden" id="uiId" value=${uiId }>
		<input type="hidden" id="uiNickName" value=${uiNickName }>
		
		<script type="text/javascript">
		
        var textarea = document.getElementById("messageWindow");      
        var inputMessage = document.getElementById('inputMessage');
        var uiId = document.getElementById('uiId');
        var uiNickName = document.getElementById('uiNickName');
        var roomName = document.getElementById('rName');
        
	    ws.onerror = function(event) {
	      onError(event)
	    };
	    
	    ws.onopen = function(event) {
	      onOpen(event)
	    };
	    
	    function onOpen(event) {
	        textarea.value += "연결 성공\n";
	        var msg = {"id": "sendMessage", "uiId": uiId.value, "name": roomName.value, "uiNickName": uiNickName.value, "msg": uiNickName.value+"님께서 입장하셨습니다." };
	        ws.send(JSON.stringify(msg));
	    }
	    
	    function onError(event) {
	      alert(event.data);
	    }
	    
	    function send() {	       
	        var msg = {"id": "sendMessage", "uiId": uiId.value, "name": roomName.value, "uiNickName": uiNickName.value, "msg": inputMessage.value };
	        ws.send(JSON.stringify(msg));
	        inputMessage.value = "";
	    }
		</script>
					
	</div>
	
	
</body>
</html>