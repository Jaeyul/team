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
<link rel="stylesheet" href="css/one2one/kurento.css">

<script src="js/jquery-3.3.1.js"></script>
<script src="js/ekko-lightbox.min.js"></script>
<script src="js/democonsole-index.js"></script>
<script src="js/draggabilly.pkgd.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/adapter.js"></script>
<script src="js/one2one/index.js"></script>
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
							href="https://github.com/Kurento/kurento-tutorial-java/tree/master/kurento-one2one-call"><span
								class="glyphicon glyphicon-file"></span> Source Code</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="page-header">
			<h1>Tutorial 4: Video Call 1 to 1 with WebRTC</h1>
			<p>
				This web application consists on an one to one video call using <a
					href="http://www.webrtc.org/">WebRTC</a>. In other words, this
				application is similar to a phone but also with video. The <a
					href="img/pipeline.png" data-toggle="lightbox"
					data-title="Video Call 1 to 1 Media Pipeline"
					data-footer="Two interconnected WebRtcEnpoints Media Elements">Media
					Pipeline</a> is composed by two interconnected <i>WebRtcEndpoints</i>.
				To run this demo follow these steps:
			</p>
			<ol>
				<li>Open this page with a browser compliant with WebRTC
					(Chrome, Firefox).</li>
				<li>Type a nick in the field <i>Name</i> and click on <i>Register</i>.
				</li>
				<li>In a different machine (or a different tab in the same
					browser) follow the same procedure to register another user.</li>
				<li>Type the name of the user to be called in the field <i>Peer</i>
					and click <i>Call</i>.
				</li>
				<li>Grant the access to the camera and microphone for both
					users. After the SDP negotiation the communication should start.</li>
				<li>The called user should accept the incoming call (by a
					confirmation dialog).</li>
				<li>Click on <i>Stop</i> to finish the communication.
				</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-md-5">
				<label class="control-label" for="name">Name</label>
				<div class="row">
					<div class="col-md-6">
						<input id="name" name="name" class="form-control" type="text"
							onkeydown="if (event.keyCode == 13) register();" />
					</div>
					<div class="col-md-6 text-right">
						<a id="register" href="#" class="btn btn-primary"><span
							class="glyphicon glyphicon-plus"></span> Register</a>
					</div>
				</div>

				<br /> <br /> <label class="control-label" for="peer">Peer</label>
				<div class="row">
					<div class="col-md-6">
						<input id="peer" name="peer" class="form-control" type="text"
							onkeydown="if (event.keyCode == 13) call();">
					</div>
					<div class="col-md-6 text-right">
						<a id="call" href="#" class="btn btn-success"><span
							class="glyphicon glyphicon-play"></span> Call</a> <a id="terminate"
							href="#" class="btn btn-danger"><span
							class="glyphicon glyphicon-stop"></span> Stop</a>
					</div>
				</div>
				<br /> <label class="control-label" for="console">Console</label><br>
				<br>
				<div id="console" class="democonsole">
					<ul></ul>
				</div>
			</div>
			<div class="col-md-7">
				<div id="videoBig">
					<video id="videoOutput" autoplay width="640px" height="480px"
						poster="img/webrtc.png"></video>
				</div>
				<div id="videoSmall">
					<video id="videoInput" autoplay width="240px" height="180px"
						poster="img/webrtc.png"></video>
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