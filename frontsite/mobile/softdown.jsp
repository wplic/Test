<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.phoneSoft.service.PhoneBrandInfoService"/>
<jsp:directive.page import="com.cssweb.phoneSoft.pojo.PhoneBrandInfo"/>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		PhoneBrandInfoService phoneBrandInfoService = (PhoneBrandInfoService)ctx.getBean("phoneBrandInfoService");
		List brandlist = phoneBrandInfoService.getPhoneBrandInfo();
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
 <script language="javascript">
	function getCity(brandid){
	    sendRequest("${ctx}/phoneModelInfo.do?method=getModelByBrandList&brandid="+brandid,1); 
	}
	function getPhoto(modelid){
		if(''!=modelid)
	   		sendRequest("${ctx}/phoneModelInfo.do?method=getModelPhotoById&modelid="+modelid,2); 
	   	else
	   		document.getElementById("phonephoto").src='${ctx }/pic/mobile/mobi00.jpg';
	}
	function getUrl(sjzqtype){
		//var sjzqtype = sjzqtypeselect.value;
		var modelid = document.getElementById("modelselect").value;
		if(''!=sjzqtype && ''!=modelid)
	    	sendRequest("${ctx}/phoneSoftUrl.do?method=getSoftDownUrl&sjzqtype="+sjzqtype+"&modelid="+modelid,3); 
	}
	function downsoft(){
		var softdownurl = document.getElementById("softurl").value;
		var softdownurl2 = document.getElementById("softurl2").value;
		if(''==softdownurl){
			alert("没有找到相匹配的软件,请到品牌通用区下载！");
		}else{
			//if(softdownurl.indexOf(".jad")>0 || softdownurl.indexOf(".JAD")>0
			//|| softdownurl.indexOf(".cab")>0 || softdownurl.indexOf(".CAB")>0)
			//	window.open("${ctx}/mobile/downfile.jsp?fileName="+softdownurl);
			//else
				
				//弹出下载
			if(''!=softdownurl2)
				window.open(softdownurl2);
			window.open(softdownurl);
			
			var brandid = document.getElementById("brandselect").value;
			var modelid = document.getElementById("modelselect").value;
			var sjzqtype = document.getElementById("sjzqtypeselect").value;
			var softid = document.getElementById("softid").value;
			if(''!=sjzqtype && ''!=modelid && ''!=brandid)
		    	sendRequest("${ctx}/phoneSoftUrl.do?method=addPhoneSoftDownLog&sjzqtype="+sjzqtype+"&modelid="+modelid+"&brandid="+brandid+"&softid="+softid,4);
			//softurl.value = '';
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
		if(1==type)
			XMLHttpReq.onreadystatechange=completeModel;
		else if(2==type)
			XMLHttpReq.onreadystatechange=completePhoto;
		else if(3==type)
			XMLHttpReq.onreadystatechange=completeUrl;
		else if(3==type)
			XMLHttpReq.onreadystatechange=completeDown;
		XMLHttpReq.send(null);
	
	}
	function completeModel(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var city = XMLHttpReq.responseXML.getElementsByTagName("model");
			　　 var modelIds = new Array();
				var modelNames = new Array();
			　　 for(var i = 0;i < city.length; i++){
					modelIds[i] = city[i].childNodes[0].firstChild.data;
					modelNames[i] = city[i].childNodes[1].firstChild.data;
			　　 }
			　　 buildSelect(modelIds, modelNames, document.getElementById("modelselect"));
				document.getElementById("softid").value='';
				document.getElementById("version").innerHTML='';
				document.getElementById("versiontime").innerHTML='';
				document.getElementById("softurl").value='';
				document.getElementById("softurl2").value='';
		　　 }
	　　 }
	}
	function buildSelect(modelIds, modelNames, select) {
	　　 select.options.length = 0;
		if(modelNames.length>0){
		　　 select.options[select.options.length] = new Option('请选择...', '');
		　　 for(var i = 1;i <= modelNames.length; i++) {
		　　 	select.options[select.options.length] = new Option(modelNames[i-1], modelIds[i-1]);
			}
		}
	}
	function completePhoto(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var photo = XMLHttpReq.responseText;
				if(''==photo || '0'==photo)
					document.getElementById("phonephoto").src='${ctx }/pic/mobile/mobi00.jpg';
				else
					document.getElementById("phonephoto").src='${ctx }/share/showUploadImage.jsp?id='+photo;
				//if(''==softurl.value){
					getUrl(document.getElementById("sjzqtypeselect").value);
				//}
		　　 }
	　　 }
	}
	function completeUrl(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
				var soft = XMLHttpReq.responseXML.getElementsByTagName("soft");
				if(soft.length>0){
					document.getElementById("softid").value=soft[0].childNodes[0].firstChild.data;
					document.getElementById("version").innerHTML=soft[0].childNodes[1].firstChild.data;
					document.getElementById("versiontime").innerHTML=soft[0].childNodes[2].firstChild.data;
					document.getElementById("softurl").value=soft[0].childNodes[3].firstChild.data;
					if(null!=soft[0].childNodes[4].firstChild)
						document.getElementById("softurl2").value=soft[0].childNodes[4].firstChild.data;
					else
						document.getElementById("softurl2").value='';
					document.getElementById("attention").innerHTML='';
				}else{
					document.getElementById("softid").value='';
					document.getElementById("version").innerHTML='';
					document.getElementById("versiontime").innerHTML='';
					document.getElementById("softurl").value='';
					document.getElementById("softurl2").value='';
					document.getElementById("attention").innerHTML='没有找到相匹配的软件,请到品牌通用区下载！';
				}
		　　 }
	　　 }
	}
	function completeDown(){
	}
 </script>
</head>

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
  		<jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=management1_1"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
	
    <div class="blank10"></div>
        <div class="rtit2"><span class="more"><span class="red"><a href="#">更多&gt;&gt;</a></span></span>“金管家”手机证券软件下载</div>
        <div class="softbox">
        	<div class="tit1"></div>
            <div class="content">
              <p class="lh28">
               <span class="red">金管家手机至慧版</span>，编辑短信“<span class="red">DB A</span>”发送到“<span class="red">95575</span>”；<br />
              <span class="red">金管家手机至强版</span>，编辑短信“<span class="red">DB B</span>”发送到“<span class="red">95575</span>”；<br />
                <span class="red">金管家手机至诚版</span>，编辑短信“<span class="red">DB C</span>”发送到“<span class="red">95575</span>”；<br />
               
              稍后您的手机将会收到回复短信，请点击链接地址进入下载；<br />
如果您长时间未收到回复短信，手机访问“<a href="http://wap.gf.com.cn"> <span class="red">wap.gf.com.cn</span></a>”，按提示操作。<br />
温馨提示：如果您已成功安装金管家手机证券，通过短信注册时，只要您成功发送短信，即可登录使用，勿需等待短信回复。
             </p>
            </div>
        </div>
        
        <div class="softbox">
        	<div class="tit2"></div>
            <div class="content">
           	  	<div class="computerA">
           	    <p class="mb20">手机品牌：
           	    	<select name="brandselect" id="brandselect" style="width:100px; t" onchange="getCity(this.value)">
						<option value="">请选择...</option>
				    	<%if(null!=brandlist && brandlist.size()>0){
				    		for(int i=0;i<brandlist.size();i++){
				    			PhoneBrandInfo brand = (PhoneBrandInfo)brandlist.get(i);%>
					      		<option value="<%=brand.getId()%>"><%=brand.getBrandname()%></option>
					    <%	}
					    } %>
      				</select></p>
				<p class="mb20">手机型号：
					<select name="modelselect" id="modelselect" style="width:100px" onchange="getPhoto(this.value)">
						<option value="">请选择...</option>
                  	</select></p>
                <p class="mb20">版本类型：
                	<select name="sjzqtypeselect" id="sjzqtypeselect" style="width:100px" onchange="getUrl(this.value)">
						<option value="">请选择...</option>
						<option value="1" selected>至 强 版</option>
						<option value="2">至 诚 版</option>
						<option value="3">至 慧 版</option>
                    </select>
                </p>
                <!-- 下载按钮 -->
                <img src="${ctx }/pic/mobile/btn_dow2.jpg" onclick="downsoft()" style="cursor:pointer"/>
                </div>
                <div class="computerB">
                	<p class="ynbox"><img id="phonephoto" width="97" height="141" src="${ctx }/pic/mobile/mobi00.jpg"  /></p>
                </div>
                <input type="hidden" name="softid" id="softid" value=""/>
                <input type="hidden" name="softurl" id="softurl" value=""/>
                <input type="hidden" name="softurl2" id="softurl2" value=""/>
                <div class="computerC">
                	适合您手机的版本为：<span name="version" id="version" class="red">--</span><br />
                  	版本更新时间：<span name="versiontime" id="versiontime" class="red">--</span><br />
                  	点击“<span class="red">下载</span>”按钮将“<span class="red">金管家</span>”安装包下载到您的电脑，然后通过数据线安装到您的手机。<br />
                  	<span name="attention" id="attention" class="red bold"></span><br />
                </div>
              <div class="blank0"></div>
          </div>
        </div>
        
        
        <div class="softbox">
        	<div class="tit3"></div>
            <div class="content">
              <p class="lh28">通过手机上网直接输入：<span class="red">wap.gf.com.cn</span><br />
              		即可快速下载“金管家”手机证券<br /></p>
            </div>
        </div>
        
        
        
        
        
  </div>
  <div class="clearfloat"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>