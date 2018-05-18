<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="header-wrapper">
	<header>
		<div class="container">	
		    <div class="logo-container">
			    <a href="${baseURL}"  title="Knowledge Base Theme" style="font-size: 1.5rem;">多维</a> 
			    <span class="tag-line">modernist music in China</span>
		    </div>
		    <nav class="main-nav">
			    <div class="menu-top-menu-container">
				    <ul id="menu-top-menu" class="clearfix">
				        <li><a href="${baseURL }">首页</a></li>
				        <li><a href="${baseURL}/singing/page">音乐厅</a></li>
				        <li><a href="${baseURL}/news/page">资讯</a></li>
				        <li><a href="${baseURL}/recommend/page">荐读</a></li>
				        <li><a href="${baseURL}/forum/page">家园</a></li>	
				        <li><a href="javascript:void(0)" onclick="more()">更多</a></li>				        
				    </ul>
			    </div>
		    </nav>
		</div>
	</header>
</div>

<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery.min.js"></script>
<script type="text/javascript">
	
	function more() {
		showWindow("更多板块正在策划、开发中，敬请期待！");
	}

</script> 


