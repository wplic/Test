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
	sendRequest("${ctx}/phoneSoftUrl.do?method=getSoftDownUrl&sjzqtype=3&modelid=218275",3);
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
     	<p class="downloadP"><a href="###" onClick="downsoft()" ><img src="${ctx }/pic/mobile/downloadBG_all.png" alt="广发手机证券WindowPhone7 手机至慧版炒股软件" /></a><span> </span></p>
    	 <br />
    	<p>
    	<img src="${ctx }/images/qrcodeImages/wp7200.jpg"  height="120" width="120"/>
   	 	</p> 
    </div>
      <div class="clearfloat"></div> 
            <br />
     
        <h2>正版WP7手机安装 </h2>
        <ol>
          <li  class="detailTitle">1、进入手机“商店”，点击应用程序。 </li>
        </ol>
      
      <p><img width="244" height="400" src="${ctx }/pic/mobile/clip/wp7_clip_image002.jpg" alt="说明: 屏幕截图 (3)" /> </p><br />
      <ol>
        <ol>
          <li  class="detailTitle">2、搜索找到“广发手机证券”手机软件。 </li>
        </ol>
      </ol>
      <p><img width="241" height="399" src="${ctx }/pic/mobile/clip/wp7_clip_image004.jpg" alt="说明: 屏幕截图 (4)" /> </p><br />
      <ol>
        <ol>
          <li  class="detailTitle">3、点击“下载链接”即可进行下载。 </li>
        </ol>
      </ol>
      <p><img width="239" height="398" src="${ctx }/pic/mobile/clip/wp7_clip_image009.jpg" alt="说明: 屏幕截图 (6)" /> </p><br />
      <ol>
        <ol>
          <li  class="detailTitle">4、下载完毕后，系统显示提示页面，点击“安装”即可。 </li>
        </ol>
      </ol>
      <p><img width="239" height="398" src="${ctx }/pic/mobile/clip/wp7_clip_image006.jpg" alt="说明: 屏幕截图 (5)" /> </p><br />
      <ol>
        <ol>
          <li  class="detailTitle">5、安装完毕后可在系统文件中看到“广发手机证券”图标。 </li>
        </ol>
      </ol>
      <p><a name="_Toc312424427" id="_Toc312424427"></a><a name="_Toc311186958" id="_Toc311186958"><img width="279" height="465" src="${ctx }/pic/mobile/clip/wp7_clip_image008.jpg" alt="说明: C:\Users\Administrator\AppData\Roaming\Tencent\Users\183902880\QQ\WinTemp\RichOle\V~7%UW[L]9E]JK0OHHKTGJ3.jpg" /></a> </p><br />
     
   
        <h2>破解版WP7手机安装 </h2>
      
      <p class="detailTitle">1、使用第三方软件安装，以微风市场助手为例<br />（下载地址：<a href="http://www.9553.com/soft/15168.htm#soft_down">http://www.9553.com/soft/15168.htm#soft_down</a>） </p>
      <ol>
        <li class="detailTitle">2、下载“广发手机证券”安装包 </li>
        <li class="detailTitle">3、打开微风市场助手“EzMarket2.exe”程序 </li>
        <li class="detailTitle">4、将手机连接至电脑，点击上方部署按钮，将下载的以.xap结尾的程序包拖入部署区域，点击部署即可完成安装 </li>
      </ol>
      <p><img border="0" width="541" height="379" src="${ctx }/pic/mobile/clip/wp7_clip_image011.jpg" alt="说明: C:\Users\Administrator\AppData\Roaming\Tencent\Users\183902880\QQ\WinTemp\RichOle\{G2YFD%TWGH@IHE98SDEHS4.jpg" /> </p><br />
      <p>&nbsp;</p>
      <div>
        <div> </div>
      </div>
    </div>
            
            
            <div id="list2" class="tabstxt" style="display:none">
             <h2>广发手机证券WindowPhone7手机至慧版 特色功能介绍</h2><br />
              <ol>
                <li class="detailTitle">▲沪深市场种类齐全，包括沪深各市场以及基金、国债等行情 </li>
              </ol>
              <p><img width="222" height="371" src="${ctx }/pic/mobile/clip/wp7_clip_image002_0000.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\wp7\1.jpg" />  </p><br />
              <ol>
                <li class="detailTitle">▲列表字段丰富、排序方式多样，包括涨速、市净率、市盈率、委比等字段，用户可点击列表下方字段按钮，编辑所需字段及前后顺序 </li>
              </ol>
              <p><img width="228" height="381" src="${ctx }/pic/mobile/clip/wp7_clip_image004_0000.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\wp7\2.jpg" />  </p><br />
              <ol>
                <li class="detailTitle">▲全球市场行情丰富，包括全球指数、港股市场及股票行情、全球商品期货行情等等众多免费行情源 </li>
              </ol>
              <p><img width="232" height="388" src="${ctx }/pic/mobile/clip/wp7_clip_image006_0000.jpg" alt="说明: 全球市场行情丰富，包括全球指数、港股市场及股票行情、全球商品期货行情" />     <img width="234" height="390" src="${ctx }/pic/mobile/clip/wp7_clip_image008_0000.jpg" alt="说明:全球市场行情丰富，包括全球指数、港股市场及股票行情、全球商品期货行情" /><br />
                <br />
  <img width="232" height="388" src="${ctx }/pic/mobile/clip/wp7_clip_image010.jpg" alt="说明: 全球市场行情丰富，包括全球指数、港股市场及股票行情、全球商品期货行情" /> </p><br />
              <ol>
                <li class="detailTitle">▲板块监测，查看板块涨跌幅情况，点击可查看板块个股排行情况，把握人们股票 </li>
              </ol>
              <p><img width="232" height="388" src="${ctx }/pic/mobile/clip/wp7_clip_image012.jpg" alt="说明: ，查看板块涨跌幅情况" />     <img width="230" height="384" src="${ctx }/pic/mobile/clip/wp7_clip_image014.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\wp7\7.jpg" /><br /> </p>
              <ol>
                <li class="detailTitle">▲阶段统计，统计阶段性热门股票（换手率和涨跌幅排行） </li>
              </ol>
              <p><img width="220" height="367" src="${ctx }/pic/mobile/clip/wp7_clip_image016.jpg" alt="说明: 阶段统计，统计阶段性热门股票（换手率和涨跌幅排行）" /> </p><br />
              <ol>
                <li class="detailTitle">▲最新浏览，保存最近的50个浏览记录，省去加自选股操作 </li>
              </ol>
              <p><img width="226" height="378" src="${ctx }/pic/mobile/clip/wp7_clip_image018.jpg" alt="说明: 最新浏览，保存最近的50个浏览记录，省去加自选股操作" /> </p><br />
              <ol>
                <li class="detailTitle">▲个股资讯丰富，包括个股信息地雷/资讯以及F10</li>
              </ol>
              <p><img width="237" height="396" src="${ctx }/pic/mobile/clip/wp7_clip_image020.jpg" alt="说明: 个股资讯丰富，包括个股信息地雷/资讯以及F10" />  <img width="237" height="396" src="${ctx }/pic/mobile/clip/wp7_clip_image022.jpg" alt="说明: C:\Users\Administrator\Desktop\券商版本\广发证券\下载及特色等介绍\wp7\11.jpg" /><br /></p>
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