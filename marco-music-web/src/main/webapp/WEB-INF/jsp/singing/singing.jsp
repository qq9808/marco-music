<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>现音中国-音乐厅</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco_src.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
</head>
<body>

	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container">
	        <h3 class="search-header">音 乐 厅</h3>
	        <p class="search-tag-line">再平凡的个体，也有自己的音乐专辑</p>	
	        <p class="search-tag-line"><!-- 占位符 --></p>	
	    </div>
	</div> 

    <div class="page-container">
	    <div class="container">
	        <div class="row">
	            <div class="span8 main-listing">
	                <c:forEach items="${list}" var="singing">
		                <article class="format-standard type-post hentry clearfix">	
		                    <header class="clearfix">	
		                        <h3 class="post-title">
		                        	<a href="${baseURL}/user/page/read?id=${singing[4]}">
			                        	<c:choose>					            		
							            		<c:when test="${empty singing[6] }">
							            			<img id="touxiang" src="${baseURL}/sources/img/touxiang.png" class="tx-style1" />
							            		</c:when>   
							            		<c:otherwise>
							            			<img id="touxiang" src="${prefixURL}${txURL}${singing[6] }" class="tx-style2" />
							            		</c:otherwise>					            		
						            	</c:choose>  
					            	</a>
                                	<a href="${baseURL}/singing/detail?id=${singing[0]}" class="all-title-style">${singing[1]}</a>
		                        </h3>	
	                            <div class="post-meta clearfix">
	                                <span class="category"><a href="${baseURL}/user/page/read?id=${singing[4]}" class="font-color1">${singing[5]}</a></span>
	                                <span class="date"><fmt:formatDate value="${singing[3] }" pattern="yyyy-MM-dd HH:mm" /></span>	                               
	                                <span class="comments" style="float: right;">${singing[7] } 回复</span>
	                            </div>	
		                    </header>			                    	
		                </article> 
	                </c:forEach>             
					<script type="text/javascript">
						var pageURL = baseURL + "/singing/page";
					</script>                                                             
                    <%@ include file="/WEB-INF/jsp/common/page.jsp"%> 
                </div>	                 
				<%@ include file="/WEB-INF/jsp/common/right.jsp"%>
					<section class="widget margin-top">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
							    <td class="td-style3">
									<button class="button-style btn-style1" onclick="speak()">发表</button>
								</td>
								<td class="td-style3">
									<button class="button-style btn-style2" onclick="update()">刷新</button>
								</td>									
							</tr>
						</table>
					</section> 
				</aside>                                    
	        </div>
	    </div>
    </div>    
    	
	<div id="choose-div" class="page-container div-shade">
    	<div class="container">
        	<div class="row">
            	<div class="span12 page-content">	
                	<div id="respond">                       
                        <div class="submit-div"> 
                        	<button id="submit" class="singing-button1" onclick="uploadAudio()">上传音频(mp3)</button>
                        	<button id="submit" class="singing-button1" onclick="uploadVideo()">上传视频(mp4)</button>
                        	<button id="submit" class="singing-button1" onclick="cancelChoose()">取消</button>
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
	
		function speak() {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				showWindow("亲，您还未登录呢，请先登录");				
				return false;
			}
			$('#choose-div').addClass('show');
		}
		
		function uploadAudio() {
			window.location.href = baseURL + "/singing/writing" + "?type=1";
		}
		
		function uploadVideo() {
			window.location.href = baseURL + "/singing/writing" + "?type=2";
		}
		
		function update() {
			window.location.reload();
		}
		
		function cancelChoose() {		
			$('#choose-div').removeClass('show');
		}
				
	</script>
</body>
</html>