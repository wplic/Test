<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="com.css.system.Configuration"/>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<%
 String hangqingUrl = Configuration.getProperty("hangqingUrlGG");
// System.out.print("hangqingUrlhangqingUrlhangqingUrl="+hangqingUrl);
 %>
<div class="rtit1">股票走势</div>
 <div class="fright" style="vertical-align:top">
          <div class="blank5"></div>
        
          <table border="0" cellspacing="0" cellpadding="0" width="205">
            <tr>
              <td width="205" height="300">
	         	<iframe src="minFlash/index.html" id="hqIframes" name="hqIframes"  marginWidth="0" marginHeight="0" frameBorder="0" noresize width="100%" height="100%"  scrolling="no"></iframe>
	         </td>
            </tr>
          </table>
 <div class="w210 fright" style="vertical-align:top">
  <div class="blank5"></div>
	<div class="rtit1">广发业务部门</div>
 	<div class="bg_ff">
	<ul class="ywbm">
        <li><a href="${ctx }/business/businessIntro.html">投资银行业务</a></li>
        <li><a href="${ctx }/business/brokerAgent.html">经纪代理业务</a></li>
        <li><a href="${ctx }/business/assetManagement.html">资产管理业务</a></li>
        <li><a href="${ctx }/business/securitiesInvestment.html">投资自营业务</a></li>
        <li><a href="${ctx }/business/researchAndConsult.html">研究及顾问服务</a></li>
        <li><a href="${ctx }/business/businessYwgg.html">业务公告</a></li>
    </ul>
    </div>
  </div>
  </div>