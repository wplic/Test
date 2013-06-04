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
<bean:parameter id="showSize1" name="showSize" value="1" />
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
<div class="gfsd font_43">
<img src="/pic/infoCenter/list_gfsd.jpg" class="fleft mr15" />
 <table>
    <tr><td>
     <paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						String detailPage = "/cms/newsContent.jsp?docId="+doc.getId() ;
					%>
					
				    	
				        <div class="gfsd_txt" style="word-wrap:break-word;">
					        <p class="red font14 bold"><%=DocumentHelper.getTitle(doc,30)%></p>
					        <p class="inden25">   <%
		       					String content=DocumentHelper.getContent(doc);
								content="&nbsp;&nbsp;&nbsp;"+content;
		      					content=StringUtils.subString(content,160,"......");
					            out.println(content);
			                  %> <span class="red"><a href="<%=detailPage %>"  target="_blank">[全文]</a></span></p>
						</div>

		   </paging:pageRow>
        </paging:page>
         </td>
        </tr>
  </table>      
</div>	
</body>
</html>