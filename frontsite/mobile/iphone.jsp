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
	sendRequest("${ctx}/phoneSoftUrl.do?method=getSoftDownUrl&sjzqtype=3&modelid=217936",3);
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
    <!-- download -->
    <div><p class="downloadP"><a href="http://itunes.apple.com/us/app/guang-fa-zheng-quan-jin-guan/id507399080?ls=1&mt=8" target="_blank" ><img src="${ctx }/pic/mobile/downloadBG_phone.png" alt="3" /></a><span>点击进入广发手机证券iPhone至慧版App Store下载页面 </span></p>
    	 <p class="downloadP" style="margin-top:10px;"><a href="###" onClick="downsoft()" ><img src="${ctx }/pic/mobile/downloadBG_all.png" alt="广发手机证券 iphone 手机至慧版炒股软件" /></a><span style="vertical-align: 39%;">将安装包下载保存到PC电脑上，再使用“91助手”软件进行安装，本方法适用于已完成越狱的Iphone手机</span></p>
    	 <br />
    	 <p>
    	 	<img src="${ctx }/images/qrcodeImages/iphone200.jpg" height="120" width="120"/>
    	 </p>
    </div>    
            <div class="clearfloat"></div> 
     		<br />      
          <h2>App Stroe版安装方法</h2>
          <h3 class="detailTitle">1、点击Iphone的App Stroe图标，进入到苹果商店</h3>
          <p><img width="258"  src="${ctx }/pic/mobile/clip/iphone01.jpg" alt="5" /></p><br />
           <h3 class="detailTitle">2、在搜索框里输入“广发手机证券”，点击“搜索”，可以看到广发手机证券两个iphone版本，选择第二个至慧版。</h3>
          <p><img width="258"  src="${ctx }/pic/mobile/clip/iphone02.jpg" alt="5" />
             <img width="258"  src="${ctx }/pic/mobile/clip/iphone03.jpg" alt="5" />
          </p><br />
           <h3 class="detailTitle">3、选择点击安装应用程序，自动跳到桌面进行安装</h3>
          <p><img width="258"   src="${ctx }/pic/mobile/clip/iphone04.jpg" alt="5" />
          <img width="258"  src="${ctx }/pic/mobile/clip/iphone05.jpg" alt="5" /></p>
             <br /> <br />      
      
          <h2>越狱版安装方法 </h2>
          	<h3 class="detailTitle">1、在PC机上安装“91助手”</h3>           
            <h3 class="detailTitle">2、输入网址（http://wap.gf.com.cn），下载“广发手机证券HD”安装包</h3>
            <P style="color:rgb(175,38,38)">&nbsp;&nbsp;（温馨提示：如果您下载的的文件名变成了*****.zip，请不要解压，直接重命名该文件名为*****.ipa）</P>
            <p ><img width="556"  src="${ctx }/pic/mobile/clip/iphone06.jpg" alt="5" /></p><br />
            <h3 class="detailTitle">3.通过USB把Iphone跟PC机连接起来，然后启动PC机上“91助手”</h3>           
            <h3  class="detailTitle">4.点击 “安装本地程序”按钮，然后选择下载至PC机的安装包，进行并完成安装</h3>  
            <p><img width="556"  src="${ctx }/pic/mobile/clip/iphone07.jpg" alt="5" /></p><br />
            
    </div>
            
            
            <div id="list2" class="tabstxt" style="display:none">
             <h2>广发手机证券iPhone手机至慧版 特色功能介绍</h2><br />
              <ol>
                <li class="detailTitle">▲沪深市场行情切换灵活方便，点击列表下方市场板块切换状态条即可切换 </li>
              </ol>
              <p><img width="246" height="369" src="${ctx }/pic/mobile/clip/iphone_clip_image002_0000.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1039.PNG" /> </p> <br />
              <ol>
                <li class="detailTitle">▲列表字段丰富、排序方式多样，包括涨速、市净率、市盈率、委比等字段，用户可点击列表下方字段按钮，编辑所需字段及前后顺序 </li>
              </ol>
              <p><img width="253" height="380" src="${ctx }/pic/mobile/clip/iphone_clip_image004_0000.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1040.PNG" /> </p> <br />
              <ol>
                <li class="detailTitle">▲全球市场行情丰富，包括全球指数、港股市场及股票行情、全球商品期货行情等等众多免费行情源 </li>
              </ol>
              <p><img width="232" height="348" src="${ctx }/pic/mobile/clip/iphone_clip_image006_0000.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1050.PNG" />      <img width="232" height="348" src="${ctx }/pic/mobile/clip/iphone_clip_image008.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1051.PNG" /> 
              <img width="242" height="363" src="${ctx }/pic/mobile/clip/iphone_clip_image010.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1052.PNG" /> </p> <br />
              
              <ol>
                <li class="detailTitle">▲板块监测，查看板块涨跌幅情况，点击可查看板块个股排行情况，把握人们股票 </li>
              </ol>
              <p><img width="226" height="339" src="${ctx }/pic/mobile/clip/iphone_clip_image012.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1042.PNG" />  <img width="226" height="339" src="${ctx }/pic/mobile/clip/iphone_clip_image014.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1043.PNG" /></p> <br />
              <ol>
                <li class="detailTitle">▲阶段统计，统计阶段性热门股票（换手率和涨跌幅排行） </li>
              </ol>
              <p><img width="250" height="375" src="${ctx }/pic/mobile/clip/iphone_clip_image016.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1041.PNG" /> </p> <br />
             
              <ol>
                <li class="detailTitle">▲最新浏览，保存最近的50个浏览记录，省去加自选股操作 </li>
              </ol>
              <p><img width="232" height="348" src="${ctx }/pic/mobile/clip/iphone_clip_image018.gif" alt="说明: C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\IMG_1124.png" /> </p> <br />
              <ol>
                <li class="detailTitle">▲个股资讯丰富，包括个股信息地雷/资讯以及F10</li>
              </ol>
              <p><img width="232" height="348" src="${ctx }/pic/mobile/clip/iphone_clip_image020.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1044.PNG" />  <img width="229" height="344" src="${ctx }/pic/mobile/clip/iphone_clip_image022.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1048.PNG" /></p> <br />
              <ol>
                <li class="detailTitle">▲指数贡献：查看沪深指数的指数贡献最大的前20只股票 </li>
              </ol>
              <p><img width="232" height="348" src="${ctx }/pic/mobile/clip/iphone_clip_image024.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1049.PNG" /> </p> <br />
             
              <ol>
                <li class="detailTitle">▲开放基金行情：提供基金净值走势图、基金持股、份额明细等基金信息 </li>
              </ol>
              <p><img width="227" height="340" src="${ctx }/pic/mobile/clip/iphone_clip_image026.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1046.PNG" />   <img width="227" height="340" src="${ctx }/pic/mobile/clip/iphone_clip_image028.gif" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\使用说明\iphone\IMG_1047.PNG" /></p> <br />
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