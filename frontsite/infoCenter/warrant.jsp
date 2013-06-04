<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryNode"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<script src="/js/jsIfUtils.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<% 
	String whichCat = request.getParameter("whichCat");
	if(StringUtils.isEmpty(whichCat)){
		whichCat = "zxzx_qz_qzgg";
	}
	CategoryTree catTree = CategoryFactory.getCategoryTree();
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	String displayName = ""; //资讯当前所在栏目的中文名称
	if(catNode!=null){
		displayName = catNode.getDisplayName();
	}
 %>
<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="/infoCenter/index.jsp?nav=zxzx"> 资讯中心 </a> &gt; <a href="${contextPath }/infoCenter/warrantIndex.jsp?nav=zxzx&nav1=qz&nav2=qzxw&whichCat=zxzx_qz_qzxw"> 权证</a> &gt; <%=displayName %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	   <jsp:include page="${ctx }/infoCenter/warrant_lmenu.jsp" />
<jsp:include page="${ctx }/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=displayName %></div>
     <div class="blank10"></div>
     <jsp:include flush="true" page="/infoCenter/stockTop.jsp">
	          <jsp:param name="whichCat" value="<%=whichCat %>"/>
	          <jsp:param name="imgUrl" value="/pic/infoCenter/gsyw03.jpg"/>
	 </jsp:include>
    <div class="blank10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
         <iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=<%=whichCat%>&showSize=18&buttonName=1" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" onload="frameFitSelfHeight('fundNews')"></iframe>
        </td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>