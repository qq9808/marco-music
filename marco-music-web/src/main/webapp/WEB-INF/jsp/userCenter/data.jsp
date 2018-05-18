<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="in-div1" class="page-container in-div in-active">
	<div class="container">
    	<div class="row">
        	<div class="span12 page-content">	
            	<div id="respond">
	                <div>
	                	<span style="font-size: 1rem;">昵称：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input id="nickname" type="text" class="span4 data-input" maxlength="15" placeholder="必填项，长度为1~15位" value="${user.nickname }">
	                </div>
	                <div style="margin: 0.5rem auto;">
	                	<span style="font-size: 1rem;">性别：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input type="radio" name="sex" value="1" <c:if test="${user.sex eq 1 }">checked</c:if>> 男生 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="2" <c:if test="${user.sex eq 2 }">checked</c:if>> 女生
	                </div>
	                <div>
	                	<span style="font-size: 1rem;">手机号码：</span> &nbsp;&nbsp;
	                    <input id="phone" type="text" class="span4 data-input" maxlength="15" placeholder="必填项，长度为11位" value="${user.phone }">
	                </div>
	                <div>
	                	<span style="font-size: 1rem;">邮箱：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input id="email" type="text" class="span4 data-input" maxlength="100" placeholder="必填项，用于找回密码" value="${user.email }">
	                </div>
	                <div>
	                	<span style="font-size: 1rem;">地区：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input id="province" type="text" class="span4 data-input2" maxlength="10" value="${user.province }" />省 &nbsp;
						<input id="city" type="text" class="span4 data-input2" maxlength="10" value="${user.city }" />市
	                </div>
                    <div class="submit-div"> 
                    	<button id="submit" class="forum-submit" onclick="save()">保存修改</button>
                    </div>	                     	                           	                    	
            	</div>	
        	</div>
    	</div>
	</div>
</div> 

<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">	
											
	function save() {
	   	
		var nickname = $("#nickname").val();
		var sex = $("input:radio:checked").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		var province = $("#province").val();
		var city = $("#city").val();
						
		if(nickname == ''){
        	showWindow("起一个好听的昵称吧!");
        	return false;
        }			
		if(email == ''){
			showWindow("邮箱也是必须要填写的哦！");
        	return false;
        }
					
		$("#submit").removeAttr("onclick");
		
		$.ajax({
   			type : 'POST',
   			url : '${baseURL}/user/info/save',
   			data : {nickname : nickname, sex : sex, phone : phone, email : email, province : province, city : city},     	
   			dataType : 'json',
   			success : function(result) {
   				
   				if(result.state == 200) { 					
   					showWindow("保存成功！");
   					setTimeout(function() {
   						window.location.reload();
   				    }, 2500);	   					
   	 		  	}
   				else{	  
   					$("#submit").attr("onclick", "save()");
   					showWindow(result.msg);	   					
   	 			}
   			}
   		});
	}
					
</script>   

