<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%	 
  String showSize ="30";
  String whichCat = "wsyyt_sjzq_hdxw";
  String catName = "最新动态";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp">金管家手机证券</a>-最新动态 </div>
  <div class="blank5"></div>
</div>
<div class="mobox">
  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp"/>
  </div>
  
  <paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(whichCat, request)%>">
  
<div class="moright">

<div class="rtit2">最新动态</div>
  		<ul class="newlist">
   	 
			<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<li><span><%=DocumentHelper.getUploadDate(doc,"yyyy/MM/dd") %> </span>·
		<a title="<%= title %>" href="${contextPath }/cms/CmsnewsContent.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
			        <span class="bold"></span> <%= StringUtils.subString(title,35,"...")+"&nbsp;&nbsp;"%> </a> 
			       
		</li>
		
        </paging:pageRow>
	
</ul>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="100%" align="center"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/>
    </td>    
  </tr>
</table>      
  </div></paging:page> 
  <div class="clearfloat"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>