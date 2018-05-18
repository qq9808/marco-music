<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>用户登录</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco_src.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
</head>
<body>

	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container">
	        <h3 class="search-header">Music Didn't Lie</h3>
	        <p class="search-tag-line">Music washes away from the soul the dust of everyday life．</p>	
	        <p class="search-tag-line">欢迎来到vita音乐！</p>	
	    </div>
	</div>

    <div class="page-container">
	    <div class="container">
		    <div class="row">
		        <div class="span12 page-content">			         		            
		            <div id="respond">
	                    <h3 style="margin-bottom: 0;">用户登录</h3>			                    		
                        <p class="comment-notes">欢迎登录，立即开始vita音乐之旅！</p>	
                        <div style="margin: auto;">
                            <span style="font-size: 1rem;">账号：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="account" type="text" class="span4 login-input" maxlength="15" placeholder="账号为6~15位，由字母和数字组成">
                        </div>
                        <div>
                            <span style="font-size: 1rem;">密码：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="password" type="password" class="span4 login-input" maxlength="20" placeholder="密码为6~20位，由字母和数字组成">
                        </div>
                        <div style="margin-top: 1rem;"> 
                        	<button id="submit" class="login-submit" onclick="login()">立即登录</button>
                        </div>		                           	                    	
		            </div>		            	            	            		            
		        </div>
		    </div>
	    </div>
    </div>

	<%@ include file="/WEB-INF/jsp/common/window.jsp"%>  
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%> 	 
		
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
	<script type="text/javascript">	
	
		$(document).keypress(function(e) {  
		    // 回车键事件  
		    if(e.which == 13) {  
		    	login();
		    }
		});
		
		function login() {
					   	
			var account = $("#account").val();
			var password = $("#password").val();	
						
			if(account == ''){
				showWindow("忘记填写账号啦！");
	        	return false;
	        }			
			if(password == ''){
	        	showWindow("忘记填写密码啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/login',
	   			data : {account : account, password : password},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					setTimeout(function() {
	   				        window.location.href = "${returnURL }";
	   				    },1); 
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "login()");
	   					showWindow(result.msg);	   					
	   	 			}
	   			}
	   		});
		}	
	</script>   
</body>
</html>