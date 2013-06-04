<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.clientService.pojo.TradeNote"/>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.clientService.service.AssetInfoService"/>
<%
     String dssm="";
	String fundAccount = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		fundAccount = assetUser.getFundAccount();
	}else{%>	
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AssetInfoService assetInfoService = (AssetInfoService) ctx.getBean("assetInfoService");
	if(null!=fundAccount){
	List list2=assetInfoService.getAssetInfoByClientId(fundAccount);
		if(list2!=null&&list2.size()>0)
		dssm="注：仅显示至上月最后一个工作日账户信息";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function  ggcxListCrm(){
	var begindate = document.getElementById("begindate").value;
	var enddate = document.getElementById("enddate").value;
	if(""==begindate && ""==enddate){
		alert("请选择查询时间！");
		return false;
	}
	window.tqForm.submit();
}
 </script>
</head>
<%
List list = (List)request.getAttribute("list");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 交易记录及资金明细</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="/assetManage/clientService_lmenu.jsp?nav=zhxx&nav1=2" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>交易记录及资金明细</h4></div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">账户资金明细</span>（默认显示三个月数据）<%=dssm %> </div>
  <div class="blank10"></div>
	<form name="tqForm" action="${ctx}/clientservice/tradeNote.do?method=getAssetManagerList&fundaccount=<%=fundAccount%>" method="post">
  <div class="khfwcx">
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80">起始日期：</td>
        <td>
            <input type="text" id="begindate" name="begindate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.tqForm.begindate,document.tqForm.enddate);return false;" HIDEFOCUS> <img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
		</td>
        <td width="80">终止日期：</td>
        <td>
            <input type="text" name="enddate" id="enddate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.tqForm.begindate,document.tqForm.enddate);return false;" HIDEFOCUS> <img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
		</td>
        <td><a href="#" onclick="ggcxListCrm();"><img src="/pic/assetManage/butCx.jpg"/></a></td>
      </tr>
    </table>
  </div>
  <div class="blank10"></div>
    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30"><%=PageUtil.pagination("window.tqForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
    <table border="1" bordercolor="#cccccc" width="700" align="center" class="lh24">
      <tr class="rrtab_tt bold">
        <td align="center">日期</td>
        <td align="center">币种</td>
        <td align="center">收入金额</td>
        <td align="center">付出金额</td>
        <td align="center">本次余额</td>
        <td align="center">摘要</td>
      </tr>
	  <%if(null!=list){
		  for(int i=0;i<list.size();i++){
			  TradeNote tradeNote = (TradeNote)list.get(i);
			  String moneytype=tradeNote.getMoneyType();
			  if("0".equals(moneytype))
				  moneytype="RMB";%>
				  <tr>
					<td align="center"><%=tradeNote.getHappenDate()%></td>
					<td align="center"><%=moneytype%></td>
					<td align="center"><%=tradeNote.getIncomeMoney()%></td>
					<td align="center"><%=tradeNote.getPayoutMoney()%></td>
					<td align="center"><%=tradeNote.getBalance()%></td>
					<td class="pl5"><%=tradeNote.getRemark()!=null&&tradeNote.getRemark().equals("Cancel the freezing of funds")?"资金冻结取消":tradeNote.getRemark() %></td>
				  </tr>
	  <%	}
	}%>
    </table>
	</form> 
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</body>
</html>