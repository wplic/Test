<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
 
		List list = (List)request.getAttribute("list");
		Integer curPage = (Integer)request.getAttribute("curPage");
		List  jjlxList =	(List)request.getAttribute("jjlxList");
		List tzdxList =	(List)request.getAttribute("tzdxList");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String tzdx =	(String)request.getAttribute("tzdx");
		String jjdm = (String)request.getAttribute("jjdm");
		String jjlx = (String)request.getAttribute("jjlx");
		if(null!=jjdm && sqlInjectValidate.vakidateSqlStringForLength(jjdm, 7)){
				response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
				return;
			}
			if(null!=jjdm && sqlInjectValidate.vakidateSqlIfIngter(jjdm)){
				response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
				return;
			}
			if(null!=jjlx && sqlInjectValidate.vakidateSqlStringForLength(jjlx,6)){
				response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
				return;
			}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="">
<jsp:include page="${contextPath}/share/top.jsp" />
<div class="body_bg">
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
  <form action="${contextPath }/fundGsInfoAction.do?method=getFundGsInfoList&nav=zxzx&nav1=jj&nav2=hor1&menu1=hor1&menu2=board1" name="fundGsForm" method="post">
  <div class="w706 fright">
  <div class="left_tit2">基金公司列表</div>
    <div class="blank5"></div>
    <div class="query_bg1">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>基金代码：</td>
            <td><label>
              <input type="text" name="jjdm" id="jjdm" value="${jjdm }" />
            </label></td>
            <td>基金类型：</td>
            <td><label>
              <select name="jjlx" id="jjlx">
                <option value="">--请选择--</option>
                <%
                		if (jjlxList != null && jjlxList.size() > 0)
                		{
                				for (int i = 0 ; i < jjlxList.size();i++)
                				{
                						FundGsInfo fundGsInfo =(FundGsInfo)jjlxList.get(i);
                						if (jjlx != null && jjlx.equals(fundGsInfo.getJjlx()))
                						{
                							%>
	                						 <option selected="selected" value="<%= fundGsInfo.getJjlx() %>"><%= fundGsInfo.getJjlx() %></option>
	                						<%	
                						}
                						else
                						{
	                						%>
	                						 <option value="<%= fundGsInfo.getJjlx() %>"><%= fundGsInfo.getJjlx() %></option>
	                						<%
                						}
                				}
                		}
                 %>
                
              </select>
            </label></td>
            <td>投资对象：</td>
            <td><select name="tzdx" id="tzdx">
              <option value="">--请选择--</option>
              <%
              		if (tzdxList != null && tzdxList.size() > 0)
              		{
              				for (int i =0;i< tzdxList.size() ; i++)
              				{
              					FundGsInfo fundGsInfo = (FundGsInfo)tzdxList.get(i);
              					if (tzdx != null && tzdx.equals(fundGsInfo.getTzdx()))
              					{
              						%>
              						<option selected="selected" value="<%= fundGsInfo.getTzdx() %>"><%= fundGsInfo.getTzdx() %></option>
              						<%
              					}
              					else
              					{
              						%>
              						<option value="<%= fundGsInfo.getTzdx() %>"><%= fundGsInfo.getTzdx() %></option>
              						<%
              					}
              					
              				}
              				
              				
              		}
               %>
              
            </select></td>
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
        <td width="12%" class="tab_th1 bold">基金代码 </td>
        <td width="9%" class="tab_th1 bold">基金简称 </td>
        <td width="12%" class="tab_th1 bold">基金管理人 </td>
        <td width="12%" class="tab_th1 bold">基金类型 </td>
        <td width="13%" class="tab_th1 bold">成立日期 </td>
        <td width="13%" class="tab_th1 bold">总规模 </td>
        <td width="11%" class="tab_th1 bold">投资对象</td>
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
      					FundGsInfo fundGsInfo  =	(FundGsInfo)list.get(i);
      					if ( (i % 2) != 0)
      					{
      						
      					%>
      						<tr>
						        <td width="10%"><%=tmp %></td>
						        <td width="12%"><%=fundGsInfo.getJjdm() %></td>
						        <td width="9%"><%=fundGsInfo.getJjjc() %></td>
						        <td width="12%"><%=fundGsInfo.getGsmc() %></td>
						        <td width="12%"><%=fundGsInfo.getJjlx() %></td>
						        <td width="13%"><%=fundGsInfo.getClrq() == null ?" ":sdf.format(fundGsInfo.getClrq())	 %></td>
						        <td width="13%"><%=fundGsInfo.getJjzgm() == null?" ":fundGsInfo.getJjzgm().toString() %></td>
						        <td width="11%"><%=fundGsInfo.getTzdx() %></td>
						      </tr>
      					<%
      					
      					}
      					else
      					{
      							%>
      						<tr class="bg_ec">
						        <td width="10%"><%=tmp %></td>
						        <td width="12%"><%=fundGsInfo.getJjdm() %></td>
						        <td width="9%"><%=fundGsInfo.getJjjc() %></td>
						        <td width="12%"><%=fundGsInfo.getGsmc() %></td>
						        <td width="12%"><%=fundGsInfo.getJjlx() %></td>
						        <td width="13%"><%=fundGsInfo.getClrq() == null ?" ":sdf.format(fundGsInfo.getClrq())	 %></td>
						        <td width="13%"><%=fundGsInfo.getJjzgm() == null?" ":fundGsInfo.getJjzgm().toString() %></td>
						        <td width="11%"><%=fundGsInfo.getTzdx() %></td>
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
</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 20]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
