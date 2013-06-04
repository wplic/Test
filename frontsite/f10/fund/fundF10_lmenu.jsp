<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
String nav2 = request.getParameter("nav2");
   nav2 = nav2 == null? "one": nav2;
String zqdm=(String)request.getSession().getAttribute("fundCode");
String menu=request.getParameter("menu")==null?"1":request.getParameter("menu");
%>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class='<%=menu.equals("1")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getFundInfo&gpdm=<%=zqdm %>">基金介绍</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("2")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getFundHolder&gpdm=<%=zqdm %>">基金持有人</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("3")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getFundPurchaseByFundCode&gpdm=<%=zqdm %>">基金申购与赎回</a></td>
  </tr>

  <tr>
    <td class='<%=menu.equals("4")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getFundIssueAndTradeByFundCode&gpdm=<%=zqdm %>">基金发行上市</a></td>
  </tr>

  <tr>
    <td class='<%=menu.equals("5")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getFundDividendByFundCode&gpdm=<%=zqdm %>">基金分红</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("6")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getFundNetValueByCodeAndDate&gpdm=<%=zqdm %>">基金净值</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("7")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/f10/fund/fundF10NetChanges.jsp?gpdm=<%=zqdm %>">基金净值变动</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("8")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/f10/fund/FundConfiguration.jsp?gpdm=<%=zqdm %>">基金资产配置</a></td>
  </tr>
    <tr>
    <td class='<%=menu.equals("9")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getInvestIndustryByCodeAndDate&gpdm=<%=zqdm %>">基金行业配置</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("10")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getKeyStockPortfolioByCodeAndDate&gpdm=<%=zqdm %>">持仓明细</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("11")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/fund.do?method=getPositionAdjustmentByCodeAndDate&gpdm=<%=zqdm %>">持仓调整</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("12")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/f10/fund/FundFinance.jsp?gpdm=<%=zqdm %>">基金财务</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("13")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${contextPath }/baseInfo.do?method=getList&tableName=JJQTGG&codeType=fund&code=<%=zqdm%>">基金公告新闻</a></td>
  </tr>

</table>

