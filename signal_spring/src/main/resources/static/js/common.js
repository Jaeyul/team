
var AjaxUtil = function (url, params, type, dataType){
	
	this.url = url;
	this.type = type?type:"POST";
	this.dataType = dataType?dataType:"json";
		
	this.send = function(callback){
		if(callback){
			this.callbackSuccess = callback;
		}
		$.ajax({ 
	        type     : this.type
	    ,   url      : this.url
	    ,   dataType : this.dataType 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,  data : encodeURIComponent(this.param)
	    ,  success : this.callbackSuccess
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+xhr.responseText);
		},
		done : function(e) {
		}
		});
	}
}



