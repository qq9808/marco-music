<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="window-div" class="window-style">
	<p id="window-p">成功！</p>
	<button onclick="closeWindow()">确定</button>
</div>

<script type="text/javascript" src="${baseURL }/sources/js/jquery/jquery.min.js"></script>
<script type="text/javascript">

function showWindow(word) {
	$('#window-p').html(word);
	$('#window-div').addClass('show');
}

function closeWindow() {
	$("#window-div").removeClass("show");	
}
	
</script> 