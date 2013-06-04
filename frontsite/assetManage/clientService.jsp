<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.clientService.service.AssetInfoService"/>
<jsp:directive.page import="com.cssweb.clientService.pojo.AssetInfo"/>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.dql.*"%>
<%@page import="com.css.cms.document.util.*"%>
<%@page import="java.util.*"%>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
    String dateStringmd="昨日";
    String dssm="";
	DecimalFormat df = new DecimalFormat("#.##");
	String fundAccount = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		fundAccount = assetUser.getFundAccount();
	}else{
%>	
	<script type="text/javascript">
		window.location="/commons/loginms.jsp";
	</script>
<%}
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AssetInfoService assetInfoService = (AssetInfoService) ctx.getBean("assetInfoService");
	List list =	null;
	if(null!=fundAccount){
		list = assetInfoService.getAllInfo(fundAccount);
		//List list2=assetInfoService.getAssetInfoByClientId(fundAccount);
		//if(list2!=null&&list2.size()>0){
		//dssm="注：仅显示至上月最后一个工作日账户信息";
		//dateStringmd="月末";
		//}
		}
	AssetInfo assetInfo = null;
	if(null!=list && list.size()>0)
		assetInfo = (AssetInfo)list.get(0);

	String column="tzlc_dxlc_jjjlgd";
	if(request.getParameter("whichCat")!=null)
		column=request.getParameter("whichCat");
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="clientService_lmenu.jsp?nav=zhxx&nav1=1" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>帐户余额信息</h4></div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">账户资产信息</span>（本市值尚未扣除托管费及管理费，仅供参考） <%=dssm %></div>
  <table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
    <tr class="rrtab_tt bold">
      <td><p align="center">资金号 </p></td>
      <td><p align="center">帐户姓名 </p></td>
      <td><p align="center">币种</p></td>
      <td><p align="center"><%=dateStringmd %>资金余额</p></td>
      <td><p align="center"><%=dateStringmd %>市值</p></td>
      <td align="center"><%=dateStringmd %>总资产</td>
      <td align="center">日期</td>
    </tr>
	<%if(null!=assetInfo){
		  String moneytype=assetInfo.getMoneyType();
		  if("0".equals(moneytype))
			  moneytype="RMB";%>
    <tr>
      <td align="center"><%=assetInfo.getClientId()%></td>
      <td align="center"><%=assetInfo.getAccountName()%></td>
      <td align="center"><%=moneytype%></td>
      <td align="center"><%=df.format(assetInfo.getYesterdayBalance())%></td>
      <td align="center"><%=df.format(assetInfo.getYesterdayValue())%></td>
      <td align="center"><%=df.format(assetInfo.getYesterdayAmount()) %></td>
      <td align="center"><%=assetInfo.getBusinessDate() %></td>
    </tr>
	<%}%>
  </table>
  <div class="blank10"></div>
  <div class="khfwtit1 mt10"><span class="font14">基金经理视点</span></div>

  <paging:page count="false" row="6" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
	  <table id="doclist" width="98%" align="center" border="0" class="lh27 list_bline1 mt10">
	  <paging:pageRow id="doc" type="com.css.cms.document.Document">
	  <tr align="center">    
		<td align="center" width="5%"><img src="/pic/msindex/list_03.gif"/></td>
		<td width="70%" align="left"><a href="${ctx}/commons/infoList.jsp?docId=<%=doc.getId()%>" target="_blank" title="<%= DocumentHelper.getTitle(doc )%>"><%= DocumentHelper.getTitle(doc ,70)%></a></td>
		<td width="30%" align="right" class="font_8c"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
	  </tr>
	  </paging:pageRow>
		</table>
	</paging:page>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>