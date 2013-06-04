<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"    %>
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
<bean:parameter id="category" name="whichCat" value="zqyj_yjpg_gfyj" />
<bean:parameter id="showSize1" name="showSize" value="2" />
<bean:parameter id="titleWidth" name="titleWidth" value="10"/>
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
%>
<body>
     <paging:page count="false" row="<%=rowNum%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<table width="95%" align="center" class="mt10 lh25">
				
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						String detailPage = "/commons/yjbgContent.jsp?docId="+doc.getId() ;
						if(category.indexOf("nbzx_jjgs")>=0||category.indexOf("zqyj_yjbg_")==0||category.equals("blcj_nbzx_cyb")||category.equals("blcj_nbzx_gcjcck")||category.equals("blcj_nbzx_sxzqcc")||category.equals("blcj_nbzx_zgsxcj") ){
						       detailPage="/cms/gjzxGfyjContent.jsp?docId="+doc.getId() ;
						   }
					%>
			<tr>			
		    <td width="56%">
		    <a href="<%=detailPage %>" title="<%= DocumentHelper.getTitle(doc)%>" target="_blank">
		    <%= DocumentHelper.getTitle(doc ,Integer.parseInt(titleWidth))%>
		    </a>
		    </td>
		    <td width="44%" align="right" class="font_8c"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd hh:mm")%> </td>
		   </tr>
		</paging:pageRow>
		
		</table>
</paging:page>
</body>
</html>