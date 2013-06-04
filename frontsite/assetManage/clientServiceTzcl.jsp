
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.cssweb.client.service.TclientYdbgService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.client.pojo.TclientTzcl"%>
<%@page import="com.cssweb.collect.service.BalFundService"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@page import="com.cssweb.collect.pojo.BalFund"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.util.*"%>
<%@page import="com.cssweb.client.pojo.TclientYdbg"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%
		request.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		TclientYdbgService tclientYdbgService = (TclientYdbgService)ctx.getBean("tclientYdbgService");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("begin", 0);
		map.put("end", 500);
		List<TclientTzcl> list = tclientYdbgService.getTclientTzclPage(map);
		//System.out.println("投资策略报告总数："+list.size());
		BalFundService balFundService = (BalFundService)ctx.getBean("balFundService");
		String depositacct = null;
		AssetUser assetUser = null;
		List balFundList = null;
		if(null!=request.getSession().getAttribute("assetUser")){
			 assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
			 depositacct = assetUser.getFundAccount();
			 balFundList =	balFundService.getBalFundByZjzh(depositacct);
		}
		//System.out.println("持仓个数："+balFundList.size());
		List fundCodeList = null;
		List tzclList = null;//最终存放显示给登录用户的tzcl报告
		if(balFundList!=null){
			fundCodeList = new ArrayList();
			tzclList = new ArrayList();
			for(int i=0;i<balFundList.size();i++){
				BalFund balFund = (BalFund)balFundList.get(i);
				if(balFund.getFundcode()!=null && !"".equals(balFund.getFundcode())){
					//System.out.println(balFund.getFundcode());
					fundCodeList.add(balFund.getFundcode());
				}
			}
			//System.out.println("存放持仓集合个数："+fundCodeList.size());
			if(fundCodeList.size()>0){
				for(int i=0;i<fundCodeList.size();i++){
					for(int j=0;j<list.size();j++){
						TclientTzcl tclientTzcl = list.get(j);
						//System.out.println("投资策略报告产品："+tclientTzcl.getProductCode());
						int result = tclientTzcl.getProductCode().indexOf(fundCodeList.get(i).toString());
						if(result>-1){
							//list.remove(j);
							tzclList.add(tclientTzcl);
						}
					}
				}
			}else {
				//System.out.println("客户无持仓任何理财产品，无法查看到投资理财策略");
				list.clear();
				//list = null;//客户无持仓任何理财产品，无法查看到投资理财策略
			}
		}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function checkSearch(){
	var year = document.qForm.year.value;
	var month = document.qForm.month.value;
	document.qForm.StartDate.value = year+"-"+month+"-01";
	document.qForm.EndDate.value = year+"-"+month+"-20";
	document.qForm.submit();
}
//-->
</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 投资策略报告</div>
</div>
<form name="qForm" id="qForm" action="${contextPath}/tclientYdbgAction.do?method=getClientServiceMap" method="post">
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="collectService_lmenu.jsp?nav=tzcl" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>最新市场分析及投资策略</h4>
  </div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">最新市场分析及投资策略 </span> </div>
  <div class="blank10"></div>
  
  <div class="blank10"></div>
	<table id="doclist" width="95%" align="center" class="lh28 font_st list_bline1">
	  <%
	 		if (list != null && tzclList.size() > 0)
	 		{
	 				for (int i = 0 ; i < tzclList.size() ; i ++)
	 				{
	 						TclientTzcl tclientTzcl =	(TclientTzcl)tzclList.get(i);
	 						%>
	 							<tr align="center">    
									<td width="70%" align="left"><a href="${contextPath}/assetManage/infoTzcl.jsp?ydbgId=<%=tclientTzcl.getId() %>" target="_blank" title="">【<%=tclientTzcl.getProductName() %>】<%=tclientTzcl.getTitle() %></a></td>
									<td width="30%" align="right"><%=sdf.format(tclientTzcl.getRecDate())  %></td>
								  </tr>
	 						<%
	 				}
	 		} else {			
	  %>	
	  		<tr align="center">    
				<td colspan="2">您尚无持仓记录，无法查看投资策略报告!</td>
			  </tr>
		<%} %>
	   <!--<tr>
         		<td colspan="2" align="right" ><%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></td>
         </tr>
		--></table>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
 </form>   
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</body>
</html>