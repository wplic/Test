<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="java.util.*"/>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.cssweb.subscribe.pojo.TcsswebFwcpysl"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebDcxdzService"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebDcxdetail"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>

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
</head>

<body class="body_bg">

<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<!--   <jsp:include page="/share/pdLogin.jsp" /> -->
<div class="main">
<div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯  &gt; </a><a href="${ctx }/tcsswebDcxdzAction.do?method=getTcsswebDcxdzListByAccount">短彩信定制查询  &gt; </a>金管家E对壹短信定制信息</div>
  <jsp:include
					page="/bussinesshall/movetradehall/financing_submenu.jsp">
					<jsp:param name="nav3" value="tcdzcx" />
				</jsp:include>				
  <div class="blank5"></div>
</div>
<div class="wrap920">
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
          <ul >
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
  		
        
        <div class="dyTit1">金管家E对壹短信定制信息</div>       
<form id="searchForm" name="searchForm" action="${ctx }/tcsswebDcxListAction.do?method=getTcsswebSmsListByAccount" title=""" method="post">
	<input type="hidden" id="pageNumber" name="pageNumber" value="1" />  
	<div>				
		<h2 class="ulHead">发送日期</h2>
		<h2 class="ulHead">短信内容</h2>				
		<ul class="smsList">	
			<c:choose>	
			<c:when test="${not empty list1}">
			<c:forEach var="item" items="${list1}">
			<li style="border-bottom:1px solid #EEEEEE; padding-top:3px;">
				<ul class="sub_smsList">
					<li class="smsList_date">${item.pre_send_time2}</li>
					<li class="smsList_cont">${item.content}</li>
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
	<c:out value="${linkStr}" escapeXml="false"></c:out>	
</form>
  </div>


  <!--右侧sied结束-->
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>