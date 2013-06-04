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
	sendRequest("${ctx}/phoneSoftUrl.do?method=getSoftDownUrl&sjzqtype=3&modelid=217934",3);
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
    <div><p class="downloadP"><a href="http://itunes.apple.com/cn/app/guang-fa-zheng-quan-jin-guan/id507402511?mt=8" target="_blank"><img src="${ctx }/pic/mobile/downloadBG_phone.png" alt="3" /></a><span>点击进入广发手机证券IPad至慧版App Store下载页面 </span></p>
    	 <p class="downloadP" style="margin-top:10px;"><a href="###" onClick="downsoft()" ><img src="${ctx }/pic/mobile/downloadBG_all.png" alt="广发手机证券 ipad 手机至慧版炒股软件" /></a><span style="vertical-align: 39%;">将安装包下载保存到PC电脑上，再使用“91助手”软件进行安装，本方法适用于已完成越狱的Ipad平板电脑</span></p>
    	 <br />
    	 <p>
    	 	<img src="${ctx }/images/qrcodeImages/ipad200.jpg" height="120" width="120"/>
    	 </p>
    </div>
            <div class="clearfloat"></div> 
            <br />
      
          <h2>App Stroe版安装方法</h2>
          <h3 class="detailTitle">1.点击iPad上App Store</h3>
          <p><img width="554" height="415" src="${ctx }/pic/mobile/clip/ipad01.jpg" alt="5" /></p><br />
           <h3 class="detailTitle">2.搜索广发手机证券，点击“安装“按钮，需要输入App Store账号密码</h3>
          <p><img width="554" height="415" src="${ctx }/pic/mobile/clip/ipad02.jpg" alt="5" /></p><br />
           <h3 class="detailTitle">3.输入成功后跳至桌面进行安装</h3>
          <p><img width="554" height="415" src="${ctx }/pic/mobile/clip/ipad03.jpg" alt="5" /></p>   <br /> <br />      
      
          <h2>越狱版安装方法 </h2>
          	<h3 class="detailTitle">1.在电脑上安装91助手，未安装用户可至91助手官网下载，网址：http://zs.91.com/</h3>           
            <h3 class="detailTitle">2.下载“广发手机证券HD”安装包</h3>
            <P style="color:rgb(175,38,38)">&nbsp;&nbsp;（温馨提示：如果您下载的的文件名变成了*****.zip，请不要解压，直接重命名该文件名为*****.ipa）</P>
            <h3 class="detailTitle">3.使用数据线将iPad连接至电脑</h3>           
            <h3 class="detailTitle">4.连接成功后安装广发手机证券</h3>          
           	<p>&nbsp;&nbsp;用户选中“游戏•软件”选项，点击“安装本地程序”，然后选取已下载至本地的“广发手机证券ＨＤ“软件，点击打开即可安装</p>
            <p><img width="632" src="${ctx }/pic/mobile/clip/ipad04.jpg" alt="5" /></p><br />
            <p><img width="568"  src="${ctx }/pic/mobile/clip/ipad05.jpg" alt="5" /></p>
    </div>
            
            
            <div id="list2" class="tabstxt" style="display:none">
            <h2>广发手机证券iPad至慧版 特色功能介绍</h2><br />
              <ol>
                <li class="detailTitle">▲行情源丰富，包括国内股票/期货/港股/外盘行情等等最全面的行情源 </li>
              </ol>
              <p><img width="506" height="379" src="${ctx }/pic/mobile/clip/ipad_clip_image002_0000.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0142.png" /> </p><br />
              <p class="detailTitle">▲点击个股可预览该股的分时/K线图 <br />
                  <img width="503" height="377" src="${ctx }/pic/mobile/clip/ipad_clip_image004.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0148.png" /> </p><br />
              <ol>
                <li class="detailTitle">▲资讯丰富，包括由广发证券提供的专业资讯内容以及详尽的个股F10、资讯内容 </li>
              </ol>
              <p class="detailTitle"><img width="486" height="365" src="${ctx }/pic/mobile/clip/ipad_clip_image006.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0143.png" /> <br /><br />
                ▲广发手机证券资讯 </p>
              <p class="detailTitle"><img width="486" height="365" src="${ctx }/pic/mobile/clip/ipad_clip_image008_0000.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0144.png" /> <br /><br />
               ▲ 个股F10资讯 </p>
              <ol>
                <li>个股详情的滑动查看，用户可以通过滑动屏幕依次查看分时/K线/个股资讯/成交明细 </li>
              </ol>
              <p class="detailTitle"><img width="268" height="201" src="${ctx }/pic/mobile/clip/ipad_clip_image010_0000.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0139.png" /> <img width="268" height="201" src="${ctx }/pic/mobile/clip/ipad_clip_image012_0000.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0149.png" /><br /><br />
               ▲ 分时图成交明细 </p>
              <ol>
                <li>板块监测，显示当日各板块涨跌幅情况，点击后可查看板块中个股的涨跌幅排名 </li>
              </ol>
              <p class="detailTitle"><img width="268" height="201" src="${ctx }/pic/mobile/clip/ipad_clip_image014.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0150.png" />  <img width="267" height="200" src="${ctx }/pic/mobile/clip/ipad_clip_image016.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0151.png" /><br /><br />
                ▲板块涨跌幅，点击成份进入板块个股排行                                       </p>
              <ol>
                <li>交易功能丰富，支持闪电下单、超时保护功能 </li>
              </ol>
              <p class="detailTitle"><img width="515" height="386" src="${ctx }/pic/mobile/clip/ipad_clip_image018.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0146.png" /> <br /><br />
               ▲ 支持市价限价委托、支持多银行存管业务、开放基金及场内基金业务 </p>
              <p><img width="554" height="415" src="${ctx }/pic/mobile/clip/ipad_clip_image020.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_0141.png" /> <br /><br />
             </p> <p class="detailTitle"> ▲ 点击买卖盘即可实现闪电下单功能 </p>
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