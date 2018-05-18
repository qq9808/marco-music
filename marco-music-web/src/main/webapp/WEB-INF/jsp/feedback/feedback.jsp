<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>vita音乐-留言中心</title>

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
	            <div class="span8 main-listing">
	            	<ul class="tabs-nav">
	                    <li id="title1" class="title active" onclick="changeTab('1')"><a href="javascript:void(0)">收到的留言</a></li>
	                    <li id="title2" class="title" onclick="changeTab('2')"><a href="javascript:void(0)">发送的留言</a></li>	                    
	                </ul>
                    <div class="tabs-container">
	                    <div id="feedback-content1" class="tab-content tab-show feedback-content feedback-show">
							<c:choose>
							<c:when test="${empty list1 }">
								<p class="text-center no-margin">暂无收到的留言</p>
							</c:when> 
							<c:otherwise>
								<section id="comments">	
				                    <ol class="commentlist">		                       	
				                        <c:forEach items="${list1}" var="feedback">
					                        <li class="comment even thread-odd thread-alt depth-1 some-padding" id="li-comment-4">
					                            <c:if test="${feedback[1] eq 2}">
						                            <article id="comment-4" class="background-color-gray">		
						                                <div class="comment-meta">
						                                    <h5 class="author">
						                                    	<cite class="fn font-weight">回复我的留言：</cite>
						                                    </h5>	                                    	
						                                </div>	
						                                <div class="comment-body">
						                                	<p class="no-margin">${feedback[9]}</p>	                                       
						                                </div>
						                            </article>
					                            </c:if>
					                            <article id="comment-4" class="article-style">	
					                                <a href="javascript:void(0)">
					                                	<c:choose>
										            		<c:when test="${empty feedback[6] }">
										            			<img src="${baseURL}/sources/img/touxiang.png" class="avatar avatar-60 photo tx-style4" />
										            		</c:when>   
										            		<c:otherwise>
										            			<img src="${txURL}${feedback[6] }" class="avatar avatar-60 photo tx-style5" />
										            		</c:otherwise>
										            	</c:choose> 
					                                </a>	
					                                <div class="comment-meta">
					                                    <h5 class="author">
					                                    	<cite class="fn"><a href="javascript:void(0)" class="url">${feedback[5]}</a></cite>
					                                    </h5>
					                                    <p class="date some-margin-top">
					                                    	<fmt:formatDate value="${feedback[3]}" pattern="yyyy-MM-dd HH:mm" /> 
					                                    </p>	
					                                </div>	
					                                <div class="comment-body">
					                                	<p>${feedback[2]}</p>	                                       
					                                </div>
					                                <div style="text-align: right;">					                    						                    	
								                    	<a href="javascript:void(0)" onclick="reply(${feedback[0]}, ${feedback[4]})"><span class="reply">回复</span></a>
								                    </div>	
					                            </article>
					                        </li>
				                        </c:forEach>    
				                    </ol>		                            	
				                </section>
							</c:otherwise>
							</c:choose> 
						</div>
	                    <div id="feedback-content2" class="tab-content tab-close feedback-content">
							<c:choose>
							<c:when test="${empty list2 }">
								<p class="text-center no-margin">暂无发送的留言</p>
							</c:when> 
							<c:otherwise>
								<section id="comments">	
				                    <ol class="commentlist">		                       	
				                        <c:forEach items="${list2}" var="feedback">
					                        <li class="comment even thread-odd thread-alt depth-1 some-padding" id="li-comment-4">
					                            <c:if test="${feedback[1] eq 2}">
						                            <article id="comment-4" class="background-color-gray">		
						                                <div class="comment-meta">
						                                    <h5 class="author">
						                                    	<cite class="fn font-weight">回复 <a href="#" class="url">${feedback[8]}</a> 的留言：</cite>
						                                    </h5>	                                    	
						                                </div>	
						                                <div class="comment-body">
						                                	<p class="no-margin">${feedback[9]}</p>	                                       
						                                </div>
						                            </article>
					                            </c:if>
					                            <article id="comment-4" class="article-style">	
					                                <a href="javascript:void(0)">
					                                	<c:choose>
										            		<c:when test="${empty txImg }">
										            			<img src="${baseURL}/sources/img/touxiang.png" class="avatar avatar-60 photo tx-style4" />
										            		</c:when>   
										            		<c:otherwise>
										            			<img src="${txURL}${txImg }" class="avatar avatar-60 photo tx-style5" />
										            		</c:otherwise>
										            	</c:choose> 
					                                </a>	
					                                <div class="comment-meta">					                                                                                                   
					                                    <h5 class="author">
					                                    	<cite class="fn"><span style="font-weight: normal; color: #6f7579;">发送给</span> <a href="javascript:void(0)" class="url">${feedback[5]}</a></cite>
					                                    </h5>
					                                    <p class="date some-margin-top">
					                                    	<fmt:formatDate value="${feedback[3]}" pattern="yyyy-MM-dd HH:mm" /> 
					                                    </p>	
					                                </div>	
					                                <div class="comment-body">
					                                	<p>${feedback[2]}</p>	                                       
					                                </div>
					                            </article>
					                        </li>
				                        </c:forEach>    
				                    </ol>		                            	
				                </section>
							</c:otherwise>
							</c:choose> 
						</div>
	            	</div>	    
                </div>	              										    
				<%@ include file="/WEB-INF/jsp/common/right.jsp"%></aside>    							                                         
	        </div>
	    </div>
    </div>
    		
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>  
	<%@ include file="/WEB-INF/jsp/common/tip.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/window.jsp"%>  
		
	<div id="feedback-div" class="page-container div-shade">
	    <div class="container">
		    <div class="row">
		    	<div class="span12 page-content">	
			    	<div id="respond">
			    		<div class="text-center margin-top">
	                        <textarea id="feedback-content" class="span8" cols="58" rows="10" placeholder="输入内容"></textarea>
                        </div>
                        <div class="submit-div"> 
                        	<button id="submit" class="forum-submit" onclick="send()">提交</button>
                        	<button id="submit" class="forum-submit" onclick="cancel()">取消</button>
                        </div>	
			    	</div>		        
		    	</div>
		    </div>
	    </div>
    </div>
	
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
	<script type="text/javascript">	
	
		var replyID = "";
		var readUserID = "";
		
		function changeTab(index) {		
			
			$('.title').removeClass('active');
			$('#title' + index).addClass('active');
			
			$('.feedback-content').removeClass('feedback-show');
			$('#feedback-content' + index).addClass('feedback-show');
		}
		
		function reply(replyID_temp, readUserID_temp) {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				showWindow("登录状态异常了，请返回首页重新登录吧");
				return false;
			}
			replyID = replyID_temp;
			readUserID = readUserID_temp;
			$('#feedback-div').addClass('show');
		}
		
		function cancel() {		
			$("#feedback-content").val("");
			$('#feedback-div').removeClass('show');
		}
		
		function send() {
						
			var level = 2;
		   	
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
	   			data : {content : content, readUserID : readUserID, level : level, replyID : replyID},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					showWindow("回复成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    },2500);	   					
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "send()");
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