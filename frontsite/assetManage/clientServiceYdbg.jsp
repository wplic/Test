<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.dql.*"%>
<%@page import="com.css.cms.document.util.*"%>
<%@page import="java.util.*"%>
<%@page import="com.cssweb.client.pojo.TclientYdbg"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%
	  List list =	(List)request.getAttribute("list");
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	  String years =	 (String)request.getAttribute("year");
	 // System.out.println("years ========" + years);
	  String months= (String)request.getAttribute("month");
	 // System.out.println("months ========" + months);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function checkSearch(){
	var year = document.qForm.year.value;
	var month = document.qForm.month.value;
	document.qForm.StartDate.value = year+"-"+month+"-01";
	document.qForm.EndDate.value = year+"-"+month+"-20";
	document.qForm.submit();
}
//-->
</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 月度报告</div>
</div>
<form name="qForm" id="qForm" action="${contextPath}/tclientYdbgAction.do?method=getClientServiceMap" method="post">
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="clientService_lmenu.jsp?nav=ydbg" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>最新市场分析及投资策略</h4>
  </div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">最新市场分析及投资策略 </span> </div>
  <div class="blank10"></div>
  
  <div class="blank10"></div>
	<table id="doclist" width="95%" align="center" class="lh28 font_st list_bline1">
	  <%
	 		if (list != null && list.size() > 0)
	 		{
	 				for (int i = 0 ; i < list.size() ; i ++)
	 				{
	 						TclientYdbg tclientYdbg =	(TclientYdbg)list.get(i);
	 						%>
	 							<tr align="center">    
									<td width="70%" align="left"><a href="${contextPath}/assetManage/infoydbgList.jsp?ydbgId=<%=tclientYdbg.getId() %>" target="_blank" title=""><%=tclientYdbg.getTitle() %></a></td>
									<td width="30%" align="right"><%=sdf.format(tclientYdbg.getYdbgDate())  %></td>
								  </tr>
	 						<%
	 				}
	 		}			
	  %>	
	   <tr>
         		<td colspan="2" align="right" ><%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></td>
         </tr>
		</table>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
 </form>   
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</body>
</html>