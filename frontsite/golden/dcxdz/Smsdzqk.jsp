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
TcsswebDcxdzService dcxService = (TcsswebDcxdzService)ctx.getBean("tcsswebDcxdzService");
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
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
<div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯  &gt; </a> 短彩信定制查询</div>
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
			<a href="${ctx }/Subscribe/zzdy2.jsp"><img src="${ctx }/pic/Subscribe/btn_sj.jpg" /></a>
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
    <div class="ltit1"><img src="/pic/sms/ede1.jpg" />
      <div class="content lh21" style="min-height:100px; _height:100px">
      <p>金管家E对壹彩信，荟集了广发证券总部顶级分析师及投资顾问团队的智慧结晶，每日准时为您发送精选市场资讯。产品集合了<strong>投顾市场策略、行业公司精选、广发研究速递</strong>等王牌栏目，是您投资理财的决策利器。</p>
      </div>
    </div>
    <div class="ltit1"><img src="/pic/sms/ede2.jpg" />
      <div class="content lh21" style="min-height:100px; _height:100px">
      <p>金管家E对壹短信，是根据您的个性化需求，随时将第一手的财经资讯传递给您，便于您及时掌控账户状况、了解市场最新动态，获取专属的第一手财经信息。</p>
      </div>
    </div>
        <div class="blank10"></div>
  </div>
  <!--左侧sied结束-->
  
  
  
  
  <!--右侧sied开始-->
  <div class="side626 fright">
  		
        
        <div class="dyTit1">短彩信定制情况查询</div>
        <p class="p10">尊敬的<em class="blue"><%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %></em>，您好!
您的申请进度查询</p>
<form name="qForm" id="qForm" action="${ctx }/tcsswebDcxdzAction.do?method=getTcsswebDcxdzListByAccount" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dzpmtab font_43">
	<tr>
		<th>申请日期</th>
		<th>申请彩短信内容</th>
		<th>申请结果</th>
		<th>失败原因</th>
	</tr>
	<%
	if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			TcsswebDcxdetail tcsswebDcxdetail=(TcsswebDcxdetail)list.get(i);	
	%>
  <tr>
  	<td><%if(tcsswebDcxdetail.getBegindate()!=null){
  			out.print(sdf.format(tcsswebDcxdetail.getBegindate()));
  		}
  		else{
  			out.print("--");
  		} %></td>
  	<td><%=tcsswebDcxdetail.getProductname() %></td>
  	<td><%
		String flag = tcsswebDcxdetail.getOrderflag();
		if(flag.equals("1"))
			out.print("定制成功");
		else if(flag.equals("2"))
			out.print("定制失败");
		else if(flag.equals("3"))
			out.print("退定成功");
		else if(flag.equals("4"))
			out.print("退定失败");
		%></td>
	<td><%=tcsswebDcxdetail.getErrorinfo() %></td>
  </tr>
  <%}} %>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"><p align="right"> <%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
</form>
<p class="p10" align="center"><input onclick="location.href='${ctx }/golden/dcxdz/hasSms.jsp'" class="popBtn2" type="button" value="查看详细短彩信定制情况" /></p>
  </div>
  <!--右侧sied结束-->
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>