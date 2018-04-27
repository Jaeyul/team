<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css"> 
    .image {
    position: absolute;
	margin-left: -10px;
	margin-top: 50px;
	margin-bottom: -40px
    }
 
   
    }
  </style>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properties -->
<title>Homepage - Semantic</title>


<script>
	function goMap() {
		document.location.href = "map";
	}
</script>
</head>
<body>
	<div id='content' class="ui text container">
		
		<img class="ui image" src="/img/main.png">
		<div class="ui primary huge magenta button" onclick="goMap()">
			Let's Video Chat <i class="right arrow icon"></i>
		</div>
	</div>

	<div class="ui vertical stripe segment">
		<div class="ui middle aligned stackable grid container">
			<div class="row">
				<div class="eight wide column">
					<p><h3 class="ui header">Enjoy meeting with your good Friends!</h3></p>
					<p><h3 class="ui header">Make a new relationship with Tippler!</h3></p>
				</div>
				<div class="six wide right floated column">
					<img style="float: right;" src="/img/liquor.jpg"
						class="ui large bordered rounded image">
				</div>
			</div>
			
		</div>
	</div>

	<div class="ui inverted vertical footer segment">
		<div class="ui container">
			<div
				class="ui stackable inverted divided equal height stackable grid">
				<div class="three wide column">
					<h4 class="ui inverted header">Services</h4>
					<div class="ui inverted link list">
						<a href="/map" class="item">Regional Chat</a>
					</div>
				</div>
				<div class="three wide column">
					<h4 class="ui inverted header">Board</h4>
					<div class="ui inverted link list">
						<a href="/board?page=1&block=1" class="item">Free-Bulletin-Board</a>
					</div>
				</div>
				<div class="seven wide column">
					<h4 class="ui inverted header">Content Us</h4>
					<p>Manager Email : showmethefrank@gmail.com</p>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
