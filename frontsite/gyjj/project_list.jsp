<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%@page import="com.cssweb.common.web.filter.SqlInjectValidate"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>广发证券</title>
</head>
<style>
.newsList{ padding:10px 14px; }
  .newsList li{ height:24px; border-bottom:1px dashed #ddd; line-height:24px; overflow:hidden; clear:both;}
  .newsList li strong{ margin-right:10px; float:left;}
  .newsList li img{ margin-top:8px;}
  .newsList li span{ margin-right:10px; margin-top:0; *margin-top:-24px; float:right; color:#7f7f7f;}
  .subnewsList li{ height:30px;line-height:30px;}
  .subnewsList li img{ margin-top:10px;}
  .subnewsList li span{margin-top:0; *margin-top:-30px;}
	 li{font-size:12px;font-family:Arial, Helvetica;}
	img{border:0px;}
	p{ text-indent:2em;}
	ul,li{list-style: none;}
	a:link,a:visited{color:#333; text-decoration:none;}
	a:hover{color:#C00; text-decoration:underline;}
	a:active {color:#000; text-decoration:none;}
	
	a.red:link,a.red:visited{color:#C00; text-decoration:none;}
	a.red:hover{color:#000; text-decoration:underline;}
	a.red:active {color:#000; text-decoration:none;}
 </style>
<bean:parameter id="category" name="whichCat" value="gyxm_xmjs" />
<bean:parameter id="item" name="item" value="1" />
<bean:parameter id="showSize1" name="showSize" value="15" />
<bean:parameter id="titleWidth" name="titleWidth" value="70"/>

<%
//sql注入检查
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(request.getParameter("category")!=null&&!request.getParameter("category").equals("")){
	if(sqlInjectValidate.vakidateSqlIfByUrl(request.getParameter("category"))){
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	 }
}
//下面是item是否为数字的验证
if(request.getParameter("item")!=null&&!request.getParameter("item").equals("")){
	if(sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("item"))){
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	 }
}
if(request.getParameter("showSize1")!=null&&!request.getParameter("showSize1").equals("")){
	if(sqlInjectValidate.vakidateSqlIfByUrl(request.getParameter("showSize1"))){
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	 }
}
if(request.getParameter("titleWidth")!=null&&!request.getParameter("titleWidth").equals("")){
	if(sqlInjectValidate.vakidateSqlIfByUrl(request.getParameter("titleWidth"))){
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	 }
}
%>
<%
	if(category==null){
		%>
<script type="text/javascript">
	alert('您请求的资讯栏目错误');
</script>
	<%
		return ;
	}
	
	int rowNum = Integer.parseInt(showSize1);
	int i=0;
%>
<body>
  <paging:page count="false" row="<%=rowNum%>"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">

       <ul class="newsList subnewsList">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						String detailPage = "/gyjj/downloadInfoShow.jsp?docId="+doc.getId() ;
					%>
					<li>
					<a href="<%=detailPage %>" target="_blank">
					<strong><img src="${contextPath }/gyjj/images/newsList_ico.jpg" /></strong>
					<%=DocumentHelper.getTitle(doc,Integer.parseInt(titleWidth))%></a>
					<span><%=DocumentHelper.getUploadDate(doc,"yy/MM/dd")%></span></li>
		</paging:pageRow>
		</ul>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="color-border-title2">
  <tr> 
    <td width="40%" align="right"><paging:pageInfo empty="没有记录"/></td>
    <td width="60%" align="center"><paging:pageLink pages="15" hasPageNo="true" mode="text" hasGo="false"/></td>    
  </tr>
</table>
</paging:page>
</body>
</html>