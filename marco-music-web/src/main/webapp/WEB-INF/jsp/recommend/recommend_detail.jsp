<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>vita音乐-荐读</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy-logo.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
</head>
<body>

	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container">
	        <h3 class="search-header">荐 读</h3>
	        <p class="search-tag-line">让阅读成为一种习惯</p>	
	        <p class="search-tag-line"><!-- 占位符 --></p>	
	    </div>
	</div> 

    <div class="page-container">
	    <div class="container">
	        <div class="row">
	            <div class="span8 page-content">		
                    <article class="type-post format-standard hentry clearfix">
	                    <h1 class="post-title">
	                    	<img id="touxiang" class="detail-default-tx" src="${baseURL}/sources/img/xy.jpg" />
	                    	<a href="javascript:void(0)" class="all-title-style" style="color: #f0b70c !important;">${recommend.title}</a>
	                    </h1>
	                    <div class="post-meta clearfix">
	                    	<span class="category"><a href="javascript:void(0)">vita音乐</a></span>
	                    	<span class="date"><fmt:formatDate value="${recommend.createTime }" pattern="yyyy-MM-dd HH:mm" /></span>	                    	
	                    </div>	                    
	                    <div style="text-indent: 2rem; margin-bottom: 3rem;">${recommend.content}</div>
                    </article>	
                    <section id="comments">	
	                    <hr><h4 id="comments-title">全部回复</h4><hr>
	                    <ol class="commentlist">		                       	
	                        <c:forEach items="${list}" var="recommendReply">
		                        <li class="comment even thread-odd thread-alt depth-1 some-padding" id="li-comment-4">
		                            <c:if test="${recommendReply[1] eq 2}">
			                            <article id="comment-4" class="background-color-gray">		
			                                <div class="comment-meta">
			                                    <h5 class="author">
			                                    	<cite class="fn font-weight">回复 
			                                    		<a href="javascript:void(0)" rel="external nofollow" class="url">${recommendReply[8]}</a> 发表的：
			                                    	</cite>
			                                    </h5>	                                    	
			                                </div>	
			                                <div class="comment-body">
			                                	<p class="no-margin">${recommendReply[9]}</p>	                                       
			                                </div>
			                            </article>
		                            </c:if>
		                            <article id="comment-4" class="article-style">	
		                                <a href="javascript:void(0)">
		                                	<c:choose>
							            		<c:when test="${empty recommendReply[6]}">
							            			<img src="${baseURL}/sources/img/touxiang.png" class="avatar avatar-60 photo tx-style4" />
							            		</c:when>   
							            		<c:otherwise>
							            			<img src="${txURL}${recommendReply[6] }" class="avatar avatar-60 photo tx-style5" />
							            		</c:otherwise>
							            	</c:choose> 
		                                </a>	
		                                <div class="comment-meta">
		                                    <h5 class="author">
		                                    	<cite class="fn"><a href="javascript:void(0)" rel="external nofollow" class="url">${recommendReply[5]}</a></cite>
		                                    </h5>
		                                    <p class="date some-margin-top">
		                                    	<fmt:formatDate value="${recommendReply[3]}" pattern="yyyy-MM-dd HH:mm" /> 
		                                    </p>	
		                                </div>	
		                                <div class="comment-body">
		                                	<p>${recommendReply[2]}</p>	                                       
		                                </div>
		                                <div style="text-align: right;">					                    						                    	
					                    	<a href="javascript:void(0)" onclick="reply2(${recommendReply[0]})"><span class="reply">回复</span></a>
					                    	<!-- <a href="javascript:void(0)"><span class="cool">赞</span></a> -->
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
				showWindow("您还未登录呢，请先登录！");
				return false;
			}			
			$('#reply-to-forum-div').addClass('show');
		}		
		
		function reply2(id) {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				showWindow("您还未登录呢，请先登录！");
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
				showWindow("您忘记填写内容啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/recommend/reply/save',
	   			data : {
	   				recommendID : "${recommend.id}", 
	   				content : content, 
	   				level : level,
	   				authorID : "0", 
	   				eventName : "${recommend.title}"
	   			},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					showWindow("回复成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    }, 2500);	   					
	   	 		  	}
	   				else {	  
	   					$("#submit").attr("onclick", "deliver()");
	   					showWindow(result.msg);	   					
	   	 			}
	   			}
	   		});
		}
		
		function deliver2() {
		   	
			var content = $("#content2").val();	
			var level = 2;
			
			content = content.replaceAll("\n", "<br/>");
		
			if(content == ''){
				showWindow("您忘记填写内容啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/recommend/reply/save',
	   			data : {
	   				recommendID : "${recommend.id}", 
	   				content : content, 
	   				level : level, 
	   				replyID : replyID,
	   				authorID : "0", 
	   				eventName : "${recommend.title}"
	   			},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					showWindow("回复成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    }, 2500);	   					
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "deliver2()");
	   					showWindow(result.msg);	   					
	   	 			}
	   			}
	   		});
		}
		
		String.prototype.replaceAll = function(s1,s2){ 
			return this.replace(new RegExp(s1, "gm"),s2); 
		}
		
		function back(){
			window.location.href = "${baseURL}/recommend/page";
		}
	
	</script>	
</body>
</html>