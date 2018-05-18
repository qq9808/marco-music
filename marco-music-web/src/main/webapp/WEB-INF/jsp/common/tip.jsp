<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tip-div" class="tip-style">
	<p>有<span id="tip-num"></span>新的动态！</p>
	<a href="javascript:void(0)" onclick="check()">查看</a> &nbsp;
	<a href="javascript:void(0)" onclick="ignore()">忽略</a>
</div>

<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery.min.js"></script>
<script type="text/javascript">

	$(function() { 
		
		var user = "${user}";
		if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
			console.log("用户未登录");
			return false;
		}
		
		var ignore = window.sessionStorage.getItem("ignore");
		
		if(typeof(ignore) == "undefined" || ignore == null || ignore == "" || ignore == "null") {
			console.log("继续查询");
		}
		else if(ignore == 1) {
			console.log("ignore == 1");
			return false;
		}
		
		setTimeout(function() {
			$.ajax({
	 			type : 'POST',
	 			url : '${baseURL}/notice/check',
	 			data : {},     	
	 			dataType : 'json',
	 			success : function(result) {
	 				
	 				if(result.state == 200) { 					
	 					if(result.num == 0) {
	 						console.log("没有新的动态");
	 					}	   	
	 					else {
	 						var text = result.num + "条";
	 						$('#tip-num').html(text);
	 						$('#tip-div').addClass('show');
	 					}
	 	 		  	}
	 				else{	  
	 					console.log("查询动态失败！");  					
	 	 			}
	 			}
	 		});
	    },3500);						
	});	  
	
	function check() {
		window.sessionStorage.setItem("autoClick", 1);
		window.location.href = "${baseURL}/user/page";	
	}
	
	function ignore() {
		window.sessionStorage.setItem("ignore", 1);
		$("#tip-div").removeClass("show");		
	}
	
</script> 