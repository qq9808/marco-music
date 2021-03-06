<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>现音中国-个人信息</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
</head>
<body>
	
	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container div-padding">        
	        <p class="search-tag-line">
            	<c:choose>
            		<c:when test="${empty txImg }">
            			<img id="touxiang" src="${baseURL}/sources/img/touxiang.png" class="default-tx-style" />
            		</c:when>   
            		<c:otherwise>
            			<img id="touxiang" src="${txURL}${txImg}" class="tx-style" />
            		</c:otherwise>
            	</c:choose>               	
			</p>	
			<h3 class="search-header" id="font-size2" style="font-family: STKaiti;">${nickname }</h3>
			<p class="search-tag-line">
				<button class="button-style2" onclick="openFeedbackDiv()">给Ta留言</button>
			</p>
	    </div>
	</div>
	
	<div class="page-container">
	    <div class="container">
	        <div class="row">
	            <div class="span8 main-listing">
	            	<ul class="tabs-nav">
	                    <li id="title1" class="active" onclick="changeTab('1')"><a href="javascript:void(0)">弹唱&翻唱</a></li>
	                    <li id="title2" onclick="changeTab('2')"><a href="javascript:void(0)">论坛</a></li>	                    
	                </ul>
                    <div class="tabs-container">
	                    <div id="content1" class="tab-content tab-show">
							<ul class="ul-style">	
								<c:forEach items="${singingList}" var="singing">
									<li><a href="${baseURL}/singing/detail?id=${singing.id}">${singing.title}</a></li>
								</c:forEach>	    		
			    			</ul>
						</div>
	                    <div id="content2" class="tab-content tab-close">
							<ul class="ul-style">	
								<c:forEach items="${forumList}" var="forum">
									<li><a href="${baseURL}/forum/detail?id=${forum.id}">${forum.title}</a></li>
								</c:forEach>	    		
			    			</ul>
						</div>
	            	</div>	    
                </div>	              										    
				<aside class="span4 page-sidebar">
					<section class="widget">
				        <div class="right-div1">
				            <p class="text-center">
				            	<c:choose>
				            		<c:when test="${empty txImg }">
				            			<img id="touxiang" src="${baseURL}/sources/img/touxiang.png" class="default-tx-style2" />
				            		</c:when>   
				            		<c:otherwise>
				            			<img id="touxiang" src="${txURL}${txImg }" class="tx-style3" />	
				            		</c:otherwise>
				            	</c:choose>			            	  
				            </p>
				            <p class="text-center no-margin">
				            	<span style="color: #72ACE3; font-size: 1.2rem;">${nickname }</span>&nbsp;
				            	<c:if test="${sex eq 1}">
				            		<img id="touxiang" src="${baseURL}/sources/img/male.png" class="sex-img" />
				            	</c:if>
				            	<c:if test="${sex eq 2}">
				            		<img id="touxiang" src="${baseURL}/sources/img/female.png" class="sex-img" />
				            	</c:if>				            	
				            </p>   
				            <p class="thank">${province} &nbsp; ${city}</p>
				            <p class="text-center"><button class="button-style2" onclick="openFeedbackDiv()">给Ta留言</button></p>	        
				        </div> 
				    </section>
				</aside> 							                                         
	        </div>
	    </div>
    </div>
    	
	<div id="feedback-div" class="page-container div-shade">
	    <div class="container">
		    <div class="row">
		    	<div class="span12 page-content">	
			    	<div id="respond">
			    		<div class="text-center margin-top">
	                        <textarea id="feedback-content" class="span8" cols="58" rows="10" placeholder="输入内容"></textarea>
                        </div>
                        <div class="submit-div"> 
                        	<button id="submit" class="forum-submit" onclick="deliver()">提交</button>
                        	<button id="submit" class="forum-submit" onclick="cancel()">取消</button>
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
		
		function changeTab(index) {
			
			if(index == 1) {
				$('#title1').addClass('active');
				$('#title2').removeClass('active');
				$('#content1').removeClass('tab-close');
				$('#content1').addClass('tab-show');
				$('#content2').removeClass('tab-show');
				$('#content2').addClass('tab-close');
			}
			if(index == 2) {
				$('#title2').addClass('active');
				$('#title1').removeClass('active');
				$('#content2').removeClass('tab-close');
				$('#content2').addClass('tab-show');
				$('#content1').removeClass('tab-show');
				$('#content1').addClass('tab-close');
			}			
		}
	
		function cancel() {		
			$("#feedback-content").val("");
			$('#feedback-div').removeClass('show');
		}
		
		function openFeedbackDiv() {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				showWindow("登录后才能留言的哦，快快返回首页登录吧！");
				return false;
			}
			$('#feedback-div').addClass('show');
		}
		
		function deliver() {
			
			var level = 1;
		   	
			var content = $("#feedback-content").val();	
								
			if(content == ''){
				showWindow("忘记填写内容啦！");
	        	return false;
	        }
			
			content = content.replaceAll("\n", "<br/>");
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/feedback/save',
	   			data : {content : content, readUserID : "${id}", level : level},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					showWindow("发表成功啦！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    },1);	   					
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "deliver()");
	   					showWindow(result.msg);	   					
	   	 			}
	   			}
	   		});
		}
		String.prototype.replaceAll = function(s1,s2){ 
			return this.replace(new RegExp(s1,"gm"),s2); 
		} 
		
	</script>   
</body>
</html>