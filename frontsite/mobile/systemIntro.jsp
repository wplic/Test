<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js" type="text/javascript"></script>
</head>
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
%>
<body>
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> 
   <jsp:include page="/mobile/pmdList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="2"/>
				    	</jsp:include></div>
  <div class="blank5"></div>
</div>
<div class="mobox">
  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp?leftnav=management2&leftnav2=null"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
		<div class="rtit2">“金管家”系统介绍</div>
<div class="yxsm" style="padding-top:10px; padding-bottom:10px">
   		<img src="../pic/mobile/sysp1.jpg" style="float:left; margin-right:10px" />
<p style="padding:25px 36px 0px 0px; line-height:25px; text-indent:2em; ">“金管家”手机证券全面升级，全新的界面风格，丰富的股市资讯，快捷的银证转账功能，涵盖目前市场的主流机型，更加安全稳定！使您拥有一机在手、网络所有的舒爽投资体验！</p> 
    	<div class="blank0"></div>
		</div>
        
        
            
    <div class="blank10"></div>
            <div class="zygltit">主要功能</div>
            <div class="blank10"></div>
            <div class="zygl">
                <dl>
                    <dt>在线交易</dt>
                    <dd class="pic"><img src="../pic/mobile/zyglp1.jpg" /></dd>
                    <dd class="text">支持深沪两市各种证券品种的证券交易，包括买入、卖出、撤单、查询、修改密码功能；支持开放式基金申购、赎回等功能。</dd>
                </dl>
                <dl>
                    <dt>行情报价</dt>
                    <dd class="pic"><img src="../pic/mobile/zyglp2.jpg"/></dd>
                    <dd class="text">提供实时的行情数据及强大的图标分析功能 （包 括 ： 走势图 、日 / 周 / 月等 K线图），支持自选股同步管理等。<br />
                    </dd>
                </dl>
                <dl>
                  <dt>个性资讯</dt>
                    <dd class="pic"><img src="../pic/mobile/zyglp3.jpg" /></dd>
                    <dd class="text">提供广发证券研究团队动态研究报告、及时解盘、要闻点评等投资咨询参考信息以及广发证券精选财经内参、公司公告等。</dd>
              </dl>
              <div class="blank10"></div>
    </div>
    
    
    <div class="zygltit">软件优势</div>
    <div class="rjys"style="border-top:2px solid #99bad1;">
    			<dl>
                    <dt><img src="../pic/mobile/ys01.jpg" align="absmiddle" />适配性高 免使用费</dt>
                    <dd class="pic"><img src="../pic/mobile/rjys1.jpg" /></dd>
                    <dd class="text">支持深沪两市各种证券品种的证券交易，包括买入、卖出、撤单、查询、修改密码功能；支持开放式基金申购、赎回等功能。</dd>
                </dl>
                <div class="blank0"></div>  
    </div>
    <div class="rjys">
    			<dl>
                    <dt><img src="../pic/mobile/ys02.jpg" align="absmiddle" />运行稳定 安全无忧</dt>
                    <dd class="pic"><img src="../pic/mobile/rjys2.jpg" /></dd>
                    <dd class="text">广发证券多年的非现场交易运行管理经验确保手机交易系统在任何流量下运行稳定，采用最高加密技术，<br />
                    确保交易安全万无一失。</dd>
                </dl>
                <div class="blank0"></div>  
    </div>
    <div class="rjys">
    			<dl>
                    <dt><img src="../pic/mobile/ys03.jpg" align="absmiddle" />功能强大 特色服务</dt>
                    <dd class="pic"><img src="../pic/mobile/rjys3.jpg" /></dd>
                    <dd class="text">支持多种技术指标分析，人性化功能界面，提供专属金管家资讯产品，提供开放式基金排行查询、银证转<br />
                    账、闪电下单等功能。</dd>
                </dl>
                <div class="blank0"></div>  
    </div>
    <div class="rjys" style="border-bottom:2px solid #99bad1;">
    			<dl>
                    <dt><img src="../pic/mobile/ys04.jpg" align="absmiddle" />操作简捷 轻松使用</dt>
                    <dd class="pic"><img src="../pic/mobile/zyglp4.jpg" /></dd>
                    <dd class="text">无论通过广发wap网站在线交易还是下载客户端软件进行交易，设置操作简单方便，行情交易随心所欲。</dd>
                </dl>
                <div class="blank0"></div>  
    </div>
            
    
        
</div>
  <div class="blank10"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>