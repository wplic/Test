<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="productsServices_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">股权分置改革配套服务</div>
    <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
      <div class="p10 lh22">
   	  <p class="inden25">广发证券肩负起股改上市公司与广大流通股东沟通的桥梁作用。为上市公司组织IPTV投资者交流会以及股改专题交流会，而广大流通股东可借助广发的平台得与上市公司进行深入的沟通，从而获得更全面的信息，共同顺利完成股权分置改革工作。广发证券还为广大客户提供多种途径的投票渠道，客户可选择交易系统投票，网上投票，也可选择通过广发证券进行独立董事的授权投票，以及协助客户与上市公司联系参与现场的投票。</p><br />
      <p class="bold">流通股东通过交易系统投票流程</p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="345"><img src="/pic/branches/ggpt_pic.gif" /></td>
            <td valign="top">
            <div style=" height:83px"></div>
            <table border="1" width="100%" bordercolor="#cccccc" align="center" class="lh24">
              <tr>
                <td colspan="4" class="tab_th1 bold pl3">上市股票的投票代码规则</td>
                </tr>
              <tr>
                <td width="15%" align="center"><span class="blue">深圳</span><br />
                  市场</td>
                <td colspan="3" class="pl3">均以36开头，后四位与股票代码后四位相同，如：36xxxx</td>
                </tr>
              <tr>
                <td rowspan="2" align="center"><span class="blue">上海</span><br />
                  市场</td>
                <td width="28%" align="center">A股以738开头，后三位相同。</td>
                <td width="25%" align="center">B股以938开头，后三位相同。</td>
                <td width="32%" align="center">上海中签的深圳股票以789开头，后三位相同。</td>
              </tr>
              <tr class="red">
                <td align="center">738xxx</td>
                <td align="center">938xxx</td>
                <td align="center">789xxx</td>
              </tr>
            </table>
            <div style=" height:36px"></div>
            <table border="1" width="100%" bordercolor="#cccccc" align="center" class="lh24">
              <tr>
                <td class="p10"><span class="bold">注</span>：对于股权分置投票只有一个议案，价格统一输入<span class="red">“1元”</span>。</td>
              </tr>
            </table>
            </td>
          </tr>
        </table>

    </div>
    </div>
    </div>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />
</body>
</html>