<%@page import="com.cssweb.hq.pojo.Quote"%>
<%@page import="java.text.DecimalFormat"%><%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
<%
	List list=null;
	if(request.getAttribute("qzhqList")!=null){
		list=(List)request.getAttribute("qzhqList");
	}
	String maxDate="";
  	if(request.getAttribute("maxDate")!=null){
      maxDate=request.getAttribute("maxDate").toString();
  	}
 %>
<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp?nav=zxzx&nav1=qz" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="/infoCenter/index.jsp?nav=zxzx"> 资讯中心 </a> &gt; <a href="${contextPath }/infoCenter/warrantIndex.jsp?nav=zxzx&nav1=qz&nav2=qzxw&whichCat=zxzx_qz_qzxw"> 权证</a> &gt; 权证行情列表</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <jsp:include page="${ctx }/infoCenter/warrant_lmenu.jsp?nav2=qzhqlb" />
<jsp:include page="${ctx }/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">权证行情</div>
    <div class="blank5"></div>
    <ul class="gsyw_box2">
        	<li class="active red bold" id="tagtabs11" onmouseover="SwitchNews('tabs1', 1, 1,'active red bold','white bold')"><a href="#">行情<%=maxDate %></a></li>
      </ul>
		<ul class="gsyw_con2" id="tabs11">
			
			<form name="warrantHqForm" action="${ctx}/qzhqAction.do?method=getQzhqList" method="post">
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td width="12.5%" class="tab_th1 bold red">权证代码 </td>
        <td width="12.5%" class="tab_th1 bold red">权证名称 </td>
        <td width="12.5%" class="tab_th1 bold red">最新价(元) </td>
        <td width="12.5%" class="tab_th1 bold red">开盘价(元) </td>
        <td width="12.5%" class="tab_th1 bold red">最高价(元) </td>
        <td width="12.5%" class="tab_th1 bold red">最低价(元) </td>
        <td width="12.5%" class="tab_th1 bold red">涨跌(元) </td>
        <td width="12.5%" class="tab_th1 bold red">涨跌幅(%) </td>
      </tr>
      <%if(list!=null&&list.size()>0) {
      	DecimalFormat df2=new DecimalFormat("#0.00");
		for(int i=0;i<list.size();i++){
			Quote quote = (Quote)list.get(i);
			
			if(i%2==0){
			%>
				<tr>
			<% 
			}else{
			%>
				<tr class="bg_ec">
			<% 
			}
			%>
	        <td><%=quote.getZqdm() %></td>
            <td><%=quote.getZqjc() %></td>
            <td><%=df2.format(quote.getZjcj()) %></td>
            <td><%=df2.format(quote.getJrkp()) %></td>
            <td><%=df2.format(quote.getZgcj()) %></td>
            <td><%=df2.format(quote.getZdcj()) %></td>
            <td><%=df2.format(quote.getZd()) %></td>
            <%if(quote.getZf()>0){ %><td class="red"><%=df2.format(quote.getZf()*100) %>%</td><%}else{%><td class="green"><%=df2.format(quote.getZf()*100) %>%</td><% } %>
      		</tr>
			<% 
		}
		}
		%>
    </table>
     <div class="clearfloat"></div>
      <p align="center"> <%=PageUtil.pagination("window.warrantHqForm",totleCount, currentPage, pagesize)%></p>
  	</form>
			
        </ul>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>