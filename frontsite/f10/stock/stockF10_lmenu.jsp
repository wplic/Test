<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="org.apache.commons.lang.StringUtils" />
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
 <%

	String zqdm = "";
	if(session.getAttribute("stockCode")==null||session.getAttribute("stockCode").equals(""));
	zqdm=(String)session.getAttribute("stockCode");
	if (StringUtils.isEmpty(zqdm) || zqdm.length() != 6) {
		zqdm = "600001";
	}
	
	String menu=request.getParameter("menu")==null?"1":request.getParameter("menu");
%>
<tr>
    <td class='<%=menu.equals("1")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getStockBaseInfo&code=<%=zqdm%>">个股资料</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("2")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getCompanyInfo&code=<%=zqdm %>">公司基本资料</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("3")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getCutives&code=<%=zqdm %>">高管介绍</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("4")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getEquityShareholders&code=<%=zqdm %>">股本股东</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("5")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getLinkRelation&code=<%=zqdm%>">关联关系</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("6")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getCaiWudata&code=<%=zqdm%>">财务数据</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("7")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getFundHoldStock&code=<%=zqdm%>">基金持股</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("8")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getImportantActivity&code=<%=zqdm%>">重要行为</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("9")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/stock.do?method=getDistribution&code=<%=zqdm%>">发行分配</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("10")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/baseInfo.do?method=getList&tableName=GSBD&codeType=stock&code=<%=zqdm %>">公司新闻</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("11")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/baseInfo.do?method=getList&tableName=GSGG&codeType=stock&code=<%=zqdm %>">公司公告</a></td>
  </tr>
  <tr>
    <td class='<%=menu.equals("12")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/baseInfo.do?method=getList&tableName=GSYW&codeType=stock&code=<%=zqdm %>">报告原文</a></td>
  </tr>
    <tr>
    <td class='<%=menu.equals("13")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/baseInfo.do?method=getList&tableName=GSJYQKPS&codeType=stock&code=<%=zqdm %>">市场评述</a></td>
  </tr>
    <tr>
    <td class='<%=menu.equals("14")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>'><a href="${ctx }/baseInfo.do?method=getList&tableName=GSYJ&codeType=stock&code=<%=zqdm %>">研究报告</a></td>
  </tr>
</table>

