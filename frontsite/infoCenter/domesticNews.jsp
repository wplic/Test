<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
String bt="国内财经";
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="zxzx_glcj";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	
	if(catNode!=null)
	bt=catNode.getDisplayName();
}

String nav2=whichCat;
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=xw" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;  <a href="${contextPath }/infoCenter/index.jsp?nav=zxzx">资讯中心</a> &gt; 新闻</div>
</div>
<div class="wrap_info3c">
    <!--左侧sied开始--> 
  <div class="w210 fleft ptb9">
    <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/infoCenter/info_lmenu.jsp">
           <jsp:param name="nav2" value="<%=nav2%>"/>
    	</jsp:include>
	   <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
   <div class="iptvside_bot"></div>
  </div>
    <!--左侧sied结束--> 
    
    <!--中间资讯内容开始--> 
  <div class="w706 fleft">
    <div class="left_tit2"><%=bt %></div>
    <div class="blank5"></div>
   <iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=<%=whichCat%>&showSize=20&titleWidth=80" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" height="640" ></iframe>
 
    
  </div>
  <!--中间资讯内容结束-->
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>