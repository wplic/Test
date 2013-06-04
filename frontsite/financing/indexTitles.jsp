<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
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
<paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
	<paging:pageRow id="doc" type="com.css.cms.document.Document">
 <tr>
    <td align="center" class="lh30"><span class="font14 bold"><%=DocumentHelper.getTitle(doc) %></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="lh25 inden25">
<table>
 <tr>
   <td>
 				          <%
		       					String content=DocumentHelper.getContent(doc);
		       					if(content!=null&&!content.equals(""))
		       					{
		       					  if(content.length()>300)
		       					  {
		       						  //2012-7-6 9:55:20
		       					    //content=content.substring(0,300)+"...";
		       					  }
		       					}
					            out.println(content);
			                  %> 
		  
         </td>
        </tr>
  </table>      
</td>
  </tr>
   </paging:pageRow>
        </paging:page>