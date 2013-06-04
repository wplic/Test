<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js" type="text/javascript"></script>
<script src="/js/swfobject_modified.js" type="text/javascript"></script>
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
  		<jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=management1_2"/>
  </div>
  
  
    <div class="moright">
            <p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
            <div class="blank10"></div>
            <div class="rtit2">软件操作说明</div>
            <ul class="motags">
            	<li id="taglist1" onmouseover="SwitchNews('list', 1, 6,'active','')">下载安装</li>
              	<li id="taglist2" onmouseover="SwitchNews('list', 2, 6,'active','')">登录使用</li>
                <li class="active" id="taglist3" onmouseover="SwitchNews('list', 3, 6,'active','')">开通交易</li>
                <li id="taglist4" onmouseover="SwitchNews('list', 4, 6,'active','')">查看行情</li>
                <li id="taglist5" onmouseover="SwitchNews('list', 5, 6,'active','')">浏览资讯</li>
                <li id="taglist6" onmouseover="SwitchNews('list', 6, 6,'active','')">个性服务</li>
            </ul>
            
            <div id="list1" class="tabstxt" style="display:none">
            <p><img src="${ctx }/pic/mobile/tabt1.jpg" class="mb5" /></p>
            	首先编辑“DB B”发送到“95575”，直接访问手机收到的下载链接，进入“广发金管家”wap下载界面，选择对应机型下载安装。具体点击“
            	<a href="${ctx }/mobile/softdown.jsp?nav=wsyyt&nav1=gfydjyt">
            	<span class="red">下载软件及安装</span></a>”。
            </div>

			<div id="list2" class="tabstxt" style="display:none">
            <p><img src="${ctx }/pic/mobile/tabt2.jpg" class="mb5" /></p>
            	安装完成后，点击“广发金管家”<img src="${ctx }/pic/mobile/dot4.gif"/>图标运行。（不同手机安装后程序的位置不同，一般保存在手机桌面或者是“应用程序”等菜单里面）。<br/>
            	同时首次登录需要编辑短信“DB B”发送到“95575”注册，成功发送短信后，
            	勿需等待短信回复，直接进入系统登录界面输入您的手机号码登录验证。
            	进入系统登录界面输入您的手机号码登录验证。
            </div>

			<div id="list3" class="tabstxt">
            <p><img src="${ctx }/pic/mobile/tabt3.jpg" class="mb5" /></p>
            	请进入“在线交易”菜单，进入委托登录界面，输入资金账号、交易密码进行登录验证。
            	如果您还没有开通手机委托方式，您可以通过以下渠道开通：<br/>
            	1、网上交易：进入金管家至诚版的网上交易系统，按F12，成功登录交易后，在左栏有一个“新业务申请”的菜单，按照提示操作即可开通；<br/>
2、手机客户端：进入金管家手机证券系统，选择“在线交易”登录，系统自动判断您的账号状态，如果未开通手机委托方式，系统将会引导您开通，请按照提示操作即可。<br/>
温馨提示：通过以上两种方式开通的前提是您已经开通了广发证券的网上交易服务，否则需到营业厅现场办理。
            	
            	<br />
			</div>

			<div id="list4" class="tabstxt" style="display:none">
            <p><img src="${ctx }/pic/mobile/tabt4.jpg" class="mb5" /></p>
            	提供实时的行情数据及强大的图标分析功能（包括：走势图、日/周/月等K线图），支持自选股同步管理等。<br />
            </div>

			<div id="list5" class="tabstxt" style="display:none">
            <p><img src="${ctx }/pic/mobile/tabt5.jpg" class="mb5" /></p>
            	提供广发证券研究团队动态研究报告、及时解盘、要闻点评等投资咨询参考信息以及广发证券精选财经内参、公司公告等。<br />
			</div>

			<div id="list6" class="tabstxt" style="display:none">
            <p><img src="${ctx }/pic/mobile/tabt6.jpg" class="mb5" /></p>
            	提供广发证券个性化资讯服务，同时实现与95575客服专席无缝对接。<br />
			</div>

			<div class="guidebox">
			  <div class="blank0"></div>
              <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="590" height="489">
                <param name="movie" value="${ctx }/pic/mobile/phoneV1.0.swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="opaque" />
                <param name="swfversion" value="9.0.45.0" />
                <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                <param name="expressinstall" value="/js/expressInstall.swf" />
                <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="${ctx }/pic/mobile/phoneV1.0.swf" width="590" height="489">
                  <!--<![endif]-->
                  <param name="quality" value="high" />
                  <param name="wmode" value="opaque" />
                  <param name="swfversion" value="9.0.45.0" />
                  <param name="expressinstall" value="/js/expressInstall.swf" />
                  <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                  <div>
                    <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                    <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
                  </div>
                  <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
              </object>
            </div>



    </div>
    <div class="clearfloat"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>