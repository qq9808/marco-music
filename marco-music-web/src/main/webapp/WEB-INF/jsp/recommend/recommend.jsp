<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>vita音乐-荐读</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy—logo.jpg" />

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
	            <div class="span8 main-listing">
	                <c:forEach items="${list}" var="recommend">
		                <article class="format-standard type-post hentry clearfix">	
		                    <header class="clearfix">	
		                        <h3 class="post-title">
		                        	<img src="${baseURL}/sources/img/xy.jpg" class="tx-style1" />
                                	<a href="${baseURL}/recommend/detail?id=${recommend.id}" class="all-title-style">${recommend.title}</a>
		                        </h3>	
	                            <div class="post-meta clearfix">
	                                <span class="category"><a href="javascript:void(0)">vita音乐</a></span>
	                                <span class="date"><fmt:formatDate value="${recommend.createTime}" pattern="yyyy-MM-dd HH:mm" /></span>	                               
	                            </div>	
		                    </header>			                    	
		                </article> 
	                </c:forEach>             
					<script type="text/javascript">
						var pageURL = baseURL + "/recommend/page";
					</script>                                                             
                    <%@ include file="/WEB-INF/jsp/common/page.jsp"%> 
                </div>	                   
				<%@ include file="/WEB-INF/jsp/common/right.jsp"%></aside>                                  
	        </div>
	    </div>
    </div>    
       
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>    	
	<%@ include file="/WEB-INF/jsp/common/tip.jsp"%>    	
</body>
</html>