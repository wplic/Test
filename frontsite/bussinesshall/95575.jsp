<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
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
<body >
<jsp:include page="/share/top.jsp" />
<div class="body_bg">

<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
      <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a>  &gt; <a href="${contextPath }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; 95575 </div>
      <div class="left_tit2">
  <table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
  <tr>
    <td width="4%">&nbsp;</td>
    <td>95575广发手机证券专线</td>
    </tr>
  </table>
</div>
      <table width="95%" align="center" class="mt15 lh22">
        <tr>
          <td width="24%"><img src="/pic/mobile/phone.png" /></td>
          <td width="76%"><p>　广发手机证券专线——95575，由广发证券为用户倾力打造，提供业内领先、覆盖全国的客户服务平台。<br />
            　　因应证券市场投资品种的丰富变化，交易手段的日新月异，满足投资者从业务咨询到技术支持等个性化的服务需求。<br />
            　　不论身处何地，只需一个电话，广发专业的客服团队、一流的理财服务就在您身边，给您最便捷和贴心的帮助，为您排忧解难，助您运筹帷幄！<br />
　　目前服务种类：自助交易、技术支持、投诉处理、帐户查询、业务资讯、人工服务。</p>
            </td>
        </tr>
      </table>
      <table width="100%" align="center" class="mt15">
        <tr>
          <td align="center"><img src="/pic/wsyyt/95575_lct.jpg" /></td>
        </tr>
      </table>
</div>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 23]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>