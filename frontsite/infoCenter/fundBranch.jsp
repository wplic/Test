
<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>


<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu")!=null&&!request.getParameter("menu").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu2")!=null&&!request.getParameter("menu2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu3")!=null&&!request.getParameter("menu3").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu3"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
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
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index"> 首页 </a> &gt;<a href="${contextPath }/infoCenter/fund.jsp?nav=zxzx&nav1=jj&nav2=ggxl"> 基金</a> &gt; 基金超市</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp" />
	   <!-- 资讯检索 -->
<jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  <div class="blank5"></div>
  <p align="center"><a href="${contextPath }/fundFilterAction.do?method=getFilterList"><img src="${contextPath}/pic/infoCenter/ban_jjsx.jpg" /></a></p>
  <div class="blank5"></div>
  <p align="center"><a href="#"><img src="${contextPath}/pic/infoCenter/ban_jjwj.jpg" /></a></p>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <form action="${contextPath }/fundGsInfoAction.do?method=getFundBranchList&nav=zxzx&nav2=hor1&menu1=hor1&menu2=board1" name="fundGsForm" method="post">
  <div class="w706 fright">
  <div class="left_tit2">基金代销网点</div>
    <div class="blank5"></div>
    <div class="query_bg1">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
          <td>地  区：</td>
            <td><label>
              <select name="areaName" style="this.width:150px" id="areaName">
                <option value="">--请选择--</option>
                <%
                		if (provinceList != null && provinceList.size() > 0)
                		{
                				for (int i = 0 ; i < provinceList.size();i++)
                				{
                					Branch branch1 =(Branch)provinceList.get(i);
                					if (areaName != null &&  branch1.getProvince().equals(areaName))
                					{
                						%>
                						 <option selected="selected" value="<%= branch1.getProvince() %>"><%= branch1.getProvince() %></option>
                						<%
                					}
                					else
	                				{
	                					%>
	                						 <option   value="<%=branch1.getProvince() %>"><%= branch1.getProvince() %></option>
	                					<%	 
	                				}
                						
                				}
                				
                		}
                 %>
                
              </select>
            </label></td>
           	 <td>营业部名称：</td>
            <td><label>
              <select name="branch" style="this.width:150px" id="branch">
                <option value="">--请选择--</option>
                <%
                		if (fzjgAllList != null && fzjgAllList.size() > 0)
                		{
                				for (int i = 0 ; i < fzjgAllList.size();i++)
                				{
                						Branch branchs =(Branch)fzjgAllList.get(i);
                						if (branchs != null && branchs.equals(branchs.getBranchName()))
                						{
                								%>
		                						 <option selected="selected" value="<%= branchs.getBranchName() %>"><%= branchs.getBranchName() %></option>
		                						<%
                						}
                						else
                						{
                								%>
		                						 <option value="<%= branchs.getBranchName() %>"><%= branchs.getBranchName() %></option>
		                						<%
                						}
                					
                				}
                		}
                 %>
                
              </select>
            </label></td>
          	<td><label>
              <input type="submit" name="button2" id="button2" value="查询" class="but_01" />
            </label></td>
          </tr>
        </table>
	</div>
    <div class="blank5"></div>
    <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td width="10%" class="tab_th1 bold">序号 </td>
        <td width="12%" class="tab_th1 bold">区域 </td>
        <td width="9%" class="tab_th1 bold">营业部名称 </td>
        <td width="12%" class="tab_th1 bold">营业部地址 </td>
        <td width="12%" class="tab_th1 bold">资询电话</td>
       
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
						        <td width="10%"><%=tmp %></td>
						        <td width="12%"><%=branchinfo.getProvince()==null?"":branchinfo.getProvince() %></td>
						        <td width="9%"><%=branchinfo.getBranchName()==null?"":branchinfo.getBranchName() %></td>
						        <td width="12%"><%=branchinfo.getAddress()==null?"":branchinfo.getAddress() %></td>
						        <td width="12%"><%=branchinfo.getZphone()==null?"":branchinfo.getZphone() %></td>
						        
						      </tr>
      					<%
      					
      					}
      					else
      					{
      							%>
      						<tr class="bg_ec">
						         <td width="10%"><%=tmp %></td>
						        <td width="12%"><%=branchinfo.getProvince()==null?"":branchinfo.getProvince() %></td>
						        <td width="9%"><%=branchinfo.getBranchName()==null?"":branchinfo.getBranchName() %></td>
						        <td width="12%"><%=branchinfo.getAddress()==null?"":branchinfo.getAddress() %></td>
						        <td width="12%"><%=branchinfo.getZphone()==null?"":branchinfo.getZphone() %></td>
							   </tr>
      							<%
      					}
      					tmp ++;
      				}
      		}
       %>
 
    </table>
    <div class="blank5"></div>
	<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        
        <td  align="right"><%=PageUtil.pagination("window.fundGsForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
  </div>

  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
  </form>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</body>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
