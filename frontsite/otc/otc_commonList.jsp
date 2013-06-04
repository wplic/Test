<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String whichCat = request.getParameter("whichCat");
	if (whichCat.equals("otc_notice")){
		request.setAttribute("otc_title","产品公告列表");
	}
	if (whichCat.equals("otc_question")){
		request.setAttribute("otc_title","常见问题列表");
	}
	if (whichCat.equals("otc_tzzyd")){
		request.setAttribute("otc_title","投资者园地");
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/business/business.css" rel="stylesheet" type="text/css" />
<script src="/js/about_lmenu.js"></script>
</head>
	<body>
		<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList">广发OTC首页 </a> > ${otc_title }</div>

  <div class="comtit1"><h4>${otc_title }</h4></div>
  <div class="blank5"></div>
  
<div >
<div class="tlbg2">
  	<jsp:include page="/about/aboutList.jsp">
			<jsp:param name="whichCat" value="<%=whichCat%>" />
			<jsp:param name="showSize" value="20" />
			<jsp:param name="titleWidth" value="56" />
		</jsp:include>
     


<div class="blank5"></div>
</div>
</div>
</div>
<jsp:include page="/commons/msbottom.jsp" />
	</body>
</html>