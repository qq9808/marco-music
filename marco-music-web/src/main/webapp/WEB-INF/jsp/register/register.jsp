<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>用户注册</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.css" />
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
	                    <h3 style="margin-bottom: 0; color: #edc756;">用户注册</h3>			                    		
	                    <p class="comment-notes">欢迎注册，我们期待您的加入！</p>	
                        <div style="margin: auto;">
                            <span style="font-size: 1rem;">账号：</span> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="account" type="text" class="span4 login-input" maxlength="15" placeholder="账号为6~15位，由字母和数字组成">
                        </div>
                        <div>
                            <span style="font-size: 1rem;">密码：</span> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="password" type="password" class="span4 login-input" maxlength="20" placeholder="密码为6~20位，由字母和数字组成">
                        </div>
                        <div>
                            <span style="font-size: 1rem;">重复密码：</span> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="check_password" type="password" class="span4 login-input" maxlength="20" placeholder="请重复输入您的密码">
                        </div>
                        <div>
                            <span style="font-size: 1rem;">昵称：</span> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="nickname" type="text" class="span4 login-input" maxlength="15" placeholder="昵称长度在1~15个字符之间">
                        </div>
                        <div>
                            <span style="font-size: 1rem;">邮箱：</span> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="email" type="text" class="span4 login-input" maxlength="50" placeholder="邮箱用于找回密码">
                        </div>
                        <div style="margin-top: 1rem;"> 
                        	<button id="submit" class="login-submit" onclick="register()">立即注册</button>
                        </div>		                           	                    	
            		</div>	
            	</div>
        	</div>
    	</div>
    </div>
	
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
	<%@ include file="/WEB-INF/jsp/common/window.jsp"%>  
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>  
	
	<script type="text/javascript">	
		
		function register() {
					   	
			var account = $("#account").val();
			var password = $("#password").val();
			var checkPassword = $("#check_password").val();
			var nickname = $("#nickname").val();
			var email = $("#email").val();
			
			if(account == ''){
	        	showWindow("忘记填写账号啦！");
	        	return false;
	        }
			if(account.length < 6 || account.length > 15) {
				showWindow("账号的长度在6~15之间哦！");
	        	return false;
			}
			if(password == ''){
				showWindow("忘记填写密码啦！");
	        	return false;
	        }
			if(password.length < 6 || password.length > 20) {
				showWindow("密码的长度在6~20之间哦！");
	        	return false;
			}
			if(password != checkPassword){
				showWindow("两次输入的密码不一致，请重新输入");
	        	return false;
	        }
			if(nickname == ''){
				showWindow("昵称也是要输入的哦！");
	        	return false;
	        }
			if(nickname.length < 1 || nickname.length > 15) {
				showWindow("昵称的长度在1~15之间哦！");
	        	return false;
			}
			if(email == ''){
				showWindow("邮箱也是要输入的哦！");
	        	return false;
	        }
			
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/register/save',
	   			data : {account : account, password : password, nickname : nickname, email : email},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200){
	   					showWindow('注册成功啦，欢迎加入现音中国！');  					
	   					setTimeout(function(){
	   				        window.location.href = "${returnURL }";
	   				    },2500);
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "register()");
	   					showWindow(result.msg);	   					
	   	 			}
	   			}
	   		});
		}	
	</script>   
</body>
</html>