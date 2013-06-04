<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
		List list = (List)request.getAttribute("list");
		Integer curPage = (Integer)request.getAttribute("curPage");
		List  jjlxList =	(List)request.getAttribute("jjlxList");
		List tzdxList =	(List)request.getAttribute("tzdxList");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List fzjgAllList = (List)request.getAttribute("fzjgAllList");
		List provinceList = (List)request.getAttribute("provinceList");
	  	String branch =	(String)request.getAttribute("branch");
	  	String areaName = (String)request.getAttribute("areaName");
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

<jsp:include page="${contextPath }/share/top.jsp" />
<form action="${contextPath }/branchManagerAdminAction.do?method=getBranchList&nav=grgf&nav1=yywd" id="yybListForm"  name="yybListForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 营业网点</div>
  <div class="left_tit2">营业网点</div>
    <div class="blank10"></div> 
	<div class="serchbg">
	  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	      <td width="9%">营业部查询：</td>
	      
	      <td width="10%"><select name="areaName" style="this.width:180px" id="areaName">
                <option value="">--请选择--</option>
                <%
                		if (provinceList != null && provinceList.size() > 0)
                		{
                				for (int i = 0 ; i < provinceList.size();i++)
                				{
                					Branch branch1 = (Branch)provinceList.get(i);
                					if (areaName != null &&  branch1.getProvince().equals(areaName))
                					{
                						%>
                						 <option selected="selected" value="<%= branch1.getProvince() %>"><%= branch1.getProvince() %></option>
                						<%
                					}
                					else
	                				{
	                					%>
	                						 <option   value="<%= branch1.getProvince() %>"><%= branch1.getProvince() %></option>
	                					<%	 
	                				}
                						
                				}
                				
                		}
                 %>
                
              </select></td>
	      <td width="39%" align="left"><input type="submit" name="button" id="button" class="but_01" onclick="pagereset();" value="提交" /></td>
	      <td width="24%" align="right"><a href="${contextPath }/branchManagerAdminAction.do?method=getBranchList&nav=grgf&nav1=yywd"><img align="absmiddle" src="/pic/branches/fzlist.gif" /></a></td>
        </tr>
      </table>
    </div>
  <div class="blank10"></div>
    <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%" align="center">
      <tr>
        <th class="center bold" style="line-height:30px">序号</th>
        <th class="center bold" style="line-height:30px">代码</th>
        <th class="center bold" style="line-height:30px">营业部名称</th>
        <th class="center bold" style="line-height:30px">地址</th>
        <th class="center bold" style="line-height:30px">电话</th>
        <th class="center bold" style="line-height:30px">传真</th>
      </tr>
      
            <%
     		 int tmp = 1;
      		if (curPage > 1)
      		{
      		 tmp = curPage * 15;
      		}
      		if (list  != null && list.size() > 0)
      		{
      				for (int i = 0; i < list.size(); i ++)
      				{
      					Branch branchinfo  =	(Branch)list.get(i);
      					
      					if ( (i % 2) != 0)
      					{
      						
      					%>
      					
      						 <tr>
						        <td width="5%" class="center"><%=tmp %></td>
						        <td width="5%" class="center">
						        <a href="${contextPath}/branchManagerAction.do?method=getBranchInfoById&id=<%=branchinfo.getId() %>">
						        <%=branchinfo.getBranchCode() %>
						        </a>
						        </td>
						        <td width="23%" align="center">
						        <a href="${contextPath}/branchManagerAction.do?method=getBranchInfoById&id=<%=branchinfo.getId() %>">
						        <%=branchinfo.getBranchName()==null?"":branchinfo.getBranchName() %>
						        </a>
						        </td>
						        <td width="35%"><%=branchinfo.getAddress()==null?"":branchinfo.getAddress() %></td>
						        <td width="15%"><%=branchinfo.getZphone()==null?"":branchinfo.getZphone() %></td>
						        <td width="17%"><%=branchinfo.getFax()==null?"":branchinfo.getFax() %></td>
						      </tr>
      						
      					<%
      					
      					}
      					else
      					{
      							%>
      						 <tr>
						       <td width="5%" class="center"><%=tmp %></td>
						       <td width="5%" class="center">
						        <a href="${contextPath}/branchManagerAction.do?method=getBranchInfoById&id=<%=branchinfo.getId() %>">
						       <%=branchinfo.getBranchCode() %></a></td>
						        <td width="23%" align="center">
						         <a href="${contextPath}/branchManagerAction.do?method=getBranchInfoById&id=<%=branchinfo.getId() %>">
						        <%=branchinfo.getBranchName()==null?"":branchinfo.getBranchName() %></a></td>
						        <td width="35%"><%=branchinfo.getAddress()==null?"":branchinfo.getAddress() %></td>
						        <td width="15%"><%=branchinfo.getZphone()==null?"":branchinfo.getZphone() %></td>
						        <td width="17%"><%=branchinfo.getFax()==null?"":branchinfo.getFax() %></td>
						      </tr>
      							<%
      					}
      					tmp ++;
      				}
      		}
       %>
      <tr>
      		<td colspan="6" align="right"><%=PageUtil.pagination("window.yybListForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    
    </table>
</div>
  
  

</form>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>