<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.*"/>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
 <style>
#Loading {position:absolute; z-index:10;left:10px;top:10px;border:1px #666666 solid;background:#eeeeee;width:10px;height:10px}
</style>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${contextPath }/js/jquery-1.7.2.min.js"></script>	
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>

<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
 String branchCode="";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String packageId="8";
String packageName="优享套餐"; 
String levelsName="";//服务身体等级名字
List userlist=null;
String sjurl="/Subscribe/zzdy.jsp";
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
//TcsswebDcxdzService dcxService = (TcsswebDcxdzService)ctx.getBean("tcsswebDcxdzService");
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");
TsystemWebuser tsystemWebuser=null;
if(request.getSession().getAttribute("tsystemWebuser")!=null)
{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	if (tsystemWebuser.getUserType().endsWith("2")) {
%>
	<script type="text/javascript">
		alert(" 您是体验用户申请请您成为交易客户！");
		var url = "https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do";
		document.location.href=url;
	</script>
<%
	}else{
		userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getUserName());
	}
	if(userlist!=null&&userlist.size()>0)
	{
		 TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)userlist.get(0);
		 packageId=String.valueOf(tcsswebFwcpcx.getProductId());
		 if(packageId.equals("8"))
		 packageName="基础服务资讯";
		 else if(packageId.equals("9"))
		 packageName="乐享套餐";
		 else if(packageId.equals("10"))
		 packageName="优享套餐";
		 else if(packageId.equals("11"))
		 packageName="尊享套餐";
		 
		if(packageId.equals("8"))
	    sjurl="/Subscribe/zzdy2.jsp";
	    if(packageId.equals("9"))
	    sjurl="/Subscribe/zzdyLx.jsp";
	    else if(packageId.equals("10"))
	     sjurl="/Subscribe/zzdyYx.jsp";
	    else if(packageId.equals("11"))
	     sjurl="/Subscribe/zzdyZx.jsp";
		}
	}
List list=null;
if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
 %>

 <script type="text/javascript">
 	function dcxjx(type) { 	 		
 		if(type == "jx") { 			
 	 		$("#jx").show();
 	 		$("#hgcl").hide();
 	 		$("#hygs").hide();
 	 		}
 		if(type == "hgcl") {  			
 			$("#hgcl").show();
 			$("#jx").hide();
 			$("#hygs").hide();
 	 		}
 		if(type == "hygs") {
 			$("#hygs").show();
 			$("#jx").hide();
 	 		$("#hgcl").hide();
 	 		}
 	}
 	
 //附件显示层开始
function $d(id) {
	return document.getElementById(id);
}
var OverH, OverW, Title, Context, ChangeH = 50, ChangeW = 50;

function OpenDiv(_Dw, _Dh, _Title, _Context) {
	$d("context").innerHTML = "";
	$d("title").innerHTML = "";
	OverH = _Dh;
	OverW = _Dw;
	Title = _Title;
	Context = _Context;
	$d("Loading").style.display = '';
	if (_Dw > _Dh) {
		ChangeH = Math.ceil((_Dh - 10) / ((_Dw - 10) / 50))
	} else if (_Dw < _Dh) {
		ChangeW = Math.ceil((_Dw - 10) / ((_Dh - 10) / 50))
	}
	$d("Loading").style.top = (document.documentElement.clientHeight - 10) / 2
			+ "px";
	$d("Loading").style.left = (document.documentElement.clientWidth - 10) / 2
			+ "px";
	$d("subLoading").style.top = (document.documentElement.clientHeight - 10)
			/ 2 + "px";
	$d("subLoading").style.left = (document.documentElement.clientWidth - 10)
			/ 2 + "px";
	$d("subItemLoading").style.top = (document.documentElement.clientHeight - 10)
			/ 2 + "px";
	$d("subItemLoading").style.left = (document.documentElement.clientWidth - 10)
			/ 2 + "px";

	OpenNow()
}
var Nw = 10, Nh = 10;
function OpenNow() {
	if (Nw > OverW - ChangeW)
		ChangeW = 2;
	if (Nh > OverH - ChangeH)
		ChangeH = 2;
	Nw = Nw + ChangeW;
	Nh = Nh + ChangeH;

	if (OverW > Nw || OverH > Nh) {
		if (OverW > Nw) {
			$d("Loading").style.width = Nw + "px";
			$d("subLoading").style.width = Nw + "px";
			$d("subItemLoading").style.width = Nw + "px";
			$d("Loading").style.left = (document.documentElement.clientWidth - Nw)
					/ 2 + "px";
			$d("subLoading").style.left = (document.documentElement.clientWidth - Nw)
					/ 2 + "px";
			$d("subItemLoading").style.left = (document.documentElement.clientWidth - Nw)
					/ 2 + "px";
		}
		if (OverH > Nh) {
			$d("Loading").style.height = Nh + "px";
			$d("Loading").style.top = (document.documentElement.clientHeight - Nh)
					/ 2 + "px"
			$d("subItemLoading").style.height = (Nh - 28) + "px";
			$d("subItemLoading").style.top = (document.documentElement.clientHeight - Nh)
					/ 2 + "px"
		}
		window.setTimeout("OpenNow()", 10)
	} else {
		Nw = 10;
		Nh = 10;
		ChangeH = 50;
		ChangeW = 50;
		$d("context").innerHTML = Context;
		$d("title").innerHTML = Title;
	}
}
// -->

function Lock_CheckForm() {
	$d("Loading").style.display = 'none';
}
// 用于控制loading div后台数据的或去
function loaddate(_mmsid, _title) {
	// ${ctx }/tcsswebFwcpcxAction.do?method=getAttachmentbyDsfxh&mms_id=_mmsid

	var urlEt = "${ctx }/tcsswebDcxListAction.do?method=getAttachmentbyDsfxh&mms_id="
			+ _mmsid
	$.ajax({
		type : "post",
		url : urlEt,
		success : function(msg) {
			OpenDiv(700, 500, _title, msg);
		},
		error : function(msg) {
			alert('数据加载出错！');
		}
	});
}

 //附件显示层结束
 //用于控制div的显示
 function move2(){ 
var content = document.getElementById("Loading"); 
// alert(content.offsetTop+"--"+document.documentElement.scrollTop);
var top =document.documentElement.scrollTop; 
content.style.top=(top+40)+"px"; 
} 
window.onscroll = function(){ 
move2(); 
} 
 
 </script>
</head>

<body class="body_bg">

<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<!--   <jsp:include page="/share/pdLogin.jsp" /> -->
<div class="main">
<div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯  &gt; </a><a href="${ctx }/tcsswebDcxdzAction.do?method=getTcsswebDcxdzListByAccount">短彩信定制查询  &gt; </a>金管家E对壹彩信定制信息</div>
 <jsp:include
					page="/bussinesshall/movetradehall/financing_submenu.jsp">
					<jsp:param name="nav3" value="tcdzcx" />
				</jsp:include>
  <div class="blank5"></div>
</div>
<div class="wrap920">
<!--查看彩信附件的浮动层 -->
<!--          浮层框架开始         -->
<div id="Loading" style="display:none"  ondblclick="this.style.display='none'">
<table id="subLoading" width="540" border="0" cellpadding="0" cellspacing="0" style="border: 0    solid    #e7e3e7;
border-collapse: collapse ;" >
<tr>
<td style="background-color: #73A2d6; color: #fff; padding-left: 4px; padding-top: 2px;
font-weight: bold; font-size: 12px;" height="24" valign="middle">
<div align="right"><a href=JavaScript:; class="STYLE1" onclick="Lock_CheckForm();">[关闭]</a> &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
</tr>
<tr>
<td>
<div  id="subItemLoading" style="width:495px; height:470px; overflow: scroll;" >
		<table>
		<tr>
		<td id="title" height="26" align="center">
		 </td>
		</tr>
		<tr>
		<td id="context">
		  
		</td>
		</tr>
		</table>
  
  </div>
  
 </td>
</tr>
</table>
</div>
<!--  浮层框架结束-->


  <!--左侧sied开始-->
  <div class="side281 fleft">
        <div class="ltit1">
        	<h5>个人信息</h5>
      		<div class="content lh21">
            	<p>尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：</p>
                <p>您目前的级别属于<span class="red"><%=levelsName %></span>用户，您目前享受的套餐为 <span class="red"><%=packageName %></span>.
                <p align="right" class="p50">
		<%if(sqlInjectValidate.boolenanbranchCode(branchCode)){ %>
				<%if(!packageId.equals("11")){ %>
			<a href="${ctx }/Subscribe/zzdy2.jsp"><img src=" ${ctx }/pic/Subscribe/btn_sj.jpg" /></a>
			<%}if(!packageId.equals("8")){ %>
			<a href="${ctx }/Subscribe/tdtc.jsp"><img src="/pic/xu0608/btn_td.gif" /></a>
			<%} }%></p>
          <img src="/pic/Subscribe/jgj.jpg" class="fleft" />
          <ul>
               <li>·<a href="${ctx }/golden/dcxdz/index.jsp">短彩信介绍</a></li>
                <li>·<a href="${ctx }/golden/dcxdz/hasSms.jsp">已定制短彩信查询</a></li>
                <li>·<a href="${ctx }/tcsswebDcxListAction.do?method=getTcsswebSmsListByAccount">金管家E对壹短信/彩信定制信息</a></li>  
               </ul>
            <div class="clear"></div>
            </div>
        </div>
        
        <div class="blank10"></div>
    
       <div>
       <h2 class="h2"><a href="${ctx }/tcsswebDcxListAction.do?method=getTcsswebSmsListByAccount" title="" >金管家E对壹短信</a></h2>       
       
       <h2 class="h2"><a href="${ctx }/tcsswebDcxListAction.do?method=getTcsswebMmsListByAccount" title="">金管家E对壹彩信</a></h2>
       <ul id="mms" class="smsMenu" >      
       <li><a href="${ctx }/tcsswebDcxListAction.do?method=getTcsswebMmsListByAccount&cxfl=9" title="">E对壹彩信精选版</a></li>
       <li><a href="${ctx }/tcsswebDcxListAction.do?method=getTcsswebMmsListByAccount&cxfl=8" title="">E对壹彩信宏观策略版</a></li>
       <li><a href="${ctx }/tcsswebDcxListAction.do?method=getTcsswebMmsListByAccount&cxfl=12" title="">E对壹才行行业公司版</a></li>
       </ul>       
       </div>  
        <div class="blank10"></div>
  </div>
  <!--左侧sied结束-->
  
  
  
  
  <!--右侧sied开始-->
  <div class="side626 fright">
  		
        
        <div class="dyTit1">金管家E对壹彩信定制信息</div>       
<form id="searchForm" name="searchForm" action="${ctx }/tcsswebDcxListAction.do?method=getTcsswebMmsListByAccount" method="post">
    <input type="hidden" value="${cxfl}" name="cxfl" id="cxfl"/>
    <input type="hidden" id="pageNumber" name="pageNumber" value="1" />  
	<div>				
		<h2 class="ulHead">发送日期</h2>
		<h2 class="ulHead">短信内容</h2>				
		<ul id= "jx" class="smsList">			
		<c:choose>	
			<c:when test="${not empty list}">
			<c:forEach var="item" items="${list}">
			<li style="border-bottom:1px solid #EEEEEE; padding-top:3px;">
				<ul class="sub_smsList">
					<li class="smsList_date">${item.fssj2}</li>
					<li class="smsList_cont"><a href=JavaScript:;   onclick="loaddate('${item.mms_id }','${item.mms_title}');">${item.mms_title}</a></li>
				</ul>
			</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<li>
				<ul class="sub_smsList">
					<li>暂无数据</li>
				</ul>
			</li>
			</c:otherwise>
			</c:choose>		
		</ul>
	</div>	
</form>
<c:out value="${linkStr}" escapeXml="false"></c:out>	
  </div>


  <!--右侧sied结束-->
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>