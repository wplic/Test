<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
	<link href="/css/style.css" rel="stylesheet" type="text/css" />
	<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
	 <link href="/js/jobBbs/sample.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/js/jobBbs/ckeditor.js"></script>
	<script type="text/javascript" src="/js/jobBbs/sample.js"></script>
	<script type="text/javascript" src="/js/jsIfUtils.js"></script>
	<script type="text/javascript" src="/js/jquery.js"></script>
</head>
 <script language="javascript">
 	function checkSubmit(){
 		if($("input[name='postTitle']").val().length<1){
 			alert("请输入帖子标题!");
 			return;
 		}
 		if($("input[name='postTitle']").val().length>800){
 			alert("标题过长，请控制字符长度!");
 			return;
 		}
 		var editor=CKEDITOR.instances.ckeditor01;
 		//var editor = CKEDITOR.replace('ckeditor01');
 		if (editor.getData()=="") {
 			alert("请输入帖子内容!");
 			editor.Focus(); 
 			return;
 		}
 		if(editor.getData().length>1800){
 			alert("内容过长，请控制字符长度!");
 			editor.Focus(); 
 			return;
 		}
 		$("#postContent").val(editor.getData());
 		document.getElementById("form1").submit();
 	}
 </script>
<body>
<c:if test="${!empty msg}">
	<script>
		alert("帖子发布成功，正待管理员审核!");
		window.location.href="${ctx}/hrBbsAction.do?method=list";
	</script>
</c:if>
<c:if test="${!empty message}">
	<script>
		alert("您还未登陆或者登陆超时,请重新登陆!");
	</script>
</c:if>	
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - <a href="${contextPath }/hrBbsAction.do?method=list">招聘BBS</a> - 发布新帖</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%"  height="198" scrolling="no" ></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  	<div class="w706 fright">
  		<form id="form1" action="${ctx }/hrBbsAction.do?method=saveOrUpdate" method="post">
			<h1 class="samples">
				发布新帖
			</h1>
			<div class="description">
				
				<p>主题类型：
					<input type="radio" name="postSection" value="1" checked/>问答&nbsp;&nbsp;
				   <input type="radio" name="postSection" value="2"/>笔试&nbsp;&nbsp;
				   <input type="radio" name="postSection" value="3"/>面试&nbsp;&nbsp;
				   <input type="radio" name="postSection" value="4"/>网申&nbsp;&nbsp;
				   <input type="radio" name="postSection" value="5"/>其他
				</p>
				<br />
				<p>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" name="postTitle" size="50" style="height: 20px;" value="${hrBbsPosts.postTitle }"/></p>
				
			</div>
		
			<div id="alerts" style="color: Red;">
				<noscript>
					<p>
						<strong>CKEditor requires JavaScript to run</strong>. In a browser with no JavaScript
						support, like yours, you should still see the contents (HTML data) and you should
						be able to edit it normally, without a rich editor interface.
					</p>
				</noscript>
			</div>
				<p>
					<label for="editor1" style="padding: 10px 10px 2px">
						内容（2000字以内）：</label>
						<textarea cols="80" id="ckeditor01" name="replyContent" rows="10"></textarea>
						 <script type="text/javascript">
							CKEDITOR.replace( 'ckeditor01',
								{
									extraPlugins : 'uicolor',
									toolbar :
									[
										[ 
											'Bold', 'Italic', 'Underline','Strike','-','RemoveFormat'
										],
										['NumberedList', 'BulletedList','-', 'Outdent','Indent'],
										['Styles','PanelTitle'],
										['Font','FontSize'],
										['TextColor','BGColor'],
										['Preview','Print'],
										[ 'UIColor' ]
									],
									height:200
								});
						</script>
				</p>
				<p>
					<input type="hidden" id="postId" name="postId" value="${hrBbsPosts.postId }"/>
					<input type="hidden" id="postContent" name="postContent" value="${hrBbsPosts.postContent }"/>
					<input type="button" value=" 发表帖子 " onclick="checkSubmit()" style="color:#FFFFFF !important;background-color:#0066CC;box-shadow:0 1px 0 #E5E5E5;cursor:pointer;border:1px solid #235994;font-family: '宋体';margin-top: 5px;margin-left: 5px;height: 26px;"/>
					<input type="button" value=" 返   回 " onclick="javascript:history.go(-1);" style="box-shadow:0 1px 0 #E5E5E5;cursor:pointer;border:1px solid #999999;font-family: '宋体';margin-top: 5px;margin-left: 5px;height: 26px;"/>
				</p>
			</form>
  </div>
  
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>