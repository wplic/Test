<%@page import="com.css.cms.document.util.DocumentHelper"%>
<jsp:directive.page import="com.cssweb.common.util.HTMLutils"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<bean:parameter id="category" name="whichCat" value="gygf_hhyj" />
<%
	if(category==null){
		%>
<script type="text/javascript">
	alert('您请求的资讯栏目错误');
</script>
	<%
		return ;
	}
	
	int i=0;
%>
<body>
 <paging:page count="false" row="1"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
<table width="95%" align="center"  border="0" cellspacing="0" cellpadding="0" class="lh27"
				style="text-indent:24px;">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						i++;
						String detailPage = "/commons/infoList.jsp?docId="+doc.getId() ;
						String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								
								content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
					%>
					<tr>
					<td width="70%" class="lh24" style="word-break:break-all">
					
					<%
						out.print(content);
					%></td>
			        
			        </tr>
			        <tr>
			        	<td align="right" style="padding-right: 20px">
			        		&nbsp;&nbsp;&nbsp;&nbsp;
			        		<%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%>
			        	</td>
			        </tr>
		</paging:pageRow>
        </table>
</paging:page>
</body>
</html>