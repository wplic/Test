<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="com.cssweb.common.toDbLob.pojo.FileBlob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.cssweb.otc.pojo.OtcDocument"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券柜台交易产品</title>
		<link href="${ctx }/css/otc/common.css" rel="stylesheet" type="text/css" />
		<script>
		</script>
	</head>
	<%
		OtcDocument otcDocument = (OtcDocument) request.getAttribute("otcDocument");
	%>
	<body>
		<jsp:include page="${ctx}/commons/mstop.jsp" />
		<div class="main">
		<div class="gtjy_l_t"><span>当前位置：</span><a href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList">广发OTC首页 </a> > ${pageTile }详情</div>
			<h2 align="center" style="font-weight: bold;font-size: 15pt;">${otcDocument.title}</h2>
		<div style="text-align:center; margin:10px 0;">
		  <%if(otcDocument!=null && !"".equals(otcDocument.getUpddate())){ %>
		  	发布时间：<%=otcDocument.getUpddate() %>
		  <%} %>
		  </div>
		  <div style="text-align:center; margin:10px 0;">
		  <%if(request.getAttribute("fileBlob")!=null){ %>
		  	<a href="${ctx }/otc/fileout.jsp?id=${fileBlob.id }" target="_blank">
		  		<img alt="下载文档" src="${ctx }/images/otc/ico_06.gif"/>
		  	</a>
		  <%} %>
		  </div>
		<div style="width: 100%;">
			<div style="width: 75%;padding-left: 12.5%;" id="contentDiv">	
			<%if(request.getAttribute("textBlob")!=null){ 
					TextBlob textBlob = (TextBlob)request.getAttribute("textBlob");
		 			String content = new String(textBlob.getSource(),"UTF-8");
		 		%>
		 				<script>
		 					document.getElementById("contentDiv").innerHTML='<%=content %>';
		 				</script>
		 		<%}  %>
			 </div>
		 </div>
		<div align="center"><input type="button" onclick="javascript:window.close();" value="关  闭"/> </div>
		<div class="foot">
			<jsp:include page="${ctx }/commons/msbottom.jsp" />
		</div>
	</body>
</html>