<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

</head>
<jsp:directive.page import="com.css.system.Configuration" />
<%
 String hangqingUrlzx = Configuration.getProperty("hangqingUrlzx");


%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; 资讯中心 </div>
</div>
<div class="wrap_info3c">
  <!--左侧sied开始-->
  <div class="w677 fleft">
	<jsp:include page="/infoCenter/indexTitle.jsp">
           <jsp:param name="whichCat" value="gfsd"/>
    	</jsp:include>
    <div class="blank5 bg_ff"></div>
    <!--左侧每日公告开始-->
    <div class="w210 fleft">
   	  <jsp:include page="/infoCenter/indexJygg.jsp"/>
       <jsp:include page="/infoCenter/indexCjzt.jsp"/>
    </div>
    <!--左侧每日公告结束-->
    
    <!--左中资讯切换开始-->
    <div class="w461 fright">
    	<ul class="gsyw_box">
          <li class="active red bold" id="tagtabs01" onmouseover="SwitchNews('tabs0', 1, 2,'active red bold','white bold')"><a href="${ctx }/infoCenter/stock.jsp?nav=zxzx&nav1=gp&nav2=gsyw&whichCat=zxzx_gp_gsyw">股市要闻</a></li>
          <li class="white bold" id="tagtabs02" onmouseover="SwitchNews('tabs0', 2, 2,'active red bold','white bold')"><a href="${ctx }/infoCenter/news.jsp?whichCat=zxzx_jryw">要闻综述</a></li>
        </ul>
		<ul class="gsyw_con" id="tabs01">
        <jsp:include page="/infoCenter/indexListGsyw.jsp">
           <jsp:param name="whichCat" value="zxzx_gp_gsyw"/>
           <jsp:param name="showSize" value="4"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <ul class="gsyw_con" id="tabs02" style=" display:none">
        <jsp:include page="/infoCenter/indexListGsyw.jsp">
           <jsp:param name="whichCat" value="zxzx_jryw"/>
           <jsp:param name="showSize" value="4"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <div class="blank5"></div>
        
      <ul class="gsyw_box">
        	<li class="active red bold" id="tagtabs11" onmouseover="SwitchNews('tabs1', 1, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/stock.jsp?nav=zxzx&nav1=gp&nav2=dpgz&whichCat=zxzx_gp_dpzz">大市盘点</a></li>
            <li class=" white bold" id="tagtabs12" onmouseover="SwitchNews('tabs1', 2, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/stock.jsp?nav=zxzx&nav1=gp&nav2=hyfx&whichCat=zxzx_gp_hyfx">行业报道</a></li>
            <li class=" white bold" id="tagtabs13" onmouseover="SwitchNews('tabs1', 3, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/stock.jsp?nav=zxzx&nav1=gp&nav2=ggps&whichCat=zxzx_gp_ggps">个股风云</a></li>
      </ul>
		<ul class="gsyw_con" id="tabs11">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_gp_dpzz"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <ul class="gsyw_con" id="tabs12" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_gp_hyfx"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <ul class="gsyw_con" id="tabs13" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_gp_ggps"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <div class="blank5" style=" height:6px; overflow:hidden"></div>
        
        <ul class="gsyw_box">
        	<li class="active red bold" id="tagtabs21" onmouseover="SwitchNews('tabs2', 1, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/newStock.jsp?nav=zxzx&nav1=xg&nav2=xgssgg&whichCat=zxzx_xg_xgssgg">新股公告</a></li>
            <li class=" white bold"id="tagtabs22" onmouseover="SwitchNews('tabs2', 2, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/newStock.jsp?nav=zxzx&nav1=xg&nav2=xgdwfx&whichCat=zxzx_xg_xgdwfx">新股定位分析</a></li>
            <li class=" white bold" id="tagtabs23" onmouseover="SwitchNews('tabs2', 3, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/newStock.jsp?nav=zxzx&nav1=xg&nav2=xgfx&whichCat=zxzx_xg_xgfx">新股发行</a></li>
        </ul>
	   <ul class="gsyw_con" id="tabs21">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_xg_xgssgg"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <ul class="gsyw_con" id="tabs22" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_xg_xgdwfx"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
        <ul class="gsyw_con" id="tabs23" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_xg_xgfx"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
        </ul>
    </div>
    <!--左中资讯切换结束-->
  </div>
  <!--左侧sied结束-->
  
   
  <!--右侧sied开始-->
  <div class="w236 fright">
	<ul class="info_tab1">
       <li class="active red" id="tagtabs71" onmouseover="SwitchNews('tabs7', 1, 3,'active red','link white')"><a href="#">大盘行情</a></li>
      <li class="link white" id="tagtabs72" onmouseover="SwitchNews('tabs7', 2, 3,'active red','link white')"><a href="#">广发基金</a></li>
      <li class="link white" id="tagtabs73" onmouseover="SwitchNews('tabs7', 3, 3,'active red','link white')"><a href="#">广发理财</a></li>
    </ul>
    <div class="blank5"></div>
  	<table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs71">
	     <tr>
	       <td>
	         <iframe src="<%=hangqingUrlzx %>" id="hqIframe" name="hqIframe"  marginWidth="0" marginHeight="0" frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	       </td>
	     </tr>
	</table>
	<table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs72" style=" display:none">
	    <jsp:include flush="true" page="/commons/infoCenterKfsjj.jsp">
           <jsp:param name="beginNum" value="1"/>
           <jsp:param name="endNum" value="5"/>
        </jsp:include>
	</table>
	<table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs73" style=" display:none">
	     <jsp:include flush="true" page="/commons/infoCenterLcjz.jsp">
           <jsp:param name="beginNum" value="1"/>
           <jsp:param name="endNum" value="5"/>
        </jsp:include>
	</table>
    <div class="blank5"></div>
    <ul class="info_tab1">
       <li class="active red" id="tagtabs81" onmouseover="SwitchNews('tabs8', 1, 2,'active red','link white')">涨幅前五名</li>
      <li class="link white" id="tagtabs82" onmouseover="SwitchNews('tabs8', 2, 2,'active red','link white')">跌幅前五名</li>
    </ul>
    <div class="blank5"></div>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs81">
     <jsp:include flush="true" page="zdflist.jsp">
             <jsp:param name="zd" value="涨"/>
		     <jsp:param name="num" value="5"/>
        </jsp:include>
    </table>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs82" style=" display:none">
      <jsp:include flush="true" page="zdflist.jsp">
             <jsp:param name="zd" value="跌"/>
		     <jsp:param name="num" value="5"/>
        </jsp:include>
    </table>
    
    <div class="blank5"></div>
    <ul class="info_tab1">
       <li class="active red" id="tagtabs91" onmouseover="SwitchNews('tabs9', 1, 2,'active red','link white')">世界股指</li>
      <li id="tagtabs92" onmouseover="SwitchNews('tabs9', 2, 2,'active red','link white')">外汇行情</li>
    </ul>
    <div class="blank5"></div>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs91">
       <jsp:include page="/infoCenter/indexHqgz.jsp"/>
    </table>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs92" style=" display:none">
      <jsp:include page="/infoCenter/indexWhpj.jsp"/>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="main">
  <p align="center" class="mtb5"><img src="/pic/infoCenter/banner1.jpg" /></p>
</div>

<div class="wrap_info3c">
    <!--右侧sied开始--> 
  <div class="w210 fleft">
            		<jsp:include flush="true" page="/infoCenter/indexKfsjj.jsp">
			          <jsp:param name="beginNum" value="1"/>
			           <jsp:param name="endNum" value="10"/>
			        </jsp:include>
     
        <div class="blank5"></div>
       <jsp:include page="/infoCenter/indexZqsyph.jsp"/>
    <div class="blank5"></div>
      <p align="center"><a href="/golden/index.html"><img src="/pic/infoCenter/ban_jgj.jpg" /></a></p>
    </div>
    <!--右侧sied结束--> 
    
    <!--中间资讯内容开始--> 
  <div class="w461 fleft ml6">
    	<ul class="gsyw_box">
        	<li class="active red bold" id="tagtabs31" onmouseover="SwitchNews('tabs3', 1, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/fundgg.jsp?nav=zxzx&nav1=jj&nav2=jjgg">基金公告</a></li>
            <li class=" white bold" id="tagtabs32" onmouseover="SwitchNews('tabs3', 2, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/fund.jsp?nav=zxzx&nav1=jj&nav2=ggxl">基金新闻</a></li>
            <li class=" white bold" id="tagtabs33" onmouseover="SwitchNews('tabs3', 3, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/fundyj.jsp?nav=zxzx&nav1=jj&nav2=fundyj">基金研究</a></li>
        </ul>
	   <ul class="gsyw_con" id="tabs31">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_jj_jjgg"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
      </ul>
      <ul class="gsyw_con" id="tabs32" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_jj_jjxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
      </ul>
      <ul class="gsyw_con" id="tabs33" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_jj_jjyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
      </ul>
        <div class="blank5"></div>
        
        <ul class="gsyw_box">
        	<li class="active red bold" id="tagtabs41" onmouseover="SwitchNews('tabs4', 1, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/bond.jsp?whichCat=zxzx_zq_zqxw">债券新闻</a></li>    
            <li class=" white bold" id="tagtabs42" onmouseover="SwitchNews('tabs4', 2, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/warrantIndex.jsp?nav=zxzx&nav1=qz&nav2=qzxw&whichCat=zxzx_qz_qzxw">权证新闻</a></li>
            <li class=" white bold" id="tagtabs43" onmouseover="SwitchNews('tabs4', 3, 3,'active red bold','white bold')"><a href="${ctx }/infoCenter/zxmarket.jsp?nav=zxzx&nav1=zxb&nav2=zxbxw&whichCat=zxzx_zxb_zxbxw">中小板新闻</a></li>
        </ul>
	   <ul class="gsyw_con" id="tabs41">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_zq_zqxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
   	 </ul>
     <ul class="gsyw_con" id="tabs42" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_qz_qzxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
   	 </ul>
     <ul class="gsyw_con" id="tabs43" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_zxb_zxbxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
   	 </ul>
        <div class="blank5"></div>
        
        <ul class="gsyw_box">
        	<li class="active red bold" id="tagtabs51" onmouseover="SwitchNews('tabs5', 1, 2,'active red bold','white bold')"><a href="${ctx }/infoCenter/bstock.jsp?whichCat=zxzx_bg_bgxw">B股新闻</a></li> 
            <li class=" white bold" id="tagtabs52" onmouseover="SwitchNews('tabs5', 2, 2,'active red bold','white bold')"><a href="${ctx }/infoCenter/hkstock.jsp?whichCat=zxzx_gg_ggxw">港股新闻</a></li>
        </ul>
	   <ul class="gsyw_con" id="tabs51">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_bg_bgxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
    </ul>
    <ul class="gsyw_con" id="tabs52" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_gg_ggxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
    </ul>
        <div class="blank5"></div>
        
        <ul class="gsyw_box">
        	<li class="active red bold" id="tagtabs61" onmouseover="SwitchNews('tabs6', 1, 2,'active red bold','white bold')"><a href="${ctx }/infoCenter/future.jsp?whichCat=cjzx_qh_gzqhxw">期货新闻</a></li>
            <li class=" white bold" id="tagtabs62" onmouseover="SwitchNews('tabs6', 2, 2,'active red bold','white bold')"><a href="${ctx }/infoCenter/forex.jsp?whichCat=zxzx_wh_whxw">外汇新闻</a></li>
        </ul>
    <ul class="gsyw_con" id="tabs61">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="cjzx_qh_gzqhxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
      </ul>
      <ul class="gsyw_con" id="tabs62" style=" display:none">
		<jsp:include page="/infoCenter/indexList.jsp">
           <jsp:param name="whichCat" value="zxzx_wh_whxw"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="60"/>
    	</jsp:include>
      </ul>
    </div>
    <!--中间资讯内容结束--> 
    
    <!--右侧sied开始--> 
  <div class="w236 fright">
    	<jsp:include page="/infoCenter/indexSbhq.jsp"/>
        
        <div class="blank5"></div>
       <jsp:include page="/infoCenter/indexQzhq.jsp"/>
    
      <div class="blank5"></div>
      <p align="center"><a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp"><img src="${ctx }/pic/infoCenter/ban_ydjy.jpg" border="0"/></a></p>
    </div>
    <!--右侧sied结束--> 
    <div class="clearfloat"></div>
</div>
<script src="/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>