<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>多维</title>

	<link rel="shortcut icon" href="${baseURL}/sources/img/xy.jpg" />

	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco_src.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco.html" />	
</head>
<body>

	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%> 

	<div class="search-area-wrapper">
	    <div class="search-area container">
	        <h3 class="search-header">Music Didn't Lie</h3>
	        <p class="search-tag-line">Music washes away from the soul the dust of everyday life．</p>	
	        <p class="search-tag-line">多维</p>	
	    </div>
	</div>

    <div class="page-container">
	    <div class="container">
	        <div class="row">
	            <div class="span8 page-content">
	                <div class="row separator">
	                    <section class="span4 articles-list">
	                        <h3 onclick="toSinging()" style="cursor: pointer;">音乐厅<span style="font-size: 1rem">（最新）</span></h3>
	                        <ul class="articles" id="singing-ul"></ul>
	                    </section>	
	                    <section class="span4 articles-list">
	                        <h3 onclick="toNews()" style="cursor: pointer;">资讯<span style="font-size: 1rem">（最新）</span></h3>
	                        <ul class="articles" id="news-ul"></ul>	                       
	                    </section>
	                    <section class="span4 articles-list">
	                        <h3 onclick="toRecommend()" style="cursor: pointer;">荐读<span style="font-size: 1rem">（最新）</span></h3>
	                        <ul class="articles" id="recommend-ul"></ul>
	                    </section>
	                    <section class="span4 articles-list">
	                        <h3 onclick="toForum()" style="cursor: pointer;">家园<span style="font-size: 1rem">（最新）</span></h3>
	                        <ul class="articles" id="forum-ul"></ul>
	                    </section>
	                </div>
	            </div>	
	            <%@ include file="/WEB-INF/jsp/common/right.jsp"%></aside>                                                   
	        </div>
	    </div>
    </div>
	
	<%@ include file="/WEB-INF/jsp/common/window.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/tip.jsp"%>  
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>    	
	
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
	<script type="text/javascript">
		$(function() { 
			//获取最新帖子
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/homepage/getData',
	   			data : {},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					
	   					html1 = "";
						html2 = "";	
						html3 = "";
						html4 = "";	
						
						//音乐厅
						for(var i = 0; i < result.singingList.length; i++) {
							html1 += '<li class="article-entry standard" onclick="toSingingDetail(' + result.singingList[i][0] + ')">';
							html1 += '<h4><a href="javascript:void(0)">'
							html1 += result.singingList[i][1];
							html1 += '</a></h4>';
							html1 += '<span class="article-meta"><a href="javascript:void(0)">';
							html1 += result.singingList[i][3];
							html1 += '</a>';
							html1 += '&nbsp;&nbsp;&nbsp;';
							html1 += result.singingList[i][2];
							html1 += '</span>';
							html1 += '<span class="like-count2">';
							html1 += result.singingList[i][4];
							html1 += '</span>';
							html1 += '</li>';					
						}
						
						//资讯
						for(var i = 0; i < result.newsList.length; i++) {
							html2 += '<li class="article-entry standard" onclick="toNewsDetail(' + result.newsList[i][0] + ')">';
							html2 += '<h4><a href="javascript:void(0)">'
							html2 += result.newsList[i][1];
							html2 += '</a></h4>';
							html2 += '<span class="article-meta"><a href="javascript:void(0)">';
							html2 += "vita音乐";
							html2 += '</a>';
							html2 += '&nbsp;&nbsp;&nbsp;';
							html2 += result.newsList[i][2];
							html2 += '</span>';
							html2 += '<span class="like-count2">';
							html2 += result.newsList[i][3];
							html2 += '</span>';
							html2 += '</li>';					
						}
						
						//荐读
						for(var i = 0; i < result.recommendList.length; i++) {
							html3 += '<li class="article-entry standard" onclick="toRecommendDetail(' + result.recommendList[i][0] + ')">';
							html3 += '<h4><a href="javascript:void(0)">'
							html3 += result.recommendList[i][1];
							html3 += '</a></h4>';
							html3 += '<span class="article-meta"><a href="javascript:void(0)">';
							html3 += "vita音乐";
							html3 += '</a>';
							html3 += '&nbsp;&nbsp;&nbsp;';
							html3 += result.recommendList[i][2];
							html3 += '</span>';
							html3 += '<span class="like-count2">';
							html3 += result.recommendList[i][3];
							html3 += '</span>';
							html3 += '</li>';					
						}
						
						//家园
						for(var i = 0; i < result.forumList.length; i++) {
							html4 += '<li class="article-entry standard" onclick="toForumDetail(' + result.forumList[i][0] + ')">';
							html4 += '<h4><a href="javascript:void(0)">'
							html4 += result.forumList[i][1];
							html4 += '</a></h4>';
							html4 += '<span class="article-meta"><a href="javascript:void(0)">';
							html4 += result.forumList[i][3];
							html4 += '</a>';
							html4 += '&nbsp;&nbsp;&nbsp;';
							html4 += result.forumList[i][2];
							html4 += '</span>';
							html4 += '<span class="like-count2">';
							html4 += result.forumList[i][4];
							html4 += '</span>';
							html4 += '</li>';					
						}
						
						$('#singing-ul').html(html1);
						$('#news-ul').html(html2);
						$('#recommend-ul').html(html3);
						$('#forum-ul').html(html4);
	   	 		  	}
	   				else{	  
	   					//出错啦!   					
	   	 			}
	   			}
	   		});
		});	
		
		function toSinging() {   //音乐厅
			window.location.href = "${baseURL}/singing/page";
		}
		function toNews() {      //资讯
			window.location.href = "${baseURL}/news/page";
		}
		function toRecommend() { //荐读
			window.location.href = "${baseURL}/recommend/page";
		}
		function toForum() {     //家园
			window.location.href = "${baseURL}/forum/page";
		}
		
		
		function toSingingDetail(id) {   //音乐厅
			window.location.href = "${baseURL}/singing/detail?id=" + id;
		}
		function toNewsDetail(id) {      //资讯
			window.location.href = "${baseURL}/news/detail?id=" + id;
		}
		function toRecommendDetail(id) { //荐读
			window.location.href = "${baseURL}/recommend/detail?id=" + id;
		}
		function toForumDetail(id) {     //家园
			window.location.href = "${baseURL}/forum/detail?id=" + id;
		}
				
	</script> 	
</body>
</html>