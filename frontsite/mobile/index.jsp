<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.handset.service.TfinanceCommendHandsetService"/>
<jsp:directive.page import="com.cssweb.handset.pojo.TfinanceCommendHandset"/>
<jsp:directive.page import="java.util.List"/>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TfinanceCommendHandsetService tfinanceCommendHandsetService = (TfinanceCommendHandsetService)ctx.getBean("tfinanceCommendHandsetService");
	List list = tfinanceCommendHandsetService.getHandsetMapOrderById(5);
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
<script type="text/javascript" src="${ctx }/js/qrcode/popup.js"></script> 
<script type="text/javascript" src="${ctx }/js/qrcode/tinybox.js"></script> 
<style type="text/css">
</style>
<script>
	function openQrcode(val){
		/*var url = "${ctx}/commons/qrcode/qrcode.jsp?width=200&height=200&softUrl="+val;
		var pop=new Popup({ contentType:1,isReloadOnClose:false,width:220,height:225});
        pop.setContent("contentUrl",url);
        pop.setContent("title","扫描二维码");
        pop.build();
        pop.show();*/
        var img = "";
        if(val=="ipad"){
        	img = "ipad200.jpg";
        }
        if(val=="iphone"){
        	img = "iphone200.jpg";
        }
        if(val=="gpad"){
        	img = "gpad200.jpg";
        }
        if(val=="android"){
        	img = "android200.jpg";
        }
        if(val=="wp7"){
        	img = "wp7200.jpg";
        }
        var strHtml = "<p align=\"center\"><img style=\"padding-top:12px;\" src=\"${ctx }/images/qrcodeImages/"+img+"\"/></p>";
        var pop=new Popup({ contentType:2,isReloadOnClose:false,width:220,height:225});
        pop.setContent("contentHtml",strHtml);
        pop.setContent("title","扫描二维码下载");
        pop.build();
        pop.show();
	}
</script>
</head>

<body> 
<input type="hidden" id="yyy"/>
<input type="hidden" id="xxx"/>
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">
  当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; 广发手机证券 
   <jsp:include page="/mobile/pmdList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="2"/>
				    	</jsp:include>
  </div>
  <div class="blank5"></div>
</div>
<div class="mobox">
  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=null"/>
  </div>
  
  
<div class="moright">
  		<p>
  		<jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include>
  		</p>
        <div class="blank10"></div>
        <div class="lc_tit"></div>
        <div class="lc_box">
       	  <div class="left">
            	<ul>
                  <li class="a01">发送“<span class="red">DB B</span>”到“<span class="red">95575</span>”免费注册<span class="f12">(<span class="red">注：</span>DB与B之间须有空格)</span></li>
                  <li class="a02">手机访问<a href="http://wap.gf.com.cn"> <span class="red">wap.gf.com.cn</span></a>（iphone手机请直接访问<span style="display:block;line-height:17px;">AppStore）下载广发手机证券</span></li>
                  <li class="a03">启动广发手机证券<span class="red">输入手机号码</span>登录</li>
                </ul>
          </div>
            <div class="right"><a href="softdown.jsp?nav=wsyyt&nav1=gfydjyt" onFocus="this.blur()"><img src="${ctx }/pic/mobile/btn_dow.jpg" class="btndow" /></a></div>
            <div class="clearfloat"></div>
        </div>
        <div class="blank10"></div>
        <!-- 
        <div class="rtit1"><span class="more">我们还有更多支持机型，点击<span class="red"><a href="recommend.jsp?nav=wsyyt&nav1=gfydjyt">详细</a></span>查看支持机型</span>推荐机型</div>
         -->
         
<div class="plamform">       

  <div class="subplam">
    <div  class="plam_head"><img src="${ctx }/pic/mobile/ios.png"/></div>   
    <div class="plam_subhead" >
	   <ul> <a title="iPad至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/ipad.jsp"><li id="tagtd2" onmouseover="Switch2('td', 2, 5,'tdactive1','mttd1')" class="mttd1">
			iPad版
			</li></a>
	         <a title="iPhone手机至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/iphone.jsp"> <li id="tagtd1" onmouseover="Switch2('td', 1, 5,'tdactive1','mttd1')"  class="mttd1">
		    iPhone版
		    </li>
		    </a>			
			</ul>
	</div> 
	 <div class="plam_pic">
		 <div id="td2" style="width:220px;">
	      <p align="center"><a title="iPad至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/ipad.jsp">
	     <img src="${ctx }/pic/mobile/ipad2.jpg" style="margin:10px 0 0 17px;"></img>
	      </a></p>
			<table width="220" align="center" style="margin-top: 25px;">
					<tr>
						<td rowspan="2" align="center" width="60%">
							<img src="${ctx }/images/qrcodeImages/ipad80.jpg"/>
						</td>
						<td>
							<p style="line-height: -5px; font-weight: bold;">二维码下载</p>
						</td>
					</tr>
					<tr>
						<td>
							<p style="margin-top: 4px;">
								<input type="button" onclick="openQrcode('ipad')" class="btn_qrcode" value="点击放大" style="font-weight: bold;"/>
							</p>
						</td>
					</tr>
				</table> 
	     </div>
		  <div id="td1"  style="display:none; width:220px;">
		  <p align="center"><a title="iPhone手机至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/iphone.jsp">
		     <img src="${ctx }/pic/mobile/mobi02.jpg"></img>
		  </a></p>
		  <table width="220" align="center">
				<tr>
					<td rowspan="2" align="center" width="60%">
						<img src="${ctx }/images/qrcodeImages/iphoneSmall.jpg"/>
					</td>
					<td>
						<p style="line-height: -5px;font-weight: bold;">二维码下载</p>
					</td>
				</tr>
				<tr>
					<td>
						<p style="margin-top: 4px;">
							<input type="button" onclick="openQrcode('iphone')" class="btn_qrcode" value="点击放大" style="font-weight: bold;"/>
						</p>
					</td>
				</tr>
			</table> 
	      </div>
	      
    </div>	
  </div>  
 
<div class="subplam">
    <div  class="plam_head"><img src="${ctx }/pic/mobile/android.png"/></div>   
    <div class="plam_subhead" >
	   <ul>
	   <a title="Gpad至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/gpad.jsp"><li id="tagtd4" onmouseover="Switch2('td', 4, 5,'tdactive1','mttd1')"  class="mttd1">
		GPad版
		</li></a>
	   <a title="Android手机至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/android.jsp"> <li id="tagtd3" onmouseover="Switch2('td', 3, 5,'tdactive1','mttd1')"  class="mttd1">
		 手机版
	    </li></a>
		</ul>
	</div> 
	 <div class="plam_pic">
	 <div id="td4" >
		      <a title="gPad至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/gpad.jsp">
		      <img src="${ctx }/pic/mobile/gpad.jpg"></img>
		      </a>
		      <table width="220" align="center">
				<tr>
					<td rowspan="2" align="center" width="60%">
						<img src="${ctx }/images/qrcodeImages/gpad80.jpg"/>
					</td>
					<td>
						<p style="line-height: -5px;font-weight: bold;">二维码下载</p>
					</td>
				</tr>
				<tr>
					<td>
						<p style="margin-top: 4px;">
							<input type="button" onclick="openQrcode('gpad')" class="btn_qrcode" value="点击放大" style="font-weight: bold;"/>
						</p>
					</td>
				</tr>
			</table> 
		      </div>
		  <div id="td3"  style="display:none;width: 220px;">
		    <p align="center"><a title="Android手机至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/android.jsp">
		     <img src="${ctx }/pic/mobile/mobi01.jpg"></img>
		    </a></p>
		    <table width="220" align="center">
				<tr>
					<td rowspan="2" align="center" width="60%">
						<img src="${ctx }/images/qrcodeImages/android80.jpg"/>
					</td>
					<td>
						<p style="line-height: -5px;font-weight: bold;">二维码下载</p>
					</td>
				</tr>
				<tr>
					<td>
						<p style="margin-top: 4px;">
							<input type="button" style="font-weight: bold;" onclick="openQrcode('android')" class="btn_qrcode" value="点击放大"/>
						</p>
					</td>
				</tr>
			</table> 
		     </div>		      
    </div>	
  </div>  
  
  <div class="subplam">
    <div  class="plam_head"><img src="${ctx }/pic/mobile/winp1.png"/></div>   
    <div class="plam_subhead" >
	   <ul style="background:url(../pic/mobile/subheadBG_long.gif) no-repeat;">
	   <a title="Windows Phone7至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/wp7.jsp"> <li id="tagtd5" onmouseover="Switch2('td', 5, 5,'tdactive1','mttd1')"  class="mttd1" style="width:100%"> 
    	Windows Phone7
     </li></a>
     </ul>
	</div> 
	 <div class="plam_pic">
		<div id="td5"  style="display:block;width: 220px;">
	    <p align="center"><a title="Windows Phone7至慧版，内容丰富，面向高端，点击查看更多详情……" href="${ctx }/mobile/wp7.jsp">
	    <img src="${ctx }/pic/mobile/mobi03.jpg"></img>
	    </a></p>
	     <table width="220" align="center">
				<tr>
					<td rowspan="2" align="center" width="60%">
						<img src="${ctx }/images/qrcodeImages/wp780.jpg"/>
					</td>
					<td>
						<p style="line-height: -5px;font-weight: bold;">二维码下载</p>
					</td>
				</tr>
				<tr>
					<td>
						<p style="margin-top: 4px;">
							<input type="button" onclick="openQrcode('wp7')" class="btn_qrcode" style="font-weight: bold;" value="点击放大"/>
						</p>
					</td>
				</tr>
			</table> 
	    </div>
    </div>	
  </div>  
        	
         </div>
    <div class="blank5"></div>
        <div class="rtit2"><span class="more"><span class="red"><a href="${contextPath }/mobile/indexHdxw.jsp">更多&gt;&gt;</a></span></span>最新动态</div>
        <jsp:include page="/mobile/indexList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="5"/>
				    	</jsp:include>
        
  </div>
  <div class="clearfloat"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
<div id="popBox1" style="display: none;">
</div>
</body>
</html>