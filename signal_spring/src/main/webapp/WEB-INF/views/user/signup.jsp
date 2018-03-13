<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/components/visibility.js"></script>
<script src="js/components/sidebar.js"></script>
<script src="js/components/transition.js"></script>
<script src="js/components/form.js"></script>
  
<link rel="stylesheet" type="text/css" href="css/components/reset.css">
<link rel="stylesheet" type="text/css" href="css/components/site.css">
<link rel="stylesheet" type="text/css" href="css/components/container.css">
<link rel="stylesheet" type="text/css" href="css/components/grid.css">
<link rel="stylesheet" type="text/css" href="css/components/header.css">
<link rel="stylesheet" type="text/css" href="css/components/image.css">
<link rel="stylesheet" type="text/css" href="css/components/menu.css">
<link rel="stylesheet" type="text/css" href="css/components/divider.css">
<link rel="stylesheet" type="text/css" href="css/components/dropdown.css">
<link rel="stylesheet" type="text/css" href="csss/components/segment.css">

<link rel="stylesheet" type="text/css" href="css/components/form.css">
<link rel="stylesheet" type="text/css" href="css/components/list.css">
<link rel="stylesheet" type="text/css" href="css/components/icon.css">
<link rel="stylesheet" type="text/css" href="css/components/sidebar.css">
<link rel="stylesheet" type="text/css" href="css/components/transition.css">
<link rel="stylesheet" type="text/css" href="css/components/input.css">
<link rel="stylesheet" type="text/css" href="css/components/button.css">
<link rel="stylesheet" type="text/css" href="css/components/message.css">
<link rel="stylesheet" type="text/css" href="css/components/icon.css">



<head>


  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
 
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="img/favicon.png" class="image">
      <div class="content">
		Sign-Up
      </div>
    </h2>
    <form class="ui large form">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="email" placeholder="ID">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        <div class="ui fluid large teal submit button"> Sign-Up</div>
      </div>

      <div class="ui error message"></div>

    </form>
    
  </div>
</div>

</body>

</html>
    