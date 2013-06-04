<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.systemset.service.ServiceLevelService"%>
<%@page	import="com.cssweb.systemset.pojo.ServiceLevel"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page	import="com.cssweb.business.product.service.ProductService"%>
<%@page	import="com.cssweb.business.product.pojo.Product"%>
<%@page	import="com.css.system.Configuration"%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<jsp:include page="/share/logout.jsp" />
<script type="text/javascript">
	function fLogout()
	{
	  closeWindow();
	  var purl="${ctx}/webUser.do?method=frontLogoutIndex";
	  document.location.href=purl;
	}
	function SwitchNewsWdlccp(tag)
	{
	  var obj1 = document.getElementById(tag);
	  var temp = obj1.style.display;
		if(temp == "none")
		{
			obj1.style.display = "";
		}
		else
		{
			obj1.style.display = "none";
		}
	}
	
</script>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
 String branchCodeTop="";
    List listpuct=null;
    String levelsNameTop="财经汇";//服务身体等级名字
  	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	String userType="";
	//取用户的对应身份等级
	ServiceLevelService serviceLevelServiceTop=(ServiceLevelService)ctx.getBean("serviceLevelService");
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	ProductService productService=(ProductService)ctx.getBean("productService");
	TsystemWebuser tsystemWebuserTop=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null){
		tsystemWebuserTop=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
		branchCodeTop=tsystemWebuserTop.getBranchCode();
	}
	if(tsystemWebuserTop!=null) {
	   	     
		// if(tsystemWebuserTop.getUserLevel()!=null&&tsystemWebuserTop.getUserLevel()>0)
		// {
		//    ServiceLevel serviceLevel = serviceLevelServiceTop.getServiceLevelByUserLevels(tsystemWebuserTop.getUserLevel().toString());
		//    levelsNameTop =serviceLevel.getServiceName();
		// }
		if(tsystemWebuserTop.getLevel()!=null && !tsystemWebuserTop.getLevel().equals(""))
		 {
		    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuserTop.getLevel());
		    levelsNameTop = dict == null ? "" : dict.getKeyName();
		 }
		  userType=tsystemWebuserTop.getUserType();
		 if(!userType.equals("")&&userType.equals("2")) 
		 {
		  levelsNameTop="体验";
		 }
		 	  listpuct=productService.getProductCodeByClientId(tsystemWebuserTop.getUserName());
	}
	String gfzqzcglpassword = Configuration.getProperty("gfzqzcglpassword");
	String gfzqdxlcpassword = Configuration.getProperty("gfzqdxlcpassword");
	String pathdllc="/default.html";
%>
<div class="left_tit2">
<table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
<tr>
  <td width="5%">&nbsp;</td>
  <td width="87%">
        <span class="font_43 mr10" id="gdcjh"><a href="${ctx }/bussinesshall/financingCzh.jsp">我的<%=levelsNameTop %></a></span>
       
        <span class="font_43 mr10"><a href="#" onclick="SwitchNewsWdlccp('list1')">广发理财产品</a>
        </span>
      
        <%if(!userType.equals("")&&userType.equals("1")) {%>
        <span class="font_43 mr10" id="wdccg"><a href="${ctx }/share/accountLogin.jsp?iscc=1">我的持仓股</a></span>
        <%} %>
        <%
        	String ksxd="快速下单";
        	String ksxdLink="https://etrade.gf.com.cn/index.php?type=1";
        	if(tsystemWebuserTop!=null&&tsystemWebuserTop.getUserType()!=null&&"2".equals(tsystemWebuserTop.getUserType())){
        		ksxd="模拟炒股";
        		ksxdLink="/share/mncg.jsp";
        	}
         %>
        <span class="font_43 mr10"><a href="<%=ksxdLink%>"><%=ksxd %></a></span>
        <%if(sqlInjectValidate.boolenanbranchCode(branchCodeTop)){ %>
        <span class="font_43 mr10" id="tcdzcx"><a href="${ctx }/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount">套餐定制查询</a></span>
       <%} %>
        <span class="font_43 mr10" id="gdgjzx"><a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></span>
        
        <span class="font_43 mr10" id="wdzxfw"><a href="${ctx }/bussinesshall/movetradehall/myAdvisory.jsp?nav=wsyyt&nav1=wdlczx">我的咨询服务</a></span>
         <%if(!userType.equals("")&&userType.equals("1")) {%>
        <span class="font_43 mr10"><a href="#">我的营业部</a></span>
        <%} %>
        <span class="font_43 mr10" id="wdzxg"><a href="${ctx }/bussinesshall/movetradehall/myStock.jsp">我的自选股</a></span>
        
        </td>
<td width="8%" colspan="2"> <input type="button" name="button" id="button" class="but_01" onclick="fLogout();" value="退出" /></td>
</tr>
<tr>
	<td width="5%">&nbsp;</td>
	<td width="87%">
		<%if(!userType.equals("")&&userType.equals("1")) {%>
        <span class="font_43 mr10" id="tcdzcx"><a href="${ctx }/golden/dcxdz/index.jsp">短彩信定制</a></span>
        <span class="font_43 mr10" id="tcdzcx"><a href="${ctx }/tcsswebDcxdzAction.do?method=getTcsswebDcxdzListByAccount">短彩信定制查询</a></span>
       <span class="font_43 mr10" id="tcdzcx"><a href="${ctx }/financing/rongzhi/matchIntro.jsp">“融智杯”竞赛</a></span>
        <%} %>
	</td>
</tr>
</table>
</div>
<table width="98%" id="list1" style="display:none" style=" text-indent:0px">
<tr>
<td width="12%">&nbsp;</td>
<td width="87%"><span class="font_43">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
 <table bordercolor=red border="1"><tr>
<%if(listpuct!=null&&listpuct.size()>0){
 for(int i=0;i<listpuct.size();i++)
 {
 Product product=(Product)listpuct.get(i);
 %>
 <td>
<span class="font_43"><a href="${ctx}/webUser.do?method=loginTx&serviceName=<%=product.getUserName() %>&password=<%=gfzqzcglpassword %>&verifyCodeflag=1&urlError=<%=pathdllc%>"> 
&nbsp;
<% 
 List list2=productService.selectProductByCode(product.getProductCode()); 
 if(list2!=null&&list2.size()>0)
 {
  Product productzz=(Product)list2.get(0);
  out.print(productzz.getProductName());
 }
%>
&nbsp;
</a></span>
</td>
<%} }else{%>
<td>
<span class="font_43"><a href="${ctx }/assetManage/index.html">&nbsp;无&nbsp;</a></span>
</td>
<%} %>
 </tr></table>
</td>
<td></td>
</tr>
</table>
<%
	String nav3 = request.getParameter("nav3");
	if (nav3 != null && !"".equals(nav3))
	{
			%>
			
					<script type="text/javascript">
						//document.getElementById('index').className = "font14 white topmenu_a";
						document.getElementById('<%= nav3 %>').className = "active red";
						//document.getElementById("wsyyt_con").style.display = "block";
					</script>
			<%
	}
%>