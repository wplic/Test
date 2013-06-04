<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryNode"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<script src="/js/jsIfUtils.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp?nav=zxzx&nav1=xg" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/infoCenter/newStockIndex.jsp?nav=zxzx&nav1=xg&nav2=xgjz"> 新股 </a> &gt; 新股聚焦</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/infoCenter/newStock_lmenu.jsp?nav2=xgjz" />
<jsp:include page="${ctx }/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">新股聚焦</div>
    <div class="blank5"></div>
    <ul class="gsyw_box2">
        	<li class="active red bold" id="tagtabs11" onmouseover="SwitchNews('tabs1', 1, 2,'active red bold','white bold')"><a href="#">新股一览表</a></li>
            <li class=" white bold" id="tagtabs12" onmouseover="SwitchNews('tabs1', 2, 2,'active red bold','white bold')"><a href="#">今日新股提示</a></li>
      </ul>
		<ul class="gsyw_con2" id="tabs11">
			<iframe width="100%"  src="${ctx}/gazxNewStock.do?method=getNewStockInfoList" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="newStockInfoList" name="newStockInfoList" onload="frameFitSelfHeight('newStockInfoList')"></iframe>
        </ul>
        <ul class="gsyw_con2" id="tabs12" style=" display:none">
		  	<iframe width="100%"  src="${ctx}/infoCenter/newsStockList.jsp?whichCat=zxzx_jysgg_jrxgts&showSize=18&buttonName=1&titleWidth=60" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="stockList" name="stockList" onload="frameFitSelfHeight('stockList')"></iframe>
    </ul>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
