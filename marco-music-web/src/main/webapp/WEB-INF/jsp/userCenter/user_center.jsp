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
	    <div class="search-area container div-padding">        
	        <p class="search-tag-line">
            	<c:choose>
            		<c:when test="${empty user.txImg }">
            			<img id="touxiang" src="${baseURL}/sources/img/touxiang.png" class="default-tx-style" />
            		</c:when>   
            		<c:otherwise>
            			<img id="touxiang" src="${txURL}${user.txImg }" class="tx-style" />
            		</c:otherwise>
            	</c:choose>       	
			</p>	
			<h3 class="search-header" id="font-size2" style="font-family: STKaiti;">${user.nickname }</h3>
			<p class="search-tag-line"><button class="button-style2" onclick="toUploadPage()">上传头像</button></p>
	    </div>
	</div>
		
	<div id="speak-div" class="page-container">
    	<div class="container">
        	<div class="row">
            	<div class="span12 page-content">	
                	<div class="row-fluid div-center">
	                    <div id="out-div1" class="span2 my-width out-div out-active" onclick="chooseDiv('1')">
	                    	<h4 style="color: #72ACE3; text-decoration: none;">个人</h4>                                 
	                    </div>
	                    <div id="out-div2" class="span2 my-width out-div" onclick="chooseDiv('2')">
	                    	<h4 style="color: #72ACE3; text-decoration: none;">发表</h4>                                  
	                    </div>
	                    <div id="out-div3" class="span2 my-width out-div" onclick="toFeedbackPage()">
	                    	<h4 style="color: #72ACE3; text-decoration: none;">留言</h4>                                
	                    </div>
	                    <div id="out-div4" class="span2 my-width out-div" onclick="chooseDiv('4')">
	                    	<h4 style="color: #72ACE3; text-decoration: none;">
	                    		动态
		                    	<span id="dt-num" class="dt-num hide">  
						      		<span id="dt-num-span"></span>  
						 		</span>
	                    	</h4>                                
	                    </div>
                	</div>
            	</div>
        	</div>
    	</div>
    </div> 
	
	<%@ include file="/WEB-INF/jsp/common/window.jsp"%>  
	<%@ include file="/WEB-INF/jsp/userCenter/data.jsp"%>
	<%@ include file="/WEB-INF/jsp/userCenter/history.jsp"%>
	<%@ include file="/WEB-INF/jsp/userCenter/dt.jsp"%>	
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>  
	
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
	<script type="text/javascript">	
								
		$(function() {
			
			var autoClick = window.sessionStorage.getItem("autoClick");
			if(typeof(autoClick) == "undefined" || autoClick == null || autoClick == "" || autoClick == "null") {
				console.dir("不需要打开动态");
				$('#out-div1').addClass('out-active');
				$('#in-div1').addClass('in-active');
			}
			else if(autoClick == 1) {
				$('#out-div1').removeClass('out-active');
				$('#in-div1').removeClass('in-active');
				$('#out-div4').addClass('out-active');
				$('#in-div4').addClass('in-active');
			}
			window.sessionStorage.setItem("autoClick", 0);						
		});
		
		function chooseDiv(id) {
			
			$('.out-div').removeClass('out-active');
			$('#out-div' + id).addClass('out-active');
			
			$('.in-div').removeClass('in-active');
			$('#in-div' + id).addClass('in-active');
		}
										
		function toFeedbackPage() {
			window.location.href = "${baseURL}/feedback/page";
		}
		
		function toUploadPage() {
			window.location.href = "${baseURL}/upload/touxiang/page";
		}
						
	</script>   
</body>
</html>