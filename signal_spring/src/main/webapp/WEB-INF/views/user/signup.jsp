<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %> 
<!DOCTYPE html>
<html>
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
<div id="content">
<br><br><br><br><br>
<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
     	Sign-up
      <img src="/img/favicon.png" class="image">
    </h2>
    
    
    <form class="ui large form">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="uiId" placeholder="ID">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="uiPwd" placeholder="Password">
          </div>
         </div>
         <div class="field">
          <div class="ui left icon input">
            <i class="user circle icon"></i>
            <input type="text" name="uiNickName" placeholder="Nickname">
          </div>          
         </div>
         
         <div class="field">
          <div class="ui left icon input">
            <i class="at icon"></i>
            <input type="text" name="uiEmail" placeholder="Email">
          </div>          
         </div>
        
        <div class="ui fluid large teal submit button"> Sign-Up</div>
      </div>
      <div class="ui error message"></div>
    </form>
  </div>
</div>
</div>
</body>

</html>
    