<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<bean:parameter id="category" name="whichCat" value="zxzx_gp_gsyw" />
<bean:parameter id="showSize1" name="showSize" value="4" />
<bean:parameter id="titleWidth" name="titleWidth" value="60"/>
<%
	int rowNum = Integer.parseInt(showSize1);
	int i=0;
%>
<body>
 <paging:page count="false" row="<%=rowNum%>"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						i++;
						
						//String detailPage = "/news/NewsContent.jsp?docPara="+docPara ;
						String detailPage = "/cms/newsContent.jsp?docId="+doc.getId() ;
						if(i==1){
						%>
						<li class="bold">
					<table width="95%">
					<tr>
					<td>
						 <a href="<%=detailPage %>" target="_blank"><%=DocumentHelper.getTitle(doc,Integer.parseInt(titleWidth))%></a>
					</td>
					<td align="right"><%=DocumentHelper.getUploadDate(doc,"yy/MM/dd")%></td>
					</tr>
					</table>
			        </li>

						<li class="inden25">
						 <div style="word-wrap:break-word;">
						 <a href="<%=detailPage %>" target="_blank">
						 <%
		       					String content=DocumentHelper.getContent(doc);
								content="&nbsp;&nbsp;&nbsp;"+content;
		      					content=StringUtils.subString(content,120,"   [全文]");
					            out.println(content);
			                  %>
						 </a>
						 </div>
						 </li>
						<%
						}else{
					%>
					<li class="li_list2">
					<table width="95%">
					<tr>
					<td>
					<a href="<%=detailPage %>" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;<%=DocumentHelper.getTitle(doc,Integer.parseInt(titleWidth))%></a>
					</td>
					<td align="right"><%=DocumentHelper.getUploadDate(doc,"yy/MM/dd")%></td>
					</tr>
					</table>
			        </li>
			        <%} %>
		</paging:pageRow>
		 <%if(i< Integer.parseInt(showSize1)){ 
			  	for(int j=0;j<Integer.parseInt(showSize1)-i;j++){
			  %>
	  		
				  	<li>&nbsp;</li>
			  <%} 
			  }
			  %>
</paging:page>
</body>
</html>