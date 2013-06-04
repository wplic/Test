<%@page import="com.css.cms.document.util.DocumentHelper"%>
<jsp:directive.page import="com.cssweb.common.util.HTMLutils"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.Map "/>
<jsp:directive.page import="java.util.HashMap "/>
<jsp:directive.page import="java.util.Iterator "/>
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
	
	Map map1=new HashMap();	
	Map map2=new HashMap();	
	Map map3=new HashMap();	
	Map map4=new HashMap();	
	Map map5=new HashMap();	
	Map map6=new HashMap();	
	Map map7=new HashMap();	
	Map map8=new HashMap();	
	Map map9=new HashMap();	
	Map map10=new HashMap();	
	Map map11=new HashMap();	
	Map map12=new HashMap();			
%>
<body>
 <paging:page count="false" row="60"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
<table width="95%" align="center"  border="0" cellspacing="0" cellpadding="0" class="lh27"
				style="text-indent:24px;">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
					
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("01"))
						{
						 map1.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("02"))
						{
						 map2.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("03"))
						{
						 map3.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("04"))
						{
						 map4.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("05"))
						{
						 map5.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("06"))
						{
						 map6.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("07"))
						{
						 map7.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("08"))
						{
						 map8.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("09"))
						{
						 map9.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("10"))
						{
						 map10.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("11"))
						{
						 map11.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
						if(DocumentHelper.getUploadDate(doc ,"MM").equals("12"))
						{
						 map12.put(doc.getId(),DocumentHelper.getTitle(doc));
						}
					%>
					
		</paging:pageRow>
		<%
		if(map12!=null&&map12.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;12月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map12.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 
		 <%
		if(map11!=null&&map11.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;11月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map11.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map10!=null&&map10.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;10月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map10.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map9!=null&&map9.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;9月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map9.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map8!=null&&map8.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;8月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map8.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map7!=null&&map7.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;7月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map7.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map6!=null&&map6.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;6月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map6.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map5!=null&&map5.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;5月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map5.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map4!=null&&map4.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;4月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map4.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map3!=null&&map3.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;3月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map3.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map2!=null&&map2.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;2月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map2.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
		 <%
		if(map1!=null&&map1.size()>0)
		{
		%>
		<tr>
        	<td colspan="2" class="font14 bold lh24" style="word-break:break-all">
        		&nbsp;&nbsp;&nbsp;&nbsp;1月..................................................................................................................
        	</td>
        </tr>
		<%
		Iterator iter=map1.entrySet().iterator();
			while(iter.hasNext())
			{
			 Map.Entry entry= (Map.Entry)iter.next();
			 %>
			 <tr>
					<td width="99%" class="lh24" style="word-break:break-all">
					<a href="${ctx}/commons/infoContext.jsp?docId=<%=entry.getKey() %>" target="_blank">
					<%=entry.getValue() %>
					</a>
					</td>
			        <td>
			        </td>
			        </tr>
			 
			 <%
			}
		}
		 %>
        </table>
</paging:page>
</body>
</html>