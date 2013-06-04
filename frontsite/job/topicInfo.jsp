<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ include file="/commons/taglibs.jsp"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="/css/jobBbs/common.css" rel="stylesheet" type="text/css" />
		<!-- <link href="/css/style.css" rel="stylesheet" type="text/css" /> -->
		<!-- <link href="/css/job/job.css" rel="stylesheet" type="text/css" /> -->
		<script type="text/javascript" src="/js/jobBbs/ckeditor.js"></script>
		<script type="text/javascript" src="/js/jobBbs/sample.js"></script>
		 
		<link href="/css/jobBbs/forumdisplay.css" rel="stylesheet"
			type="text/css" /> 
		<script type="text/javascript" src="../fckeditor/fckeditor.js"></script>
		<script type="text/javascript" src="/js/jsIfUtils.js"></script>
		<script type="text/javascript" src="/js/jquery.js"></script>
		<script type="text/javascript" src="/js/jobBbs/common.js"></script>
		<script type="text/javascript" src="/js/jobBbs/public.js"></script>
		<script src="/js/jquery.js" type="text/javascript"></script>
		<script src="/js/jquery.form.js" type="text/javascript"></script>
	</head>
	<script language="javascript">
	function btnSub(){
		var editor=CKEDITOR.instances.ckeditor01;
		if(editor.getData()==""){
			alert("请输入回复内容!");
			return;
		}
		if(editor.getData().length>1500){
			alert("回复内容过长，请控制字符长度!");
			return;
		}
		$("#replyForm").submit();
	}
	
 </script>
	<body>
		<c:if test="${!empty msg}">
			<script>
				alert("回复成功，正待管理员审核!");
			</script>
		</c:if>
		<c:if test="${!empty message}">
			<script>
				alert("您还未登陆或者登陆超时,请重新登陆!");
			</script>
		</c:if>
		<jsp:include page="/commons/mstop.jsp" />
		<div class="main">
			<div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - <a href="${contextPath }/hrBbsAction.do?method=list">招聘BBS</a> - 查看帖子</div>
		</div>
		<div class="wrap_2left">
			<!--左侧sied开始-->
			<div class="w210 fleft">
				<jsp:include page="/job/job_lmenu.jsp" />
				<div class="blank5"></div>
				<iframe target="_blank" id="leftlogin" name="leftlogin"
					marginWidth="0" marginHeight="0"
					src="${contextPath }/job/job_login.jsp" frameBorder="0" noresize
					width="100%" height="198" scrolling="no"></iframe>
				<div class="blank5"></div>
				<jsp:include page="faq.jsp" />
			</div>
			<!--左侧sied结束-->

			<!--右侧sied开始-->
				<div class="w706 fright" id="postlist" >
					<table class="ad" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td height="50" width="90%">
									<div style="float: left">
										${topic.postTitle }
										<c:if test="${topic.postReadcount > 500}">
											<img alt="热帖" title="热帖" src="/images/jobBbs/huo.gif"/>
										</c:if>	
									</div>
								</td>
								<td width="10%">
									<c:if test="${topic.postIssticky eq '0'}">
										<div id="threadstamp"><img height="40" width="60" src="/images/jobBbs/zhiding.gif"/></div>
									</c:if>	
								</td>
							</tr>
							<tr>
								<td height="20" class="plc" colspan="2">
									<div style="height:1px; border-bottom:8px solid #eee;">
								</td>
							</tr>
							<tr>
								<td width="90%">
									<div class="hm">
										<span class="xg1">查看:</span>
										<span class="xi1">${topic.postReadcount }</span><span class="pipe">|</span><span
											class="xg1">回复:</span>
										<span class="xi1">${topic.postReplycount }</span>
										<span class="pipe">&nbsp;&nbsp;&nbsp;&nbsp;</span>
										<span class="xg1">发布人：</span>
										<span class="xi1">
											<c:choose>
												<c:when test="${fn:contains(topic.postAdminname,'@')}">
													${fn:split(topic.postAdminname,'@')[0]}
												</c:when>
												<c:otherwise>
													HR
												</c:otherwise>
											</c:choose>
										</span>
										<span class="pipe">|</span>
										<span class="xg1">发布日期：</span>
										<span class="xi1"><bean:write name="topic" property="postCreatetime" format="yyyy-MM-dd HH:mm:ss"/></span>
									</div>
								</td>
								<td align="right" valign="middle">
									<span class="pgb y" style="float: right;"> <a href="#" onclick="javascript:history.go(-1);">返 回</a> </span>
								</td>
							</tr>
							<tr>
								<td height="10" class="plc" colspan="2"></td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="padding-bottom: 100px;">${topic.postContent }<br />
										<c:if test="${filelist != null }">
											<div style="border: 1px dashed #eee;margin-top: 40px;">
												附件：
												<logic:iterate id="file" name="filelist">
												 <br/>
													<a href="${ctx }/job/jobBbsfileout.jsp?id=${file.id}" class="regular">
													<img src="${ctx }/images/jobBbs/file.png" width="24" height="20" title="点击下载附件"/>${file.fileName }</a>
												 <br />
												</logic:iterate>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
							<td class="plc"></td>
							<tr>
								<td class="plc" colspan="2">
									<div style="height:1px; border-bottom:25px solid #0066CC;padding-top: 10px;padding-bottom: 20px;">
								</td>
							</tr>
						</tbody>
					</table>
					<table cellspacing="0" cellpadding="0">
					  <logic:iterate id="data" name="replyList" indexId="num">
						<tbody>
							<tr>
								<td width="30" align="left" style="font-style: italic">
									${num+1 }楼
								</td>
								<td class="plc ptm pbn" align="left">
										${data.replyContent }
								</td>
							</tr>
							<tr>
								<td class="pls ptm pbm" colspan="2">
									<div class="hm">
										<span class="xg1">
											<c:choose>
												<c:when test="${fn:contains(data.replyAdminname,'@')}">
													回复人：
												</c:when>
												<c:otherwise>
													<font color="red" style="font-weight: bold;">管理员：</font>
												</c:otherwise>
											</c:choose>
										</span>
										<span class="xi1">
											<c:choose>
												<c:when test="${fn:contains(data.replyAdminname,'@')}">
													${fn:split(data.replyAdminname,'@')[0]}
												</c:when>
												<c:otherwise>
													HR
												</c:otherwise>
											</c:choose>
										</span>
										<span class="pipe">|</span>
										<span class="xg1">回复时间：</span>
										<span class="xi1"><bean:write name="data" property="replyCreatetime" format="yyyy-MM-dd HH:ss:mm"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="plc" colspan="2">
									<div style="border-bottom:3px dashed #eee; margin-bottom: 40px;">
								</td>
							</tr>
						</tbody>
						</logic:iterate>
					</table>
					
					<form id="replyForm" style="margin-top:10px;" action="${ctx }/hrBbsAction.do?method=reply" method="post">
					<table cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td align="left">
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
												height:150
											});
									</script>
								</td>
								<td valign="bottom" align="left">
									<input type="hidden" name="postId" value="${topic.postId }"/>
									<input type="button" value=" 发表回复 " onclick="btnSub()" style="color:#FFFFFF !important;background-color:#0066CC;box-shadow:0 1px 0 #E5E5E5;cursor:pointer;border:1px solid #235994;font-family: '宋体';margin-top: 5px;margin-left: 5px;height: 26px;"/></br>
									<input type="button" value=" 返    回 " onclick="javascript:history.go(-1);" style="box-shadow:0 1px 0 #E5E5E5;cursor:pointer;border:1px solid #999999;font-family: '宋体';margin-top: 5px;margin-left: 5px;height: 26px;"/>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
			<!--右侧sied结束-->
			<div class="clearfloat"></div>
			<!--清除浮动-->
		</div>
		<div class="blank5"></div>
		<jsp:include page="/commons/msbottom.jsp" />
	</body>
</html>