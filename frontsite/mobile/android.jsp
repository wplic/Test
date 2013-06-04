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
	sendRequest("${ctx}/phoneSoftUrl.do?method=getSoftDownUrl&sjzqtype=3&modelid=218276",3);
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
         
            <div id="list1" class="tabstxt" >
             <div>
             	<p class="downloadP"><a href="###" onClick="downsoft()" ><img src="${ctx }/pic/mobile/downloadBG_all.png" alt="广发手机证券Android 手机至慧版炒股软件" /></a><span></span></p>
    			<br />
    			<p>
            		<img src="${ctx }/images/qrcodeImages/android200.jpg"  height="120" width="120"/>
            	</p>
    </div>
     <div class="clearfloat"></div> 
            <br />
              <p>欢迎您安装使用“广发手机证券Android版炒股软件，Android版安装方法有两种： <br />
                第一种是在Android手机上下载安装包，再使用资源管理器类软件打开安装。本方法需要手机已经安装资源管理器类软件。 <br />
                第二种是在PC电脑上下载安装包，再使用“91助手”、“豌豆荚手机精灵”等软件进行安装，本方法需要在PC电脑安装相应的辅助软件。 </p>
          
              <p><h2>Adroid手机下载安装方法 </h2>
               <font class="detailTitle">1、打开手机浏览器，输入网址（<a href="http://wap.gf.com.cn">http://wap.gf.com.cn</a>），下载相应的APK安装程序，并储存在手机中。 </font> <br />
  <img src="${ctx }/pic/mobile/clip/android_clip_image02.gif" alt="21" width="213" height="378" /></p>
             <br /> <p class="detailTitle">2、退出浏览器，用资源管理器软件找到刚刚下载储存下来的安装程序，点击安装。 <br />
                 <img src="${ctx }/pic/mobile/clip/android_clip_image04.gif" alt="22" width="213" height="378" /></p>
              <br /><p class="detailTitle">3、安装完成后，您就可以看到安装成功的提示。 <br />
                  <img src="${ctx }/pic/mobile/clip/android_clip_image06.gif" alt="23" width="213" height="378" /></p>
             <br /> <p><h2>PC电脑下载安装方法 </h2>
               <font class="detailTitle">1、在电脑上安装91助手，未安装用户可至91助手官网下载，网址：<a href="http://zs.91.com/">http://zs.91.com/</a></font> </p>
              <p class="detailTitle">2、输入网址（http://wap.gf.com.cn），下载“广发手机证券HD”安装包 <br />
                  <img src="${ctx }/pic/mobile/clip/android_clip_image08.jpg" alt="24" width="554" height="385" border="0" /></p>
              <br /><p class="detailTitle">3、使用数据线将手机连接至电脑，连接成功后，打开安装助手，用户选中“游戏·软件”选项，点击“安装本地程序”，然后选取已下载至本地的“广发手机证券ＨＤ“软件，点击打开即可安装。 <br />
                  <img src="${ctx }/pic/mobile/clip/android_clip_image01.jpg" alt="25" width="554" height="390" border="0" /></p>
              <p>&nbsp;</p>
            </div>
            
            
            <div id="list2" class="tabstxt" style="display:none">
             <h2>广发手机证券Android手机至慧版 特色功能介绍</h2><br />
         <p class="detailTitle">一、沪深市场行情切换灵活方便，点击列表下方市场板块切换状态条即可切换 <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image002.gif" alt="1" width="213" height="378" /> </p>
<p>&nbsp;</p>
<p class="detailTitle">二、列表字段丰富、排序方式多样，包括涨速、市净率、市盈率、委比等字段，用户可 <br />
  点击列表下方字段按钮，编辑所需字段及前后顺序 <br />
  <img src="${ctx }/pic/mobile/clip/android_clip_image004.gif" alt="2" width="213" height="378" /> <br />
  <p>&nbsp;</p>
  <font class="detailTitle">三、全球市场行情丰富，包括全球指数、港股市场及股票行情、全球商品期货行情等等众多免费行情源</font> <br />
   <br />
  <img src="${ctx }/pic/mobile/clip/android_clip_image006.gif" alt="3" width="213" height="378" />      <img src="${ctx }/pic/mobile/clip/android_clip_image008.gif" alt="4" width="213" height="378" /></p>
<p><img src="${ctx }/pic/mobile/clip/android_clip_image010.gif" alt="5" width="213" height="378" /> </p>
<p>&nbsp;</p>
<p class="detailTitle">四、板块监测，查看板块涨跌幅情况，点击可查看板块个股排行情况，把握人们股票 <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image012.gif" alt="6" width="213" height="378" />     <img src="${ctx }/pic/mobile/clip/android_clip_image014.gif" alt="7" width="213" height="378" /> </p>
<p>&nbsp;</p>
<p class="detailTitle">五、阶段统计，统计阶段性热门股票（换手率和涨跌幅排行） <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image016.gif" alt="8" width="213" height="378" /> </p>
<p>&nbsp;</p>
<p class="detailTitle">六、最新浏览，保存最近的50个浏览记录，省去加自选股操作 <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image018.gif" alt="9" width="212" height="377" /></p>
<p>&nbsp;</p>
<p class="detailTitle">七、个股资讯丰富，包括个股信息地雷/资讯以及F10 <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image020.gif" alt="10" width="213" height="378" />      <img src="${ctx }/pic/mobile/clip/android_clip_image022.gif" alt="11" width="213" height="378" /> </p>
<p>&nbsp;</p>
<p class="detailTitle">八、指数贡献：查看沪深指数的指数贡献最大的前20只股票 <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image024.gif" alt="12" width="213" height="378" /> </p>
<p>&nbsp;</p>
<p class="detailTitle">九、开放基金行情：提供基金净值走势图、基金持股、份额明细等基金信息 <br />
    <img src="${ctx }/pic/mobile/clip/android_clip_image026.gif" alt="13" width="213" height="378" />   <img src="${ctx }/pic/mobile/clip/android_clip_image028.gif" alt="14" width="213" height="378" /></p>

     

          
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