<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;  <a href="${contextPath }/infoCenter/index.jsp?nav=zxzx">资讯中心</a> &gt; <a href="${contextPath }/infoCenter/stock.jsp?nav=zxzx&nav1=gp&nav2=gsyw&nav2=gsyw&whichCat=zxzx_gp_gsyw"> 股票 </a> &gt;  研究报告</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <jsp:include page="${ctx }/infoCenter/stock_lmenu.jsp" />
	<jsp:include page="${ctx }/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">研究报告</div>
    <div class="blank5"></div>
  <ul class="gsyw_box2">
        	<li class="active red bold" id="tagtabs11" onmouseover="SwitchNews('tabs1', 1, 3,'active red bold','white bold')"><a href="#">宏观研究报告</a></li>
            <li class=" white bold" id="tagtabs12" onmouseover="SwitchNews('tabs1', 2, 3,'active red bold','white bold')"><a href="#">行业研究报告</a></li>
            <li class=" white bold" id="tagtabs13" onmouseover="SwitchNews('tabs1', 3, 3,'active red bold','white bold')"><a href="#">公司研究报告</a></li>
      </ul>
		<ul class="gsyw_con2" id="tabs11">
			<iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=zxzx_gp_hgyjbg&showSize=20&buttonName=1&titleWidth=60" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" height="640" ></iframe>
        </ul>
        <ul class="gsyw_con2" id="tabs12" style=" display:none">
		  	<iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=zxzx_gp_hyyjbg&showSize=20&buttonName=1&titleWidth=60" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" height="640" ></iframe>
    </ul>
    <ul class="gsyw_con2" id="tabs13" style=" display:none">
			<iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=zxzx_gp_gsyjbg&showSize=20&buttonName=1&titleWidth=60" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" height="640" ></iframe>
        </ul>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>