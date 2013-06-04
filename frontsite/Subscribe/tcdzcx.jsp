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
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String packageId="8";
String packageName="优享套餐"; 
String levelsName="";//服务身体等级名字
List userlist=null;
String sjurl="/Subscribe/zzdy.jsp";
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");
TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	branchCode=tsystemWebuser.getBranchCode();
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	  if (tsystemWebuser.getUserType().endsWith("2")) {
	        levelsName = "体验";
	        userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getServiceName());
	        
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
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
<div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>
  <div class="blank10"></div>
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
          <ul style="margin-top:25px">
               <li>·<a href="${ctx }/golden/index.jsp" target="_blank">金管家服务介绍</a></li>
                <li>·<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">进入我的管家资讯</a></li>
                <%if(sqlInjectValidate.boolenanbranchCode(branchCode)){ %>
                <li>·<a href="${ctx }/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount">套餐定制情况查询</a></li>
               <%} %>
            </ul>
            <div class="clear"></div>
            </div>
        </div>
        
        <div class="blank10"></div>
    <div class="ltit1">
  <h5><span class="red"><%=packageName %></span>特色介绍</h5>
      		<div class="content lh21" style="min-height:200px; _height:200px">
      		  <p>
      		  <%
      		  if(packageId.equals("8"))
				 out.print("快捷便利的交易通道，及时全面的市场资讯，温馨的亲情关怀，专业的呼叫服务，您可以在广发证券安心、放心、舒心地进行投资理财。");
				 else if(packageId.equals("9"))
				 out.print("广发证券金管家大众资讯套餐，为您提供实用快捷的资讯服务，涵盖大势解盘、热点板块、个股推荐、当日重要新闻点评、周边市场表现、最新重点研发报告推荐、研究机构最新评级等内容。盘中播报让您实时了解投资顾问第一手资讯，助您畅享投资乐趣。");
				 else if(packageId.equals("10"))
				 out.print("广发证券金管家高级资讯套餐，公司首席投资顾问为您点评最新市场策略，公司总部投资顾问为您点评权威研究机构的重要报告、基金公司市场观点，是您投资理财不可或缺的利器，助您把握财富未来。");
				 else if(packageId.equals("11"))
				 out.print(" 广发证券金管家顶级资讯套餐，荟集公司总部顶级分析师及投资顾问团队研究成果，提供最及时、最权威的研究报告，享受基金经理般的研究支持，助您尊享财富人生。");
      		   %>
      		  
      		  </p>
        </div>
        </div>
        <div class="blank10"></div>
  </div>
  <!--左侧sied结束-->
  
  
  
  
  <!--右侧sied开始-->
  <div class="side626 fright">
  		
        
        <div class="dyTit1">套餐定制情况查询</div>
        <p class="p10">尊敬的<em class="blue"><%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %></em>，您好!
您的申请进度查询</p>
<form name="qForm" id="qForm" action="${ctx }/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dzpmtab font_43">
  <tr>
    <th>申请日期</th>
   <th>变更套餐情况</th>
   <th>申请状态</th>
   <th>订单结束时间</th>
  </tr>
   <%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			TcsswebFwcpysl tcsswebFwcpysl=(TcsswebFwcpysl)list.get(i);	
			%>
  <tr>
    <td><%=tcsswebFwcpysl.getDzrq() %></td>
    <td>
    <%
    if(tcsswebFwcpysl.getProductIdApplyfor()<tcsswebFwcpysl.getProductIdOriginal())
    {
    System.out.println("           ----------------------------");
    if(tcsswebFwcpysl.getProductIdOriginal()>0 )
     {
     out.print("取消定制");
     long aply= tcsswebFwcpysl.getProductIdOriginal();
     String aplys=String.valueOf(aply);
		 if(aplys.equals("8"))
		 out.print("基础服务资讯");
		 else if(aplys.equals("9"))
		  out.print("乐享套餐");
		 else if(aplys.equals("10"))
		  out.print("优享套餐");
		 else if(aplys.equals("11"))
		  out.print("尊享套餐");
	 }
     %>
   
    <%
	     if(tcsswebFwcpysl.getProductIdApplyfor()>0 )
	     {
	     long aply= tcsswebFwcpysl.getProductIdApplyfor();
	     String aplys=String.valueOf(aply);
			 if(aplys.equals("8"))
			 out.print("");
			 else if(aplys.equals("9"))
			  out.print("退定为乐享套餐");
			 else if(aplys.equals("10"))
			  out.print("退定为优享套餐");
			 else if(aplys.equals("11"))
			  out.print("退定为尊享套餐");
		 }
    
    }else{
    if(tcsswebFwcpysl.getProductIdOriginal()>0 )
     {
     long aply= tcsswebFwcpysl.getProductIdOriginal();
     String aplys=String.valueOf(aply);
		 if(aplys.equals("8"))
		 out.print("基础服务资讯");
		 else if(aplys.equals("9"))
		  out.print("乐享套餐");
		 else if(aplys.equals("10"))
		  out.print("优享套餐");
		 else if(aplys.equals("11"))
		  out.print("尊享套餐");
	 }
     %>
    升级为
    <%
	     if(tcsswebFwcpysl.getProductIdApplyfor()>0 )
	     {
	     long aply= tcsswebFwcpysl.getProductIdApplyfor();
	     String aplys=String.valueOf(aply);
			 if(aplys.equals("8"))
			 out.print("基础服务资讯");
			 else if(aplys.equals("9"))
			  out.print("乐享套餐");
			 else if(aplys.equals("10"))
			  out.print("优享套餐");
			 else if(aplys.equals("11"))
			  out.print("尊享套餐");
		 }
	 }
     %>
    </td>
    <td><%
    if(tcsswebFwcpysl.getSqzt()>0 )
     {
    long sqzt =tcsswebFwcpysl.getSqzt();
    String sqzts=String.valueOf(sqzt);
    if(sqzts.equals("1"))
		 out.print("订单已提交，处理中");
		 else if(sqzts.equals("2"))
		  out.print("订单已提交，处理中");
		 else if(sqzts.equals("3"))
		  {
		  %>
		    <a href="${ctx }/Subscribe/dylc3.jsp?id=<%=tcsswebFwcpysl.getId() %>"><img src="${ctx }/pic/xu0608/btn_qr3.gif" /></a> 
		    <a href="${ctx }/tcsswebFwtcdyAtion.do?method=tdqTcsswebProFwcptdList&id=<%=tcsswebFwcpysl.getId() %>"><img src="${ctx }/pic/xu0608/btn_qx3.gif" /></a>
		    <%
		  }
		 else if(sqzts.equals("4"))
		  out.print("定制成功");
		  else if(sqzts.equals("5"))
		  out.print("已过期");
		 else if(sqzts.equals("6"))
		  out.print("定制取消");
    }
    %></td>
    <td>
    <%
    if(tcsswebFwcpysl.getNewdate()!=null  )
    {
     out.print(sdf.format(tcsswebFwcpysl.getNewdate()) );
    }else{
     out.print("--" );
    }
    %>
    </td>
  </tr>
  <%}} %>
  
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"><p align="right"> <%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
</form>

<p class="p10"><em class="red">注：订单确认时间有效期限为7天，请您及时处理您的订单。</em></p>
  </div>
  <!--右侧sied结束-->
  
  
  <div class="clearfloat"></div><!--清除浮动--> 

  
 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>