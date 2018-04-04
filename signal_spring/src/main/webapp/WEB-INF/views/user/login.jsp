<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>


<style type="text/css">
body {
	background-size: cover;
}

body>.grid {
	height: 100%;
}

.image {
	position: absolute;
	margin-top: 40px;
	margin-left: 20px;
	margin-bottom: -40px;
}

.column {
	max-width: 450px;
}
</style>

<script>
/* 	function login() {
		var uiId = document.getElementById("uiId").value;
		var uiPwd = document.getElementById("uiPwd").value;
		var param = {
			uiId : uiId,
			uiPwd : uiPwd
		};		
		var au = new AjaxUtil("/user/login", param, null, "post");
		au.send(test);
		function test(res) {
			alert(res.msg);
			if(res.biz){
				document.location.href="/home";
			}
		}
	} */
	
	function login() {
		var uiId = document.getElementById("uiId").value;
		var uiPwd = document.getElementById("uiPwd").value;
		var param = {
			uiId : uiId,
			uiPwd : uiPwd
		};
		var au = new AjaxUtil("/user/login", param, null, "post");
		au.send(test);
		function test(res) {
			alert(res.msg);
			if (res.biz) {
				document.location.href = "/home";
			}
		}
	}	
</script>
</head>
<body>
<!-- <div id="content">
<br><br><br><br><br>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui pink image header">
				
				<div class="content">Log-in to your account</div>
			</h2>

			<div class="ui large form">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i> <input type="text" name="email"
								placeholder="ID" id="uiId">
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="lock icon"></i> <input type="password" name="password"
								placeholder="Password" id="uiPwd">
						</div>
					</div>
					<div class="ui fluid large pink button" onclick="login()">Login</div>
				</div>
				<div class="ui error message"></div>
			</div>

			<div class="ui message">
				<a href="/signup">Sign Up</a>
			</div>
		</div>
	</div>	
</div> -->

<div id="content">

		<div class="ui middle aligned center aligned grid">
			<div class="column">
		
				<img class="ui image" src="/img/tippler2.png" >
			
				<div class="ui large form">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="email"
									placeholder="ID" id="uiId">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password" name="password"
									placeholder="Password" id="uiPwd">
							</div>
						</div>
						<div class="ui fluid large magenta button" onclick="login()"><h3 class="ui inverted header">Login</h3></div>
					</div>
					<div class="ui error message"></div>
				</div>

				<div class="ui message">
					<a href="/signup">Sign Up</a>
				</div>
			</div>
		</div>
	</div>




</body>

</html>
