<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="content">
<br><br><br><br><br><br>

<div class="ui link cards">
<c:forEach items="${fList}" var="fMap">	
	 <div class="card">
    <div class="image">
    </div>
    <div class="content">
      <div class="header">${fMap.fName}</div>
      <div class="meta">
        <a>${fMap.fId}</a>
      </div>
      <div class="description">
        ${fMap.fComment}
      </div>
    </div>
    <div class="extra content">
      <span class="right floated">
        
      </span>
      <span>
        <i class="user icon"></i>
       
      </span>
    </div>
  </div>
			
</c:forEach>  
</div>


<c:forEach items="${callList}" var="callMap">
<input type="button" value=${callMap.uiId }>
</c:forEach>	

</div>


</body>
</html>