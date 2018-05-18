<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	
	<title>现音中国-后台登录</title>
	
	<link href="${baseURL}/sources/css/login/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
	<div class="login">
		<div class="login-top">
			<h1>现音中国</h1>
			<form>
				<input type="text" id="account" placeholder="请输入账号">
				<input type="password" id="passwork" placeholder="请输入密码">
		    </form>
		    <div class="forgot">
		    	<input type="submit" value="登 录" onclick="login()">
		    </div>
		</div>
	</div>	
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
	<script type="text/javascript">	
	
		$(document).keypress(function(e) {  
		    //回车键事件  
		    if(e.which == 13) {  
		    	login();
		    }
		});
		
		function login() {
					   	
			var account = $("#account").val();
			var passwork = $("#passwork").val();	
			
			if(account == ''){
	        	alert("您忘记填写账户啦！");
	        	return false;
	        }			
			if(passwork == ''){
	        	alert("您忘记填写密码啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/login',
	   			data : {account : account, passwork : passwork},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					/* setTimeout(function() {
	   				        window.location.href = "${returnURL }";
	   				    },1); */
	   					window.location.href = baseURL + "/homepage";
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "login()");
	   					alert(result.msg);	   					
	   	 			}
	   			}
	   		});
		}	
	</script>  	
</body>
</html>