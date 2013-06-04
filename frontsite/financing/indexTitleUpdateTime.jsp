<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
</head>
<bean:parameter id="category" name="whichCat" value="rzllhrqgl" />
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
%>
 <table>
    <tr><td>
     <paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
				<%out.print(DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd"));%>
		   </paging:pageRow>
        </paging:page>
         </td>
        </tr>
  </table>      
