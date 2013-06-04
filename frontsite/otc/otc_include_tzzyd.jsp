<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<bean:parameter id="category" name="whichCat" value="otc_tzzyd" />

<bean:parameter id="showSize1" name="showSize" value="8" />
<bean:parameter id="titleWidth" name="titleWidth" value="60"/>
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
 <paging:page count="false" row="4"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
<table width="95%" align="center"  border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						i++;
						String detailPage = "/commons/infoList.jsp?docId="+doc.getId() ;
						String totaltitle = DocumentHelper.getTitle(doc);
					%>
					<tr class="list_bline1">
					<td width="20" align="center"><img src="/pic/msindex/list_03.gif"/></td>
					<td ><a href="<%=detailPage %>" target="_blank" title="<%=totaltitle%>"><%=DocumentHelper.getTitle(doc,55)%></a></td>
			        <td width="100" align="center"> <%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
			        </tr>
		</paging:pageRow>
		 <%if(i< Integer.parseInt(showSize1)){ 
			  	for(int j=0;j<Integer.parseInt(showSize1)-i;j++){
			  %>
	  		
				  	<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
			        </tr>
			  <%} 
			  }
			  %>
        </table>
</paging:page>
</body>
</html>