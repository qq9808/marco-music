<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>vita音乐-音乐厅</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
	
	<link rel="stylesheet" type="text/css" href="${baseURL}/sources/audioView/audio-style.css">
	<script type="text/javascript" src="${baseURL }/sources/audioView/main.js"></script>	     	
</head>
<body>

	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container">
	        <h3 class="search-header">音 乐 厅</h3>
	        <p class="search-tag-line">再平凡的个体，也有自己的专辑</p>	
	        <p class="search-tag-line"><!-- 占位符 --></p>	
	    </div>
	</div> 
	
    <div class="page-container">
	    <div class="container">
	        <div class="row">
	            <div class="span8 page-content">		
                    <article class="type-post format-standard hentry clearfix">
	                    <h1 class="post-title">
	                    	<c:choose>
			            		<c:when test="${empty singing[6] }">
			            			<img id="touxiang" class="detail-default-tx" src="${baseURL}/sources/img/touxiang.png" />
			            		</c:when>   
			            		<c:otherwise>
			            			<img id="touxiang" class="detail-tx-style1" src="${txURL}${singing[6] }" />
			            		</c:otherwise>
			            	</c:choose>
	                    	<a href="javascript:void(0)" class="all-title-style" style="color: #f0b70c !important;">${singing[1]}</a>
	                    </h1>
	                    <div class="post-meta clearfix">
	                    	<span class="category"><a href="${baseURL}/user/page/read?id=${forum[4]}" class="title-nickname">${singing[5]}</a></span>
	                    	<span class="date"><fmt:formatDate value="${singing[3] }" pattern="yyyy-MM-dd HH:mm" /></span>	                    		                    	
	                    </div>		                    
	                    <div id="audio-view">
		                    <canvas id='canvas' width="500" height="250" class="the-canvas"></canvas>
							<br>
							<br>
							<audio src="${singing[8] }" id="audio" class="the-audio" crossOrigin="anonymous" controls="controls">无法打开音频文件</audio>
	                    </div>
						<br> 	                                                           
	                    <div style="text-indent: 2rem; margin-bottom: 3rem;">${singing[2]}</div>
                    </article>
	                <section id="comments">	
	                    <hr><h4 id="comments-title">全部回复</h4><hr>
	                    <ol class="commentlist">		                       	
	                        <c:forEach items="${list}" var="singingReply">
		                        <li class="comment even thread-odd thread-alt depth-1 some-padding" id="li-comment-4">
		                            <c:if test="${singingReply[1] eq 2}"> 
			                            <article id="comment-4" class="background-color-gray">		
			                                <div class="comment-meta">
			                                    <h5 class="author">
			                                    	<cite class="fn font-weight">回复 
			                                    		<a href="javascript:void(0)" rel="external nofollow" class="url">${singingReply[8]}</a> 发表的：
			                                    	</cite>
			                                    </h5>	                                    	
			                                </div>	
			                                <div class="comment-body">
			                                	<p class="no-margin">${singingReply[9]}</p>	                                       
			                                </div>
			                            </article>
		                            </c:if>
		                            <article id="comment-4" class="article-style">	
		                                <a href="javascript:void(0)">
		                                	<c:choose>
							            		<c:when test="${empty singingReply[6] }">
							            			<img src="${baseURL}/sources/img/touxiang.png" class="avatar avatar-60 photo tx-style4" />
							            		</c:when>   
							            		<c:otherwise>
							            			<img src="${txURL}${singingReply[6] }" class="avatar avatar-60 photo tx-style5" />
							            		</c:otherwise>
							            	</c:choose>
		                                </a>	
		                                <div class="comment-meta">
		                                    <h5 class="author">
		                                    	<cite class="fn"><a href="javascript:void(0)" rel="external nofollow" class="url">${singingReply[5]}</a></cite>
		                                    </h5>
		                                    <p class="date some-margin-top">
		                                    	<fmt:formatDate value="${singingReply[3]}" pattern="yyyy-MM-dd HH:mm" /> 
		                                    </p>	
		                                </div>	
		                                <div class="comment-body">
		                                	<p>${singingReply[2]}</p>	                                       
		                                </div>
		                                <div style="text-align: right;">					                    						                    	
					                    	<a href="javascript:void(0)" onclick="reply2(${singingReply[0]})"><span class="reply">回复</span></a>
					                    </div>	
		                            </article>
		                        </li>
	                        </c:forEach>    
	                    </ol>		                            	
	                </section>
	            </div>
	            <%@ include file="/WEB-INF/jsp/common/right.jsp"%>
	            <section class="widget margin-top">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
						    <td style="width:50%; background-color: white;">
								<button class="button-style btn-style1" onclick="reply()">回复</button>
							</td>
							<td style="width:50%; background-color: white;">
								<button class="button-style btn-style2" onclick="back()">返回</button>
							</td>									
						</tr>
					</table>
				</section>
				</aside> 
	        </div>
	    </div>
    </div>
    
    <div id="reply-to-forum-div" class="page-container div-shade">
	    <div class="container">
		    <div class="row">
		    	<div class="span12 page-content">	
			    	<div id="respond">
			    		<div class="text-center margin-top">
	                        <textarea id="content" class="span8" cols="58" rows="10" placeholder="输入内容"></textarea>
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
        
    <div id="reply-to-reply-div" class="page-container div-shade">
	    <div class="container">
		    <div class="row">
		    	<div class="span12 page-content">	
			    	<div id="respond">
			    		<div class="text-center margin-top">
	                        <textarea id="content2" class="span8" cols="58" rows="10" placeholder="输入内容"></textarea>
                        </div>
                        <div class="submit-div"> 
                        	<button id="submit" class="forum-submit" onclick="deliver2()">提交</button>
                        	<button id="submit" class="forum-submit" onclick="cancel2()">取消</button>
                        </div>	
			    	</div>		        
		    	</div>
		    </div>
	    </div>
    </div>
    
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>    	
	<%@ include file="/WEB-INF/jsp/common/tip.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/window.jsp"%>

	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>	     	
	<script type="text/javascript">
		
		var replyID;
	
		function reply() {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				alert("您还未登录呢，请先登录！");
				return false;
			}			
			$('#reply-to-forum-div').addClass('show');
		}		
		
		function reply2(id) {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				alert("您还未登录呢，请先登录！");
				return false;
			}
			replyID = id;
			$('#reply-to-reply-div').addClass('show');
		}
		
		function cancel() {		
			$('#reply-to-forum-div').removeClass('show');
		}		
		
		function cancel2() {		
			$('#reply-to-reply-div').removeClass('show');
		}
		
		function deliver() {
		   	
			var content = $("#content").val();	
			var level = 1;
			
			content = content.replaceAll("\n", "<br/>");
					
			if(content == ''){
	        	alert("您忘记填写内容啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/singing/reply/save',
	   			//data : {singingID : "${singing[0]}", content : content, level : level}, 
	   			data : {
	   				singingID : "${singing[0]}", 
	   				content : content, 
	   				level : level, 
	   				authorID : "${singing[4]}", 
	   				eventName : "${singing[1]}"
	   			}, 
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					alert("回复成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    },1);	   					
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "deliver()");
	   					alert(result.msg);	   					
	   	 			}
	   			}
	   		});
		}
		
		function deliver2() {
		   	
			var content = $("#content2").val();	
			var level = 2;
			
			content = content.replaceAll("\n", "<br/>");
		
			if(content == ''){
	        	alert("您忘记填写内容啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/singing/reply/save',
	   			data : {
	   				singingID : "${singing[0]}", 
	   				content : content, 
	   				level : level, 
	   				replyID : replyID, 
	   				authorID : "${singing[4]}", 
	   				eventName : "${singing[1]}"
	   			},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					alert("回复成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    },1);	   					
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "deliver2()");
	   					alert(result.msg);	   					
	   	 			}
	   			}
	   		});
		}
		
		String.prototype.replaceAll = function(s1,s2){ 
			return this.replace(new RegExp(s1,"gm"),s2); 
		}
		
		function back(){
			self.location = document.referrer;
		}
	
	</script>
</body>
</html>