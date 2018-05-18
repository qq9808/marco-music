<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>vita音乐-家园</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco_src.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
	
	<link href="${baseURL}/sources/UMEditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">	
</head>
<body>

	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container">
	        <h3 class="search-header">家 园</h3>
	        <p class="search-tag-line">家是温馨的港湾，在这里，我们聊聊工作、聊聊生活</p>	
	        <p class="search-tag-line"><!-- 占位符 --></p>	
	    </div>
	</div>

    <div class="page-container">
	    <div class="container">
	        <div class="row">
	            <div class="span8 main-listing">
	                <c:forEach items="${list}" var="forum">
		                <article class="format-standard type-post hentry clearfix">	
		                    <header class="clearfix">	
		                        <h3 class="post-title">
		                        	<a href="${baseURL}/user/page/read?id=${forum[4]}">
			                        	<c:choose>
						            		<c:when test="${empty forum[6] }">
						            			<img src="${baseURL}/sources/img/touxiang.png" class="tx-style1" />
						            		</c:when>   
						            		<c:otherwise>
						            			<img src="${prefixURL}${txURL}${forum[6] }" class="tx-style2" />
						            		</c:otherwise>
						            	</c:choose>        
					            	</a>                         	
                                	<a href="${baseURL}/forum/detail?id=${forum[0]}" class="all-title-style">${forum[1]}</a>
		                        </h3>	
	                            <div class="post-meta clearfix">
	                                <span class="category"><a href="${baseURL}/user/page/read?id=${forum[4]}" class="font-color1">${forum[5]}</a></span>
	                                <span class="date"><fmt:formatDate value="${forum[3] }" pattern="yyyy-MM-dd HH:mm" /></span>	                               
	                                <span class="comments" style="float: right;">${forum[7] } 回复</span>
	                            </div>	
		                    </header>			                    	
		                </article> 
	                </c:forEach>             
					<script type="text/javascript">
						var pageURL = baseURL + "/forum/page";
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
	
	<div id="speak-div" class="page-container div-shade">
    	<div class="container">
        	<div class="row">
            	<div class="span12 page-content">	
                	<div id="respond">
                        <div style="text-align: center;">
                            <input id="title" type="text" class="span4 title-input" maxlength="50" placeholder="输入标题">
                        </div>
                        <div>
                        	<script type="text/plain" id="myEditor" class="content-input"></script>
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
	    	
	<%@ include file="/WEB-INF/jsp/common/tip.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/window.jsp"%>   
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>  
	
	<script type="text/javascript" src="${baseURL}/sources/UMEditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${baseURL}/sources/UMEditor/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${baseURL}/sources/UMEditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${baseURL}/sources/UMEditor/umeditor.min.js"></script>
    <script type="text/javascript" src="${baseURL}/sources/UMEditor/lang/zh-cn/zh-cn.js"></script> 
	<script type="text/javascript">
	
		window.onload = function() {       			
			$('.edui-container').addClass('margin-auto');
		} 
		
		//实例化编辑器
	    var um = UM.getEditor('myEditor', {
	    	autoHeightEnabled: false
	    });
		
	    var prefixURL = location.protocol + "//" + window.location.host;
		<c:set var="prefixURL" value="prefixURL" />
	
		function speak() {
			var user = "${user}";
			if(typeof(user) == "undefined" || user == null || user == "" || user == "null") {
				showWindow("您还未登录呢，请先登录！");
				return false;
			}
			$('#speak-div').addClass('show');
		}
		
		function update() {
			window.location.reload();
		}
				
		function cancel() {		
			$("#title").val("");
			um.setContent('');
			$('#speak-div').removeClass('show');
		}
		
		function deliver() {
		   	
			var title = $("#title").val();
			var content = UM.getEditor('myEditor').getContent();	
						
			if(title == ''){
				showWindow("忘记写标题啦！");
	        	return false;
	        }			
			if(content == ''){
				showWindow("忘记填写内容啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/forum/save',
	   			data : {title : title, content : content},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					showWindow("发表成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    }, 2500);	   					
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
				
		/* $(function () { 
			var ie6 = document.all; 
			var dv = $('#fb-button'), st; 
			dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离 
			var lWidth = dv.offset().left;
			$(window).scroll(function () { 
				st = Math.max(document.body.scrollTop || document.documentElement.scrollTop); 
				if (st > parseInt(dv.attr('otop'))) { 
					if (ie6) {   //IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果 
						dv.css({ position: 'absolute', top: st }); 
					} 
					else if(dv.css('position') != 'fixed') {
						dv.css({ 'position': 'fixed', top: 0, left: lWidth }); 
					} 					
				} 
				else if(dv.css('position') != 'static') {
					dv.css({ 'position': 'static' }); 
				}		
			}); 
		}); */ 
	</script>
</body>
</html>