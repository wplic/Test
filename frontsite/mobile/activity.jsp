<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<style>
.dot9{ background:url(../pic/mobile/huod/list1.gif) no-repeat left center; text-indent:23px; width:72px; margin:0 auto}
.huobox{ padding:10px; line-height:22px;}
.huobox h3{ color:#861111; font-size:14px; font-weight:bold}
.lc_tit2{ background: url(../pic/mobile/huod/lc_tit2.jpg) no-repeat; width:698px; height:43px}
</style>
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
<div class="mobox">
  
  <div class="moleft">
   <jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=null"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
        <div class="lc_tit2"></div>
        <div class="lc_box">
       	  <div class="left">
            	<ul>
                  <li>
 2010年6月15日至9月30日，广发证券举办“随时随地 交易有奖”客户回馈活动：只要你已经在广发证券开户，并使用金管家手机证券进行交易，即有机会抽取Iphone手机、金管家股票机、中国移动充值卡等千份炫礼。财富随身行，大奖送不停！                    
</li>
                </ul>
          </div>
            <div class="right"><a href="${contextPath }/mobile/softdown.jsp?nav=wsyyt&nav1=gfydjyt"><img src="../pic/mobile/btn_dow.jpg" class="btndow" /></a></div>
            <div class="clearfloat"></div>
        </div>
        <div class="blank10"></div>
        <div class="rtit1">参与方式</div>
        <p style="padding:20px 15px; font-size:14px; line-height:22px; text-indent:2em; color:#333">6月15日至9月30日，广发证券客户使用金管家手机证券进行交易，即自动获得当期参与“随时随地，交易有奖”的活动资格。</p>
    <div class="blank5"></div>
        
        
        <ul class="motags">
       	  <li class="active" id="taglist1" onmouseover="SwitchNews('list', 1, 3,'active','')"><p class="dot9">炫礼大奖</p></li>
       	  <li id="taglist2" onmouseover="SwitchNews('list', 2, 3,'active','')"><p class="dot9">中奖名单</p></li>
          <li id="taglist3" onmouseover="SwitchNews('list', 3, 3,'active','')"><p class="dot9">活动咨询</p></li>
    </ul> 
            <div id="list1">
            	<div class="huobox">
                  <img src="../pic/mobile/huod/ipad.jpg" class="fright" />
                  <h3>月月炫礼</h3>
                  <p>
		              一等奖：Iphone手机     2台<br />
		              二等奖：金管家股票机   10台<br />
					三等奖：面值50元中国移动充值卡  988张
                  </p>
                  <p>&nbsp; </p>
                  <h3>抽奖安排</h3><p>
                    <span class="bold"></span> 第一期抽奖时间：7月30日，从 6月15日至7月31日使用金管家手机证券进行交易的客户编号当中随机抽取一定数量的获奖者；<br />
                    <span class="bold"></span>第二期抽奖时间：8月30日，从8月1日至8月31日使用金管家手机证券进行交易的客户编号当中随机抽取一定数量的获奖者；<br />
                    <span class="bold"></span>第三期抽奖时间：9月30日，从9月1日至9月30日使用金管家手机证券进行交易的客户编号当中随机抽取一定数量的获奖者。
                  
                  </p><br />
                  <p>
                  <h3>抽奖方式</h3>
                    抽奖全过程将在GFTV金管家财富频道播出
                  </p>
                  <br />
                   <p>
                  <h3>领奖方式</h3>
                    由客服专员电话通知，获奖者凭个人身份证前往开户所在广发证券营业网点领取炫礼。
                  </p>
                  
                  本次活动的最终解释权在法律范围内归广发证券所有
                </div>
            </div>
            
            <div id="list2" style="display:none">
                 
		           <ul class="gsyw_box2">
		            <li class="active red bold" id="tagtabs1" onclick="SwitchNews('tabs', 1, 3,'active red bold','white bold')">第三期</li>
		        	<li class=" white bold" id="tagtabs2" onclick="SwitchNews('tabs', 2, 3,'active red bold','white bold')">第二期</li>
		            <li class=" white bold" id="tagtabs3" onclick="SwitchNews('tabs', 3, 3,'active red bold','white bold')">第一期</li>
		           </ul>
                <div class="huobox" id="tabs1">
                 <jsp:include page="/mobile/zj3.jsp" />
              	</div>
                <div class="huobox" id="tabs2" style="display:none">
                 <jsp:include page="/mobile/zj2.jsp" />
              	</div>
              	<div class="huobox" id="tabs3" style="display:none">
                 <jsp:include page="/mobile/zj1.jsp" />
              	</div>
            </div>
            
            
            <div id="list3" style="display:none">
                   <div class="huobox">
                  
                  <h3>活动咨询电话：95575</h3>
                  <p><a href="${ctx }/branches/yywdServices.html">更多活动详情可前往全国各广发证券营业网点咨询</p>
              		</div>
            </div>
        
        
  </div>
  <div class="clearfloat"></div>

</div>
<script src="/js/setTab.js" type="text/javascript"></script>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>