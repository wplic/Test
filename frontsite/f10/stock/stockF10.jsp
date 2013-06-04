<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<% 
	// 如果url传了股票代码，则用url的股票代码，否则用session中的股票代码
	String zqdm=request.getParameter("zqdm")==null?"":request.getParameter("zqdm");
	if(!zqdm.equals("")) session.setAttribute("stockCode", zqdm);
	
	if(session.getAttribute("stockCode")==null||session.getAttribute("stockCode").equals("")) session.setAttribute("stockCode", "600001");

	zqdm=(String)session.getAttribute("stockCode");
	
	String menu = request.getParameter("menu")==null?"1":request.getParameter("menu");
	
	String f10MenuId=request.getParameter("f10MenuId");
	if(StringUtils.isEmpty(f10MenuId)){
		f10MenuId="";	
	}
	String iframeSrc="#";
	if(menu.equals("2"))
		iframeSrc="/stock.do?method=getCompanyInfo&code="+zqdm;
	else if(menu.equals("3"))
		iframeSrc="/stock.do?method=getTopExecutives&code="+zqdm;
	else if(menu.equals("4"))
		iframeSrc="/stock.do?method=getEquityShareholders&code="+zqdm;
	else if(menu.equals("5"))
		iframeSrc="/stock.do?method=getShareMergerReform&code="+zqdm;
	else if(menu.equals("6"))
		iframeSrc="/stock.do?method=getLinkRelation&code="+zqdm;
	else if(menu.equals("7"))
		iframeSrc="/stock.do?method=getCaiWudata&code="+zqdm;
	else if(menu.equals("8"))
		iframeSrc="/stock.do?method=getFundHoldStock&code="+zqdm;
	else if(menu.equals("9"))
		iframeSrc="/stock.do?method=getImportantActivity&code="+zqdm;
	else if(menu.equals("10"))
		iframeSrc="/stock.do?method=getDistribution&code="+zqdm;
	else if(menu.equals("11"))
		iframeSrc="/baseInfo.do?method=getList&tableName=GSBD&codeType=stock&code="+zqdm;
	else if(menu.equals("12"))
		iframeSrc="/baseInfo.do?method=getList&tableName=GSGG&codeType=stock&code="+zqdm;
	else if(menu.equals("13"))
		iframeSrc="/baseInfo.do?method=getList&tableName=GSYW&codeType=stock&code="+zqdm;
	else if(menu.equals("14"))
		iframeSrc="/baseInfo.do?method=getList&tableName=GSJYQKPS&codeType=stock&code="+zqdm;
	else if(menu.equals("15"))
		iframeSrc="/baseInfo.do?method=getList&tableName=GSYJ&codeType=stock&code="+zqdm;
	else{%>
	<script type="text/javascript">
		 window.location.href="${contextPath }/stock.do?method=getStockBaseInfo&code=<%=zqdm%>"
	</script>
	<%}
%>
</head>
<body>

  <!--右侧sied开始-->
<iframe id="f10Frame" name="f10Frame" src="<%=iframeSrc %>" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" onload="frameFitSelfHeight('f10Frame')"></iframe>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
<script src="/js/setTab.js"></script>
</body>
</html>