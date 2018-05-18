<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sources/jstl/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>vita音乐-音乐厅</title>
	
	<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//v3.bootcss.com/assets/css/docs.min.css">
	
	<link rel="stylesheet" href="${baseURL}/sources/css/style.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/marco_src.css" />
	<link rel="stylesheet" href="${baseURL}/sources/css/singing/cover-audio.css" />
	
	<link href="${baseURL}/sources/UMEditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${baseURL}/sources/UMEditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${baseURL}/sources/UMEditor/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${baseURL}/sources/UMEditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${baseURL}/sources/UMEditor/umeditor.min.js"></script>
    <script type="text/javascript" src="${baseURL}/sources/UMEditor/lang/zh-cn/zh-cn.js"></script>  

	<style type="text/css">
	.text-danger {
		color: red;
	}
	.control-label {
		text-align: left !important; 
	}
	#resultBox {
		width: 100%;
		height: 300px;
		border: 1px solid #888;
		padding: 5px;
		overflow: auto;
		margin-bottom: 20px;
	}
	.uploaderMsgBox {
		width: 100%;
		border-bottom: 1px solid #888;
	}
	[act=cancel-upload] {
		text-decoration: none;
		cursor:pointer;
	}
	.control-group {
	  margin-bottom: 20px;
	  *zoom: 1;
	}
	</style>
</head>
<body>

<div class="search-area-wrapper"></div>

<div class="container bs-docs-container">
			
	<div class="page-container">
	    <div class="container">
		    <div class="row">
		        <div class="span12 page-content">			         		            
		            <div id="respond">
		            	<div style="margin-bottom: 1.2rem;">                           
                            <input id="uploadVideoNow-file" type="file" style="font-size: 1rem;"/>
                            <span id="upload-progress"></span>                                                
                        </div>			                    		
                        <div style="margin-bottom: 1.2rem;">
                            <span style="font-size: 1rem;">标题：</span> <br> 
                            <input id="title" name="title" type="text" class="span4 title-input" maxlength="50" placeholder="">
                        </div>
                        <div>
                            <span style="font-size: 1rem; float: left;">内容：</span> <br> 
                            <script type="text/plain" id="myEditor" class="content-input"></script>
                        </div>
                        <div class="submit-div2"> 
                        	<button id="submit" class="forum-submit" onclick="deliver()" style="margin-left: 0;">提交</button>
                        	<button id="submit" class="forum-submit" onclick="cancel()">取消</button>
                        </div>		                           	                    	
		            </div>		            	            	            		            
		        </div>
		    </div>
	    </div>
    </div>
			
</div>

<!-- <script src="//code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script src="//imgcache.qq.com/open/qcloud/js/vod/crypto.js"></script>
<script src="//imgcache.qq.com/open/qcloud/js/vod/sdk/ugcUploader.js"></script>

<script type="text/javascript">

	//实例化编辑器
	var um = UM.getEditor('myEditor', {
		autoHeightEnabled: false
	});

	var index = 0;
	var cosBox = [];
	
	var type = 1;       //1表示mp3,2表示mp4
	var videoID = "";
	var videoName = "";
	var videoURL = "";
	
	//获取签名
	var getSignature = function(callback){
		$.ajax({
			url: '${baseURL}/singing/signature',
			type: 'POST',
			dataType: 'json',
			success: function(res){
				if(res && res.signature) {
					callback(res.signature);
				} else {
					return '获取签名失败';
				}				
			}
		});
	};

	//添加上传信息模块
	var addUploaderMsgBox = function(type) {
		
		var html = '<div class="uploaderMsgBox" name="box'+index+'">';
		
		html += '上传进度：<span name="videocurr'+index+'">0%</span>' + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		        + '上传结果：<span name="videoresult'+index+'"></span>' + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		        + '<a href="javascript:void(0);" name="cancel'+index+'" cosnum='+index+' act="cancel-upload">取消上传</a>';
				
		$('#upload-progress').html(html);
		return index++;
	};

	//上传视频
	$('#uploadVideoNow-file').on('change', function(e) {
		
		var num = addUploaderMsgBox();    //添加上传信息模块
		var videoFile = this.files[0];
		var resultMsg = qcVideo.ugcUploader.start({
			videoFile: videoFile,
			getSignature: getSignature,
			allowAudio: 1,
			success: function(result){
				
				$('[name=videoresult'+num+']').text('上传成功');
				$('[name=cancel'+num+']').remove();
				cosBox[num] = null;
			},
			error: function(result){
				
				$('[name=videoresult'+num+']').text('上传失败>>'+result.msg);			
			},
			progress: function(result){
				
				$('[name=videoname'+num+']').text(result.name);
				$('[name=videosha'+num+']').text(Math.floor(result.shacurr*100)+'%');
				$('[name=videocurr'+num+']').text(Math.floor(result.curr*100)+'%');
				$('[name=cancel'+num+']').attr('taskId', result.taskId);
				cosBox[num] = result.cos;
			},
			finish: function(result){
				
				videoID = result.fileId;
				videoName = result.videoName;
				videoURL = result.videoUrl;
				
				//$('[name=videofileId'+num+']').text(result.fileId);
				//$('[name=videourl'+num+']').text(result.videoUrl);
				console.log(result.videoName);
			}
		});
		$('#form1')[0].reset();
	});
		
	//取消上传
	$('#upload-progress').on('click', '[act=cancel-upload]', function() {
		var cancelresult = qcVideo.ugcUploader.cancel({
			cos: cosBox[$(this).attr('cosnum')],
			taskId: $(this).attr('taskId')
		});
	});	
	
	function deliver() {
	   	
		var title = $("#title").val();
		var content = UM.getEditor('myEditor').getContent();	
		
		if(videoURL == "") {
			alert("您还没上传音频呢");
        	return false;
		}
		if(title == ""){
        	alert("忘记写标题啦！");
        	return false;
        }			
		if(content == ""){
        	alert("忘记填写内容啦！");
        	return false;
        }
					
		$("#submit").removeAttr("onclick");
		
		$.ajax({
   			type : 'POST',
   			url : '${baseURL}/singing/save',
   			data : {
   				title : title, 
   				content : content, 
   				type : type, 
   				videoID : videoID, 
   				videoName : videoName, 
   				videoURL : videoURL
   			},     	
   			dataType : 'json',
   			success : function(result) {
   				
   				if(result.state == 200) { 					
   					alert("发表成功！");
   					setTimeout(function() {
   						window.location.href = "${baseURL}/singing/page";
   				    },1);	   					
   	 		  	}
   				else{	  
   					$("#submit").attr("onclick", "deliver()");
   					alert(result.msg);	   					
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
</body>
</html>