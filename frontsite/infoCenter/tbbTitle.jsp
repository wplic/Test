<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
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
<bean:parameter id="category" name="whichCat" value="zxzx_sb_sbxw" />
<bean:parameter id="showSize1" name="showSize" value="15" />
<bean:parameter id="titleWidth" name="titleWidth" value="50"/>
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
	int ipic=3;
	if(request.getParameter("ipic")!=null&&!request.getParameter("ipic").equals(""))
    ipic=Integer.parseInt(request.getParameter("ipic").trim());
%>
<body>
     <paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		<td width="28%"><img src="/pic/infoCenter/gsyw0<%=ipic %>.jpg"/></td>
		
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						String detailPage = "/cms/newsContent.jsp?docId="+doc.getId() ;
					%>
									         <td width="72%" valign="top" class="font_43">
				         <p class="font14 red bold" style="line-height:30px"><%=DocumentHelper.getTitle(doc,60)%></p>
				            <p class="lh21 inden25">
				             <%
		       					String content=DocumentHelper.getContent(doc);
								content="&nbsp;&nbsp;&nbsp;"+content;
		      					content=StringUtils.subString(content,200,"......");
					            out.println(content);
			      %> 
				      
				         <span class="red"><a href="<%=detailPage %>"  target="_blank">[全文]</a></span></p>
				        </td>
		</paging:pageRow>
		</tr>
		</table>
</paging:page>
</body>
</html>