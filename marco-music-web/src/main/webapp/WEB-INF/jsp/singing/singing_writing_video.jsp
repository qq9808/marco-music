<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>vita音乐-音乐厅</title>
	
	<link href="http://cloud.youku.com/assets/lib/bootstrap2.1.0/css/bootstrap.css" rel="stylesheet">
	<link href="http://cloud.youku.com/assets/lib/bootstrap2.1.0/css/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" href="${baseURL}/sources/css/singing/cover-video.css" />
	
	<link href="${baseURL}/sources/UMEditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${baseURL}/sources/UMEditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${baseURL}/sources/UMEditor/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${baseURL}/sources/UMEditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${baseURL}/sources/UMEditor/umeditor.min.js"></script>
    <script type="text/javascript" src="${baseURL}/sources/UMEditor/lang/zh-cn/zh-cn.js"></script>   
	
	<!-- <script src="http://cloud.youku.com/assets/lib/jquery-1.8.1.min.js"></script> -->
	<script src="http://cloud.youku.com/assets/lib/uploadjs.php"></script>
	<script>
	
		var USE_STREAM_UPLOAD = true;
		jQuery(document).ready(function(){ 
			var param = {
				client_id: "46233d5303c4e1fa",
				access_token: "${access_token}",     //access_token
				completeCallback: "uploadComplete"
			};
			youkuUploadInit(param);
		});
	
		function uploadComplete(data){
				
			console.dir(data);
			
			var type = 2;     //1表示mp3,2表示mp4
			
			var title = $("#real-title").val();
			var content = UM.getEditor('myEditor').getContent();		
			var videoID = data.videoid;
										
			$.ajax({
	   			type : 'POST',
	   			url : '${baseURL}/singing/save',
	   			data : {title : title, content : content, videoID : videoID, type : type},     	
	   			dataType : 'json',
	   			success : function(result) {
	   				
	   				if(result.state == 200) { 					
	   					alert("发表成功！");
	   					setTimeout(function() {
	   						window.location.href = baseURL + "/singing/page";
	   				    },1);	   					
	   	 		  	}
	   				else{	  
	   					alert(result.msg);
	   					window.location.reload();
	   	 			}
	   			}
	   		});						
		}	
		
		String.prototype.replaceAll = function(s1,s2){ 
			return this.replace(new RegExp(s1,"gm"),s2); 
		} 
		
		function cancel() {
			window.location.href = "${baseURL}/singing/page";
		}		
	</script>
</head>
<body>
	<div id="youku-upload">
		<div class="container">
			<div class="well">
				<h3 style="text-align: center;">上传说明</h3>
				<ul>
					<li>vita音乐目前使用的视频平台是 <strong>优酷视频</strong></li>
					<li>最大支持上传<strong>1 GB</strong>的视频文件</li>
					<li>视频上传成功后需要通过优酷的审核方可播放，审核时间为几分钟到几小时，亲们请耐心等待</li>
				</ul>
			</div>
			<form class="well form-horizontal" name="video-upload">				
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="spanSWFUploadButton">选择文件：</label>
						<div id="uploadControl" class="controls"></div>
					</div> 
					<div class="control-group">
						<label class="control-label">标题：</label>
						<div class="controls">
							<input type="text" class="input-xlarge title-input" id="real-title" name="real-title">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">内容：</label>
						<div class="controls">
							<script type="text/plain" id="myEditor" class="content-input"></script>
						</div>
					</div>
					
															
					<!-- 隐藏部分 -->
					<div class="control-group ">
						<label class="control-label" for="input01">标题：</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="input01" name="title">
						</div>
					</div>
					<div class="control-group ">
						<label class="control-label" for="textarea">简介：</label>
						<div class="controls">
							<textarea class="input-xlarge" id="textarea" rows="9" name="description"></textarea>
						</div>
					</div>
					<div class="control-group ">
						<label class="control-label" for="input02">标签：</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="input02" name="tags">
								<span class="help-inline"></span>
						</div>
					</div>
					<div class="control-group ">
						<label class="control-label" for="category-node">类别：</label>
						<div class="controls">
							<select id="category-node" name="category" ></select>
						</div>
					</div> 					
					<div class="control-group ">
						<label class="control-label">版权所有</label>
						<div class="controls">
							<label class="radio inline">
								<input type="radio" name="copyright_type" id="copyright_type2" value="original" checked>原创</label>
							<label class="radio inline"><input type="radio" name="copyright_type" id="copyright_type1" value="reproduced">转载</label>
						</div>
					</div>
					<div class="control-group ">
						<label class="control-label">视频权限</label>
						<div class="controls">
							<label class="radio inline">
								<input type="radio" name="public_type" id="public_type1" value="all" checked>公开
							</label>
							<label class="radio inline">
								<input type="radio" name="public_type" id="public_type2" value="friend">仅好友
							</label>
							<label class="radio inline">
								<input type="radio" name="public_type" id="public_type3" value="password">输入密码观看 
							</label>
							<label class="radio inline" style="display:none" id="passwrod">
								<input type="text" class="input "name="watch_password">
							</label>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary start" id="btn-upload-start">
							<i class="icon-upload icon-white"></i>
							<span>上传并提交</span>
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary start" onclick="cancel()">取消</button>
					</div>
				</fieldset>
			</form>
			<div class="row" >
				<div class="span5" id="upload-status-wraper" ></div>
			</div>			
		</div>
		<div id="complete"></div>
		<div id="login" style="width:100%;height:100%;position:fixed;z-index:999;left:0px;top:0px;overflow:hidden;display:none;"></div>
	</div>
	
	<script type="text/javascript">
	
		//实例化编辑器
	    var um = UM.getEditor('myEditor', {
	    	autoHeightEnabled: false
	    });
	
		window.onload = function() {   						
			$('#textarea').val('vita音乐');
			$('#input02').val('音乐 自拍 vita');
			$('#category-node').val('Music');
			$('#hide').addClass('disable-show');
		}
	</script>
</body>
</html>
