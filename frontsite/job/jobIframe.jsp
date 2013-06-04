<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hr.pojo.ThrPostInfo"/>
<bean:parameter name="cat" id="cat" value="1"/>
<bean:parameter name="type" id="type" value="1"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("cat")!=null&&!request.getParameter("cat").equals("")){
		if(sqlInjectValidate.validateSql2(request.getParameter("cat"))){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
%>
</head>
<body>
<% 
	int index = 1;	 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List list = null;
	if(null!=request.getAttribute("list"))
		list = (List)request.getAttribute("list");
 %>
<div id="tabs01">
<form action="${ctx }/thrPostInfoAction.do?method=getList" name="postInfoForm" method="post">
<input type="hidden" name="cat" value="<%=cat %>"/>
<input type="hidden" name="type" value="<%=type %>"/>
<table width="96%" align="center" class="textcenter">
  <tr>
    <td width="5%" class="ywfw_l_job">&nbsp;</td>
    <td width="5%" class="ywfw_m bold">序号</td>
    <td width="15%" class="ywfw_m bold">部门</td>
    <td class="ywfw_m bold">岗位</td>
    <td width="23%" class="ywfw_m bold">工作地点</td>
    <td width="7%" class="ywfw_m bold">人数</td>
    <td width="10%" class="ywfw_m bold">截止日期</td>
    <td width="5%" class="ywfw_r">&nbsp;</td>
  </tr>
</table>

<table width="94%" align="center" class="lh25 mt10 xuxian_job textcenter">
	<%if(null!=list && list.size()>0){
		for(int i=0;i<list.size();i++){ 
			ThrPostInfo bean = (ThrPostInfo)list.get(i);
			String hot = bean.getIsHot();%>
		<tr>
		    <td width="5%"><%=i+1 %>.</td>
		    <td width="20%"><a href="${ctx }/job/jobReq.jsp?jobId=<%=bean.getId() %>" target="_blank"><%=bean.getBranchName() %></a></td>
		    <td><a href="${ctx }/job/jobReq.jsp?jobId=<%=bean.getId() %>" target="_blank">
		    <%if("1".equals(hot)){ %>
		    	<font color='red'><%=bean.getPostName() %></font>
		    <%}else{ %>
		    	<%=bean.getPostName() %>
		    <%} %>
		    </a></td>
		    <td width="25%">
		     <%=bean.getWorkPlace() %>
		    </td>
		    <%if(bean.getCount() > 0){ %>
		    	<td width="7%"><%=bean.getCount() %>人</td>
		    <%}else{ %>
		    	<td width="7%"></td>
		    <%} %>
		    <td width="12%"><%=sdf.format(bean.getEndDate()) %></td>
		  </tr>
	<%}} %>
</table>

 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"> <%=PageUtil.pagination("window.postInfoForm",totleCount, currentPage, pagesize)%></td>
      </tr>
 </table>
 </form>
</div>
</body>
</html>