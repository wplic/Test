<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.handset.service.TfinanceCommendHandsetService"/>
<jsp:directive.page import="com.cssweb.handset.pojo.TfinanceCommendHandset"/>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TfinanceCommendHandsetService tfinanceCommendHandsetService = (TfinanceCommendHandsetService)ctx.getBean("tfinanceCommendHandsetService");
	List list1 = tfinanceCommendHandsetService.getHandsetByYys(1,1000);
	List list2 = tfinanceCommendHandsetService.getHandsetByYys(2,1000);
	List list3 = tfinanceCommendHandsetService.getHandsetByYys(3,1000);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js" type="text/javascript"></script>
<script type="text/javascript">
function initurl(){
	sendRequest("${ctx}/phoneSoftUrl.do?method=getSoftDownUrl&sjzqtype=3&modelid=218277",3);
}
function downsoft(){
	var softdownurl = document.getElementById("softurl").value;
	var softdownurl2 = document.getElementById("softurl2").value;
	if(''!=softdownurl){
		window.open(softdownurl);
	}else if(''!=softdownurl2){
		window.open(softdownurl2);
	}else{
		alert("没有找到相匹配的软件,请到品牌通用区下载！");
	}
}
function createXMLHttpRequest(){
		if (window.XMLHttpRequest) { 
　　 	XMLHttpReq = new XMLHttpRequest(); 
　　 }else if (window.ActiveXObject) { 
　　 	XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
　　 } 
}
function sendRequest(url,type){
	createXMLHttpRequest();
	XMLHttpReq.open("GET",url,true);
	if(3==type){
		XMLHttpReq.onreadystatechange=completeUrl;
	}
	XMLHttpReq.send(null);

}
function completeUrl(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
				var soft = XMLHttpReq.responseXML.getElementsByTagName("soft");
				if(soft.length>0){
					document.getElementById("softurl").value=soft[0].childNodes[3].firstChild.data;
					if(null!=soft[0].childNodes[4].firstChild)
						document.getElementById("softurl2").value=soft[0].childNodes[4].firstChild.data;
					else
						document.getElementById("softurl2").value='';
				}
		　　 }
	　　 }
	}
</script>
</head>

<body onLoad="initurl();completeUrl()">
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">广发手机证券</a> 
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
  		<jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=management1_3"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
        
        <ul class="motags">
       	  <li class="active" id="taglist1" onMouseOver="SwitchNews('list', 1, 2,'active','')"><p>软件下载</p></li>
       	  <li id="taglist2" onMouseOver="SwitchNews('list', 2, 2,'active','')"><p>特色功能</p></li>
         </ul> 
         
            <div id="list1" class="tabstxt">
            <div>
            	<p class="downloadP"><a href="###" onClick="downsoft()" ><img src="${ctx }/pic/mobile/downloadBG_all.png" alt="广发手机证券 Gpad 手机至慧版炒股软件" /></a><span></span>
            	</p>
            	<br />
            	<p>
            		<img src="${ctx }/images/qrcodeImages/gpad200.jpg" height="120" width="120"/>
            	</p>
    	
    </div>
     <div class="clearfloat"></div> 
            <br />                      
                
                  <h2>电脑安装方法 </h2>
                  <ol>
                    <li class="detailTitle">1、在电脑上安装豌豆荚或者91助手等工具进行安装，下面以豌豆荚软件为例 </li>
                    <li class="detailTitle">2、下载“广发手机证券HD”安装包，用户可至wap.gf.com.cn下载 </li>
                    <li class="detailTitle">3、使用数据线将gPad连接至电脑，豌豆荚会自动识别机器并且安装驱动 </li>
                  </ol>
                           
              <p>注意：用户需要在设定中应用程序开发中将USB调试打开 <br />
                <img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image002.jpg" alt="1" /></p><br />
              <ol>
                <ol>
                  <ol>
                    <li class="detailTitle">4、连接成功后双击电脑中下载的apk软件包，点击安装按钮即可安装 </li>
                  </ol>
                </ol>
              </ol>
              <p><img width="557" height="278" src="${ctx }/pic/mobile/clip/gpad_clip_image003.jpg" alt="2" /> </p>
            <br />
              <ol>
                <ol>
                  <li class="detailTitle">5、下载至gpad安装，用户需要通过具有文件管理软件来安装apk程序包（部分机型具有自带的文件管理软件，部分需要下载，推荐用户使用ES文件浏览器） </li>
                  <br />
                  <ol>
                    <li class="detailTitle">6、打开文件管理器 </li>
                  </ol>
                </ol>
              </ol>
              <p><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image006.jpg" alt="4" /> </p><br />
              <ol>
                <ol>
                  <ol>
                    <li class="detailTitle">7、查找到保存在SD卡中的程序，点击后即可安装 </li>
                  </ol>
                </ol>
              </ol>
              <p><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image008.jpg" alt="5" /> </p><br />
            </div>
            
            
            <div id="list2" class="tabstxt" style="display:none">
             <h2>广发手机证券GPad至慧版 特色功能介绍</h2><br />
              <ol>
                <li class="detailTitle">▲行情源丰富，包括国内股票/期货/港股/外盘行情等等最全面的行情源 </li>
              </ol>
              <p><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image002_0000.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-084656.jpg" /> </p><br />
              <ol>
                <li class="detailTitle">▲资讯丰富，包括由广发证券提供的专业资讯内容以及详尽的个股F10、资讯内容 </li>
              </ol>
              <p class="detailTitle"><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image004.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-084721.jpg" /> <br /><br />
                ▲广发手机证券资讯 </p>
              <p class="detailTitle"><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image006_0000.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-085307.jpg" /> <br /><br />
                ▲个股F10资讯 </p>
              <ol>
                <li>板块监测，显示当日各板块涨跌幅情况，点击后可查看板块中个股的涨跌幅排名 </li>
              </ol>
              <p class="detailTitle"><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image008_0000.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-084709.jpg" /> <br /><br />
                ▲板块涨跌幅 </p>
               <p class="detailTitle"> <img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image010.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-084714.jpg" /><br /><br />
                ▲板块个股涨跌幅排行 <br />
              </p>
              <ol>
                <li>阶段统计，统计7日/30日换手率和涨跌幅排行情况，寻找热门股票 </li>
              </ol>
              <p><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image012.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-091927.jpg" /> </p><br />
              <ol>
                <li class="detailTitle">▲交易功能丰富，支持闪电下单、超时保护功能 </li>
              </ol>
              <p class="detailTitle"><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image014.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-084741.jpg" /> <br /><br />
                ▲支持市价限价委托、支持多银行存管业务、开放基金及场内基金业务 </p>
              <p class="detailTitle"><img width="554" height="346" src="${ctx }/pic/mobile/clip/gpad_clip_image016.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\SC20120309-085256.jpg" /> <br /><br />
                ▲点击买卖盘即可实现闪电下单功能 </p>
            </div>
            
            
            <div class="blank10"></div>
            
    
        
</div>
  <div class="blank0"></div>

</div>
<input type="hidden" name="softurl" id="softurl" value=""/>
<input type="hidden" name="softurl2" id="softurl2" value=""/>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>