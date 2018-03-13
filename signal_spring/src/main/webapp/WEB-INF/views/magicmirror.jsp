<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="shortcut icon" href="img/kurento.png" type="image/png" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/ekko-lightbox.css">
<link rel="stylesheet" href="css/democonsole-index.css">
<link rel="stylesheet" href="css/magicmirror/kurento.css">

<script src="js/jquery-3.3.1.js"></script>
<script src="js/ekko-lightbox.min.js"></script>
<script src="js/democonsole-index.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/adapter.js"></script>
<script src="js/magicmirror/index.js"></script>
<script src="js/kurento-utils.js"></script>
<title>Insert title here</title>
</head>
<body>

	<header>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse"></button>
					<a class="navbar-brand" href=".">Kurento Tutorial</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a
							href="https://github.com/Kurento/kurento-tutorial-java/tree/master/kurento-magic-mirror"><span
								class="glyphicon glyphicon-file"></span> Source Code</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="page-header">
			<h1>Tutorial 2: WebRTC Magic Mirror</h1>
			<p>
				This application shows a <i>WebRtcEndpoint</i> connected to itself
				(loopback) with a <i>FaceOverlay</i> filter in the middle (take a
				look to the <a href="img/pipeline.png" data-toggle="lightbox"
					data-title="Magic Mirror Media Pipeline"
					data-footer="WebRtcEnpoint in loopback with a filter (FaceOverlay)">Media
					Pipeline</a>). To run this demo follow these steps:
			</p>
			<ol>
				<li>Open this page with a browser compliant with WebRTC
					(Chrome, Firefox).</li>
				<li>Click on <i>Start</i> button.
				<li>Grant the access to the camera and microphone. After the
					SDP negotiation the loopback should start.
				<li>Click on <i>Stop</i> to finish the communication.
				</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-md-5">
				<h3>Local stream</h3>
				<video id="videoInput" autoplay width="480px" height="360px"
					poster="img/webrtc.png"></video>
			</div>
			<div class="col-md-2">
				<a id="start" href="#" class="btn btn-success"
					onclick="start(); return false;"><span
					class="glyphicon glyphicon-play"></span> Start</a><br /> <br /> <a
					id="stop" href="#" class="btn btn-danger"
					onclick="stop(); return false;"><span
					class="glyphicon glyphicon-stop"></span> Stop</a>
			</div>
			<div class="col-md-5">
				<h3>Remote stream</h3>
				<video id="videoOutput" autoplay width="480px" height="360px"
					poster="img/webrtc.png"></video>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<label class="control-label" for="console">Console</label><br>
				<br>
				<div id="console" class="democonsole">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="foot-fixed-bottom">
			<div class="container text-center">
				<hr />
				<div class="row">&copy; 2014-2015 Kurento</div>
				<div class="row">
					<div class="col-md-4">
						<a href="http://www.urjc.es"><img src="img/urjc.gif"
							alt="Universidad Rey Juan Carlos" height="50px" /></a>
					</div>
					<div class="col-md-4">
						<a href="http://www.kurento.org"><img src="img/kurento.png"
							alt="Kurento" height="50px" /></a>
					</div>
					<div class="col-md-4">
						<a href="http://www.naevatec.com"><img src="img/naevatec.png"
							alt="Naevatec" height="50px" /></a>
					</div>
				</div>
			</div>
		</div>
	</footer>



</body>
</html>