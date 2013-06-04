<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="init.jsp" %>


<%
			String iframeSrc = "#";
			
			String aId = (String)request.getSession().getAttribute("aId");
			
			String textId = (String)request.getSession().getAttribute("textId");
			
			if (com.cssweb.F10.gazx.bond.util.Validator.isNotNull(request.getSession().getAttribute("currentPath"))) {
				iframeSrc = request.getSession().getAttribute("currentPath").toString() + "&bondCode=" + bondCode + "&code="+bondCode+"&aid=" + aId + "&textid=" + textId + "&gpdm="+ bondCode;
			} else {
				iframeSrc = "/f10/bond/bondInfo.do?method=getBondInfoByBondCode&bondCode=" + bondCode;
			}
			
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<script type="text/javascript">
		function showStyle(id)
		{
			
			 for (var i = 1 ; i <= 16 ; i ++)
			 {
			 	
			 	if (id == ('zqjbzlztext' + i))
				{
						//alert('id  ===' + id);
						document.getElementById('zqjbzlztext' + i).className = "lmenu_hov blue3 bold";
				}
				else
				{
						document.getElementById('zqjbzlztext' + i).className = "lmenu_a blue3";
				}
			 }
				
		}
</script>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 基金个股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
	  <tr>
	    <td class="lmenu_hov blue3 bold" id="zqjbzlztext1"><a  onclick="showStyle('zqjbzlztext1')" id="bondInfo" href="${contextPath }/f10/bond/bondInfo.do?method=getBondInfoByBondCode&bondCode=<%=bondCode %>&&aid=zqjbzl2&textid=zqjbzlztext1" target="f10Frame">债券基本资料</a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext2"><a onclick="showStyle('zqjbzlztext2')"  target="f10Frame" href="${contextPath }/f10/bond/nationalDebtIssue.do?method=getNationalDebtIssueByCode&&bondCode=<%=bondCode %>&aid=zqjbzl2&textid=zqjbzlztext2">国债发行与上市</a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext3"><a onclick="showStyle('zqjbzlztext3')" target="f10Frame" href="${contextPath }/f10/bond/enterpriseDebtIssueAndTrade.do?method=getEnterpriseDebtIssueAndTradeByBobdCode&bondCode=<%=bondCode %>&aid=zqjbzl3&textid=zqjbzlztext3">企业债发行与上市 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext4"><a onclick="showStyle('zqjbzlztext4')" target="f10Frame" href="${contextPath }/f10/bond/convertibleDebtIssueAndTrade.do?method=getConvertibleDebtIssueAndTradeByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl4&textid=zqjbzlztext4">可转债发行与上市</a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext5"><a onclick="showStyle('zqjbzlztext5')" target="f10Frame"  href="${contextPath }/f10/bond/financialDebtIssue.do?method=getFinancialDebtIssueByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl5&textid=zqjbzlztext5">金融债发行</a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext6"><a onclick="showStyle('zqjbzlztext6')" target="f10Frame" href="${contextPath }/f10/bond/convertibleDebtToStockInfo.do?method=getConvertibleDebtToStockInfoByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl6&textid=zqjbzlztext6">可转债换股情况 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext7"><a onclick="showStyle('zqjbzlztext7')" target="f10Frame" href="${contextPath }/f10/bond/converiteDebtOwnerInfo.do?method=getConveriteDebtOwnerInfoByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl7&textid=zqjbzlztext7">可转债十大持有人情况</a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext8"><a onclick="showStyle('zqjbzlztext8')" target="f10Frame" href="${contextPath }/f10/bond/convertibleDebtToStockPriceChange.do?method=getConvertibleDebtToStockPriceChangeByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl8&textid=zqjbzlztext8">可转债转股价格调整 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext9"><a onclick="showStyle('zqjbzlztext9')" target="f10Frame" href="${contextPath }/f10/bond/debtActualPayRateInfo.do?method=getDebtActualPayRateInfoByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl9&textid=zqjbzlztext9">实际付息情况</a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext10"><a onclick="showStyle('zqjbzlztext10')" target="f10Frame" href="${contextPath }/f10/bond/bondBackToSaleCase.do?method=getBondBackToSaleByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl11&textid=zqjbzlztext11">债券回售情况 </a></td>
	  </tr>
	    <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext11"><a onclick="showStyle('zqjbzlztext11')" target="f10Frame" href="${contextPath }/f10/bond/bondRedemptionCase.do?method=getBondRedemptionCaseByBondCode&bondCode=<%=bondCode %>&aid=zqjbzl12&textid=zqjbzlztext12">债券赎回情况 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext12"><a onclick="showStyle('zqjbzlztext12')"  target="f10Frame" href="${contextPath }/baseInfo.do?method=getList&tableName=ZQJYQKPS&codeType=bond&code=<%=bondCode %>&aid=zqjbzl13&textid=zqjbzlztext13">经营情况评述 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext13"><a onclick="showStyle('zqjbzlztext13')" target="f10Frame" href="${contextPath }/baseInfo.do?method=getList&tableName=ZQTZQKSM&codeType=bond&code=<%=bondCode %>&aid=zqjbzl14&textid=zqjbzlztext14">投资情况说明 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext14"><a onclick="showStyle('zqjbzlztext14')" target="f10Frame" href="${contextPath }/baseInfo.do?method=getList&tableName=ZQGG&codeType=bond&code=<%=bondCode %>&aid=zqjbzl15&textid=zqjbzlztext15">债券公告 </a></td>
	  </tr>
	  <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext15"><a onclick="showStyle('zqjbzlztext15')" target="f10Frame" href="${contextPath }/baseInfo.do?method=getList&tableName=ZQDSJ&codeType=bond&code=<%=bondCode %>&aid=zqjbzl16&textid=zqjbzlztext16">债券大事记 </a></td>
	  </tr>
	 <tr>
	    <td class="lmenu_a blue3" id="zqjbzlztext16"><a onclick="showStyle('zqjbzlztext16')" target="f10Frame" href="${contextPath }/baseInfo.do?method=getList&tableName=ZQDTYDP&codeType=bond&code=<%=bondCode %>&aid=zqjbzl17&textid=zqjbzlztext17">债券动态与点评 </a></td>
	  </tr>
	</table>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
<div class="w706 fright"> 
   <!--右侧个股价格开始-->
  <div class="ggxx"><!--右侧个股价格结束-->
  		
		<iframe id="f10Frame" name="f10Frame" src="<%=iframeSrc%>" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" onload="frameFitSelfHeight('f10Frame')"></iframe>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>