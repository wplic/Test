<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.systemset.pojo.BranchNotice"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Branch branch = (Branch)request.getAttribute("branch");
	List listnotice = (List)request.getAttribute("listnotice");
	String type = "";
	if (request.getAttribute("type") != null )
	{
			type = (String)request.getAttribute("type");
	}
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
<script >
		function pagereset()
		{
				
				document.getElementById('current_page').value = '1';
		}
</script>
</head>

<body class="body_bg">

-<jsp:include page="${contextPath }/share/top.jsp?nav=grgf&nav1=yywd" />
<form action="${contextPath }/branchManagerAction.do?method=getBranchNoticeByBranchId&nav=grgf&nav1=yywd" id="yybListForm"  name="yybListForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 营业网点</div>
  <div class="left_tit2">
			<%
					String typeStr = "";
					if (type != null && !"".equals(type))
					{
							if ("1".equals(type))
							{
								typeStr = "公告";
							
							}
							else
							{
								typeStr = "新闻";
							}
					}
					%>
						<%= typeStr %>
					<%
			%>
	</div>
    <div class="blank10"></div> 
	
  <div class="blank10"></div>
    <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%" align="center">
      <tr>
        <th class="center bold" width="80%" style="line-height:30px">标题</th>
        <th class="center bold" width="20%" style="line-height:30px">时间</th>
     </tr>
       <%
       		if (listnotice != null && listnotice.size() > 0)
       		{
       				for (int i = 0 ; i < listnotice.size() ; i ++ )
       				{
       						BranchNotice branchNotice =	(BranchNotice)listnotice.get(i);
       						%>
       							  <tr>
								        <td width="80%" align="left">
								        	<%
								        			if ( branchNotice != null && branchNotice.getTitle() != null)
								        			{
								        					%>
								        						 <a title="<%=branchNotice.getTitle() %>" href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>"  target=\"_blank\">·<%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>36?branchNotice.getTitle().substring(0,36)+"...":branchNotice.getTitle() %> </a>
								        					<%
								        			}
								        	 %>
								            
								         </td>
								        <td width="20%" class="center"><%=sdf.format(branchNotice.getCreateDate()) %></td>
								   </tr>    
       						<%
       				}
       		}
        %>
     
	   <tr>
      		<td colspan="2" align="right"><%=PageUtil.pagination("window.yybListForm",totleCount, currentPage, pagesize)%><input type="hidden" name="type" id="type"  value="<%=type %>"/><input type="hidden" name="id" id="id" value="<%=branch.getId() %>" /> </td>
      </tr>
    
    </table>
</div>
  
  

</form>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>