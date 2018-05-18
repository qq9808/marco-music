<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!doctype html>
<html lang="ch">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="现音中国后台">
    <meta name="keywords" content="现音中国后台 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    
    <title>现音中国-资讯</title>
    
    <script src="${baseURL}/sources/js/jquery.min.js"></script>
    <script src="${baseURL}/sources/js/bootstrap.min.js"></script>  
    
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/slide.css" />
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/jquery.nouislider.css">
    <link rel="stylesheet" type="text/css" href="${baseURL}/sources/css/style.css">
</head>

<body>
	<div id="wrap">
        <!-- 左侧菜单栏目块 -->
    	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%>
        <div id="rightContent" style="background-color: #ffffff;">
            <div class="tab-content">                                                       	            
         		<div role="tabpanel" class="tab-pane active" id="scho">
	
					<div class="check-div form-inline">
					    <input type="text" class=" form-control input-sm " placeholder="输入标题搜索">&nbsp;&nbsp;&nbsp;&nbsp;
					    <button class="btn btn-white btn-xs">搜索 </button>
					    <button class="btn btn-white btn-xs" data-toggle="modal" data-target="#addUser">添加 </button>
					</div>
				    <table class="mytable" style="width: 100%;">
				    	<thead>
							<tr>
								<th width="150px">id</th>				
								<th width="150px">标题</th>
								<th width="150px">发布者</th>
								<th width="150px">发布时间</th>
								<th width="150px">操作</th>
							</tr>							
						</thead>
						<tbody>
							<c:forEach items="${list}" var="news">
								<tr class="order-item last">
									<td style="text-align:center;">${news.id}</td>
									<td style="text-align:center;">${news.title}</td>	
									<td style="text-align:center;">${news.adminName}</td>
									<td style="text-align:center;"><fmt:formatDate value="${news.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>		 
									<td align="center">
										<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseSchool">查看</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                    <button class="btn btn-danger btn-xs" onclick="deleteNews(${news.id})">删除</button>
									</td>	
								</tr>
							</c:forEach>
							<tr>
							<td colspan="6">
								<script type="text/javascript">
									var pageURL = baseURL + "/news/page";
								</script> 
								<%@ include file="/WEB-INF/jsp/common/page.jsp"%>    
							</td>
						</tr>							
						</tbody>
				    </table>
					
				    <!--弹出添加资讯窗口-->
				    <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
				        <div class="modal-dialog" role="document" style="width: 80rem; height: 50rem; margin:auto;">
				            <div class="modal-content" style="width: 80rem; height: 50rem; margin:auto;">
				                <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                    <h4 class="modal-title" id="gridSystemModalLabel">添加资讯</h4>
				                </div>
				                <div class="modal-body">
				                    <div class="container-fluid">
				                        <form class="form-horizontal">
				                            <div class="form-group ">
				                                <label for="sName" class="col-xs-3 control-label">资讯标题：</label>
				                                <div class="col-xs-8 ">
				                                    <input id="title" type="email" class="form-control input-sm duiqi" placeholder="输入标题"></input>
				                                </div>
				                            </div>
				                            <div class="form-group ">
				                                <label for="sName" class="col-xs-3 control-label">资讯内容：</label>
				                                <div class="col-xs-8 ">
				                                    <!-- <input type="email" class="form-control input-sm duiqi" id="sName" placeholder=""> -->
				                                    <textarea id="content" class="form-control duiqi" rows="10" placeholder="输入内容"></textarea>
				                                </div>
				                            </div>                           
				                        </form>
				                    </div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
				                    <button type="button" class="btn btn-xs btn-green" onclick="saveNews()">保存</button>
				                </div>
				            </div>
				        </div>
				    </div>
						
				    <!--弹出删除用户警告窗口-->
				    <!-- <div class="modal fade" id="deleteSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
				        <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
				                </div>
				                <div class="modal-body">
				                    <div class="container-fluid">删除后不可恢复，确定要删除吗？</div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
				                    <button type="button" class="btn btn-xs btn-danger">删除</button>
				                </div>
				            </div>
				        </div>
				    </div> -->				    				    
				</div>   	                                                                        
    		</div>
    	</div>
	</div>
	<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery-2.1.1.js"></script>
    <script type="text/javascript">
	    function saveNews() {
		   	
			var title = $("#title").val();
			var content = $("#content").val();	
			
			content = content.replaceAll("\n", "<br/>");
			
			if(title == ''){
	        	alert("您忘记写标题啦！");
	        	return false;
	        }			
			if(content == ''){
	        	alert("您忘记填写内容啦！");
	        	return false;
	        }
						
			$("#submit").removeAttr("onclick");
			
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/news/save',
	   			data : {title : title, content : content},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					alert("保存成功！");
	   					setTimeout(function() {
	   						window.location.reload();
	   				    },1);	   					
	   	 		  	}
	   				else{	  
	   					$("#submit").attr("onclick", "saveNews()");
	   					alert(result.msg);	   					
	   	 			}
	   			}
	   		});
		}
		String.prototype.replaceAll = function(s1,s2){ 
			return this.replace(new RegExp(s1,"gm"),s2); 
		} 
		
	    function deleteNews(id) {    		    	
	    	if (confirm("是否要删除这条资讯?")) {
		    	$.ajax({
		   			type : 'POST',
		   			url : '${baseURL}/news/delete',
		   			data : {id : id},     	
		   			dataType : 'json',
		   			success : function(result) {
		   				
		   				if(result.state == 200) { 					
		   					alert("删除成功！");
		   					setTimeout(function() {
		   						window.location.reload();
		   				    },1);	   					
		   	 		  	}
		   				else{	  		   					
		   					alert(result.msg);	   					
		   	 			}
		   			}
		   		});	    	
	    	}
	    }
    </script>
</body>
</html>