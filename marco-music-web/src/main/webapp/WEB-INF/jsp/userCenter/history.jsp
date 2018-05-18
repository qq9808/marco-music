<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="in-div2" class="page-container in-div">
	<div class="container">
    	<div class="row">
        	<div class="span12 page-content">       	
        		<ul class="tabs-nav">
                    <li id="title1" class="active" onclick="changeTab('1')"><a href="javascript:void(0)">音乐厅</a></li>
                    <li id="title2" onclick="changeTab('2')"><a href="javascript:void(0)">家园</a></li>	                    
                </ul>
                <div class="tabs-container">
	               <div id="content1" class="tab-content tab-show">
				       <ul id="singing_ul" class="ul-style">		    		
				       </ul>			    	
			       </div>	
				    <div id="content2" class="tab-content tab-close">
				    	<ul id="forum_ul" class="ul-style">		    		
				    	</ul>		    	
				    </div>     	                    
	        	</div>	          	
        	</div>
    	</div>
	</div>
</div> 
        	

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

$(function() {
		
	//历史发帖			
	$.ajax({
		type : 'POST',
		url : '${baseURL}/user/history',
		data : {id : "${user.id}"},     	
		dataType : 'json',
		success : function(result) {
			
			if(result.state == 200) { 					
				
				html1 = "";
				html2 = "";
				
				for(var i = 0; i < result.singingList.length; i++) {
					html1 += "<li>" + "<a href='${baseURL}/singing/detail?id=" + result.singingList[i].id + "'>" + result.singingList[i].title + "</a>" + "</li>";
				}
				for(var i = 0; i < result.forumList.length; i++){
					html2 += "<li>" + "<a href='${baseURL}/forum/detail?id=" + result.forumList[i].id + "'>" + result.forumList[i].title + "</a>" + "</li>";
				}
										
				$("#singing_ul").html(html1);
				$("#forum_ul").html(html2);
 		  	}
			else{	  
				alert(result.msg);	   					
 			}
		}
	});					
});

</script>

