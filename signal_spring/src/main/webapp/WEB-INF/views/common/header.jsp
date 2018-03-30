<%@page import="com.iot.test.vo.UserInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
String uri = request.getRequestURI();
UserInfoVO user = (UserInfoVO)session.getAttribute("user");
if(uri.indexOf("login")==-1 && uri.indexOf("signup")==-1 && user==null){
	response.sendRedirect("/login");
}
%>



<style type="text/css">
.hidden.menu {
	display: none;
}

.masthead.segment {
	min-height: 700px;
	padding: 1em 0em;
}

.masthead .logo.item img {
	margin-right: 1em;
}

.masthead .ui.menu .ui.button {
	margin-left: 0.5em;
}

.masthead h1.ui.header {
	margin-top: 3em;
	margin-bottom: 0em;
	font-size: 4em;
	font-weight: normal;
}

.masthead h2 {
	font-size: 1.7em;
	font-weight: normal;
}

.ui.vertical.stripe {
	padding: 8em 0em;
}

.ui.vertical.stripe h3 {
	font-size: 2em;
}

.ui.vertical.stripe .button+h3, .ui.vertical.stripe p+h3 {
	margin-top: 3em;
}

.ui.vertical.stripe .floated.image {
	clear: both;
}

.ui.vertical.stripe p {
	font-size: 1.33em;
}

.ui.vertical.stripe .horizontal.divider {
	margin: 3em 0em;
}

.quote.stripe.segment {
	padding: 0em;
}

.quote.stripe.segment .grid .column {
	padding-top: 5em;
	padding-bottom: 5em;
}

.footer.segment {
	padding: 5em 0em;
}

.secondary.pointing.menu .toc.item {
	display: none;
}

@media only screen and (max-width: 700px) {
	.ui.fixed.menu {
		display: none !important;
	}
	.secondary.pointing.menu .item, .secondary.pointing.menu .menu {
		display: none;
	}
	.secondary.pointing.menu .toc.item {
		display: block;
	}
	.masthead.segment {
		min-height: 350px;
	}
	.masthead h1.ui.header {
		font-size: 2em;
		margin-top: 1.5em;
	}
	.masthead h2 {
		margin-top: 0.5em;
		font-size: 1.5em;
	}
}
</style>
<script>
	$(document).ready(function() {
		
		/* $('.ui.accordion')
		  .accordion();
		*/
		$('.ui.inverted.dropdown.button').dropdown();
 

 
		// fix menu when passed
		$('.masthead').visibility({
			once : false,
			onBottomPassed : function() {
				$('.fixed.menu').transition('fade in');
			},
			onBottomPassedReverse : function() {
				$('.fixed.menu').transition('fade out');
			}
		});		

		// create sidebar and attach to menu open
		$('.ui.sidebar').sidebar('attach events', '.toc.item');

		$('#content').appendTo('#headerContent');
		$('.vertical').appendTo('.pusher');
		
		var page = window.location.pathname;
		for(var menuA of $('.ui.menu a')){
			var text = menuA.text.toLowerCase();
			if(page.indexOf(text)!=-1){
				$("a[href='/"+text+"'").addClass('active');
			}		
		};
		
		for(var dropBt of $("#dropBt div.item")){
			var forWrite = dropBt.innerText;	
			var inText = dropBt.innerText;				
			if(inText.indexOf(" ")!=-1){
				inText = inText.replace(" ","");			
			} 
			inText = inText.toLowerCase();
			if(page.indexOf(inText)!=-1){
				$("#myPageBt").html(forWrite);
			}	
			
			
			
		}
		
		
		
	});
	
	
</script>
<body>

	<!-- Following Menu -->
	<div id='headerMenu' class="ui large top fixed hidden menu">
		<div class="ui container">
			<a href="/home" class="item">Home</a> <a href="/map" class="item">Map</a>
			<a href="/random" class="item">Random</a> <a href="/board"
				class="item">Board</a>
			<div class="right menu">
				<div class="item">
					<a class="ui button">Log in</a>
				</div>
				<div class="item">
					<a class="ui primary button">Sign Up</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Sidebar Menu -->
	<div id="headerMenu" class="ui vertical inverted sidebar menu">
		<a href="/home" class="item">Home</a> <a href="/map" class="item">Map</a>
		<a href="/random" class="item">Random</a> <a href="/board"
			class="item">Board</a> <a href="${(Log=='login')? '/login':'/user/logout'}" class="item">${(Log=='login')?'Login':'Logout'}</a> <a
			href="/signup" class="item">Signup</a>
	</div>
	<!-- Page Contents -->
	<div class='pusher'>
		<div id="headerContent"
			class="ui inverted vertical masthead center aligned segment"
			style="background-image: url('/img/purple.jpg')">
			<div class="ui container">
				<div id='headerMenu'
					class="ui large secondary inverted pointing menu"
					style="border-style: none">
					<a class="toc item"> <i class="sidebar icon"></i>
					</a> <a href="/home" class="item">Home</a> <a href="/map" class="item">Map</a>
					<a href="/random" class="item">Random</a> <a href="/board"
						class="item">Board</a>
					<div class="right item">
						<a href="${(Log=='login')? '/login':'/user/logout'}" class="ui inverted button">${(Log=='login')?'Log in':'Log out'}</a> 
						<a href="/signup" class="ui inverted button" style="display:${(Log=='login')?'':'none'}">Sign up</a>	
												
						<div id="myPage" class="ui inverted dropdown button" style="display:${(Log=='login')?'none':''};">
							<div class="text" id="myPageBt">My Page</div>
							<div class="menu" id="dropBt">
								<div class="item">My Profile</div>
								<div class="item" >My Friends</div>
								<div class="item">My Post</div>
								<div class="item">History</div>
							</div>							
						</div>	
						
						
					</div>	
				</div>
			</div>
		</div>
	</div>
</body>


</html>