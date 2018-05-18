<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="in-div4" class="page-container in-div">
	<div class="container">
    	<div class="row">
        	<div class="span12 page-content">       	
        		<ul class="tabs-nav">
                    <li id="dt-title1" class="dt-title active" onclick="changeDT('1')"><a href="javascript:void(0)">未读</a></li>
                    <li id="dt-title2" class="dt-title" onclick="changeDT('2')"><a href="javascript:void(0)">已读</a></li>	 
                    <li id="dt3" onclick="ignore()" style="float: right;"><a href="javascript:void(0)">忽略全部</a></li>	                    
                </ul>
                <div class="tabs-container">
	                <div id="dt-content1" class="tab-content tab-show dt-content dt-show">
				   		<ul id="dt-ul1" class="ul-style">		    		
				        </ul>			    	
			        </div>	
				    <div id="dt-content2" class="tab-content tab-close dt-content">
				    	<ul id="dt-ul2" class="ul-style">		    		
				    	</ul>		    	
				    </div>     	                    
	        	</div>	          	
        	</div>
    	</div>
	</div>
</div> 

<script type="text/javascript">	

	function changeDT(index) {
		
		if(index == 1) {
			$('#dt1').addClass('active');
			$('#dt2').removeClass('active');
			$('#dt-content1').removeClass('tab-close');
			$('#dt-content1').addClass('tab-show');
			$('#dt-content2').removeClass('tab-show');
			$('#dt-content2').addClass('tab-close');
		}
		if(index == 2) {
			$('#dt2').addClass('active');
			$('#dt1').removeClass('active');
			$('#dt-content2').removeClass('tab-close');
			$('#dt-content2').addClass('tab-show');
			$('#dt-content1').removeClass('tab-show');
			$('#dt-content1').addClass('tab-close');
		}			
		
		$('.dt-title').removeClass('active');
		$('#dt-title' + index).addClass('active');
		
		$('.dt-content').removeClass('dt-show');
		$('#dt-content' + index).addClass('dt-show');
	}
	
	function read(noticeID, eventID, type) {
			
		if(noticeID == null || eventID == null || type == null) {
			if(type == 1) {
					window.location.href = "${baseURL}/feedback/page";
				}
				else if(type == 2) {
					window.location.href = "${baseURL}/singing/detail?id=" + eventID;
				}
				else if(type == 3) {
					window.location.href = "${baseURL}/singing/detail?id=" + eventID;
				}
				else if(type == 4) {
					window.location.href = "${baseURL}/forum/detail?id=" + eventID;
				}
				else if(type == 5) {
					window.location.href = "${baseURL}/forum/detail?id=" + eventID;
				}
		}
		
		$.ajax({
 			type : 'POST',
 			url : '${baseURL}/notice/read',
 			data : {
 				noticeID : noticeID
 			},     	
 			dataType : 'json',			
 			complete: function(XMLHttpRequest, textStatus) {
 				if(type == 1) {
 					window.location.href = "${baseURL}/feedback/page";
 				}
 				else if(type == 2) {
 					window.location.href = "${baseURL}/singing/detail?id=" + eventID;
 				}
 				else if(type == 3) {
 					window.location.href = "${baseURL}/singing/detail?id=" + eventID;
 				}
 				else if(type == 4) {
 					window.location.href = "${baseURL}/forum/detail?id=" + eventID;
 				}
 				else if(type == 5) {
 					window.location.href = "${baseURL}/forum/detail?id=" + eventID;
 				}
			}
 		});			
	}
	
	function ignore() {
		
		$.ajax({
 			type : 'POST',
 			url : '${baseURL}/notice/ignore',
 			data : {},     	
 			dataType : 'json',			
 			success : function(result) {
 				if(result.state == 200) {
 					showWindow("操作成功！");
 					setTimeout(function() {
   						window.location.reload();
   				    }, 2500);	
 				}
 				else {
 					showWindow("系统繁忙，请稍后再试！");
 				}
 			}
 		});		
	}

	$(function() { 
			
		var user = "${user}";
		if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
			console.log("用户未登录");
			return false;
		}
							
		$.ajax({
 			type : 'POST',
 			url : '${baseURL}/notice/find',
 			data : {},     	
 			dataType : 'json',
 			success : function(result) {
 				
 				if(result.state == 200) { 					
 					if(result.many == 0) {
 						console.log("没有新的动态");
 					}	   	
 					else {
 						
 						console.dir(result);
 						 						
 						var text = "+" + result.list.length;
 						$('#dt-num-span').html(text);
 						$('#dt-num').removeClass('hide');
 						
 						html = "";
 						for(var i = 0; i < result.list.length; i++) {     //javascript:void(0)
 							
 							html += "<li>";
 							if(result.list[i][1] == 1) {
 								html += "<a href='javascript:void(0)' onclick='read(" + result.list[i][0] + "," + "0" + "," + "1" + ")'>" 
 								        + result.list[i][4] + "给你留言了";
 							}
 							if(result.list[i][1] == 2) {
 								html += "<a href='javascript:void(0)' onclick='read(" + result.list[i][0] + "," + result.list[i][2] + "," + "2" + ")'>" 
 								        + '"' + result.list[i][4] + '"' + "评论了" + "《" + result.list[i][3] + "》";
 							}
 							if(result.list[i][1] == 3) {
 								html += "<a href='javascript:void(0)' onclick='read(" + result.list[i][0] + "," + result.list[i][2] + "," + "3" + ")'>" 
 										+ '"' + result.list[i][4] + '"' + "在" + "《" + result.list[i][3] + "》" + "中回复了你的评论"; 
 							}
							if(result.list[i][1] == 4) {
								html += "<a href='javascript:void(0)' onclick='read(" + result.list[i][0] + "," + result.list[i][2] + "," + "4" + ")'>" 
										+ '"' + result.list[i][4] + '"' + "评论了" + "《" + result.list[i][3] + "》";
 							}
							if(result.list[i][1] == 5) {
								html += "<a href='javascript:void(0)' onclick='read(" + result.list[i][0] + "," + result.list[i][2] + "," + "4" + ")'>" 
										+ '"' + result.list[i][4] + '"' + "在" + "《" + result.list[i][3] + "》" + "中回复了你的评论";
 							}
							html += "</a>";
							html += "</li>";							
 						}
 						console.dir(html);
 						$('#dt-ul1').html(html);
 					}
 	 		  	}
 				else{	  
 					console.log("查询动态失败！");  					
 	 			}
 				
 				html2 = "";
 				for(var i = 0; i < result.knowList.length; i++) {
						
					html2 += "<li>";
					if(result.knowList[i][1] == 1) {
						html2 += "<a href='${baseURL}/feedback/page'>" + result.knowList[i][4] + "给你留言了";
					}
					if(result.knowList[i][1] == 2) {
						html2 += "<a href='${baseURL}/singing/detail?id=" + result.knowList[i][2] + "'>" + '"' + result.knowList[i][4] + '"' + "评论了" 
								+ "《" + result.knowList[i][3] + "》";
					}
					if(result.knowList[i][1] == 3) {
						html2 += "<a href='${baseURL}/singing/detail?id=" + result.knowList[i][2] + "'>" + '"' + result.knowList[i][4] + '"' + "在" 
								+ "《" + result.knowList[i][3] + "》" + "中回复了你的评论"; 
					}
					if(result.knowList[i][1] == 4) {
						html2 += "<a href='${baseURL}/forum/detail?id=" + result.knowList[i][2] + "'>" + '"' + result.knowList[i][4] + '"' + "评论了" 
							    + "《" + result.knowList[i][3] + "》";
					}
					if(result.knowList[i][1] == 5) {
						html2 += "<a href='${baseURL}/forum/detail?id=" + result.knowList[i][2] + "'>" + '"' + result.knowList[i][4] + '"' + "在" 
							    + "《" + result.knowList[i][3] + "》" + "中回复了你的评论";
					}
					html2 += "</a>";
					html2 += "</li>";							
				}
				console.dir(html2);
				$('#dt-ul2').html(html2);
 			}
 		});						
	});
		
</script> 