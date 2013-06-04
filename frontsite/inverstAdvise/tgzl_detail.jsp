<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/inverstAdvise/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="/js/setTab.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</head>

<body>
<jsp:include page="/share/top.jsp" />
<table border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;"><tr><td>
<div class="main">
<div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>

 <!--请从此处复制代码开始-->
  <div id="tgzl" style="margin-left:-24px;">
  <div class="tgzl_l2">
  <div class="tgzl_con3">
  <div class="tgzl_con3_l">
  <img class="img" alt="${requestScope.datatg.name }" src="${contextPath}/inverstAdvise/load_image.jsp?mpic=${requestScope.datatg.id}"/>
  <div class="tgzl_con3_n">${requestScope.datatg.name }</div>
  <div align="center" style="color:#003366; background:url('${contextPath}/inverstAdvise/images/tgzl_06.gif')  no-repeat;">
  ${fn:substring( requestScope.datatg.positionname,0,11)}
  </div>
  <div class="tgzl_con3_c">${requestScope.datatg.introduction}</div>
  </div>
  <div class="tgzl_con3_r">
<img src="${contextPath}/inverstAdvise/images/tgzl_05.gif"/>
  <div class="tgzl_li2">
  <table style="width: 100%;"><tr>
  <td style="text-align: center;  font-size: 16px;  font-weight: bold;  color: #016AAA;  padding-top: 5px;  height: 24px;  line-height: 24px;" align="center">
  ${requestScope.datarticle.owner_name}：${requestScope.datarticle.title}
  </td></tr><tr><td align="center">
  <p class="color2 center">${fn:substring(requestScope.datarticle.createdate,0,4)}年${fn:substring(requestScope.datarticle.createdate,4,6)}月${fn:substring(requestScope.datarticle.createdate,6,8)}日</p>
 </td></tr>
  </table>
  <p>&nbsp;</p>
  <p>　
  ${requestScope.datarticle.context}
  </p>
  </div>
  
  <!-- JiaThis Button BEGIN -->
 
<div class="jiathis_style pad10">
	<span class="jiathis_txt">分享到：</span>
	<a class="jiathis_button_icons_1"></a>
	<a class="jiathis_button_icons_2"></a>
	<a class="jiathis_button_icons_3"></a>
	<a class="jiathis_button_icons_4"></a>
	<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1354517536566418" charset="utf-8"></script>

<!-- JiaThis Button END -->
  <div class="center mar20">
 <a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticleItems&owner_id=${requestScope.datarticle.owner_id}">
<img src="${contextPath}/inverstAdvise/images/tgzl_08.gif"/></a></div>
  </div>
  </div>
  </div>
  <div class="tgzl_r2"> 
  <div class="tgzl_li_t2"><span>最新专栏文章</span><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticleItems&owner_id=${requestScope.datatg.id}"><img src="${contextPath}/inverstAdvise/images/tgzl_07.gif"/></a></div>
  <div class="tgzl_con2">
  <ul>
 <c:forEach var="articdata" items="${requestScope.articlelist}">
     <li><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronDetilArticle&owner_id=${articdata.owner_id}&article_id=${articdata.id}"> ${fn:substring(articdata.title,0,16)}...</a></li>
  </c:forEach>

  </ul>
  </div>
  <div class="tgzl_li_t2"><span>更多投资顾问专栏</span><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronItems"><img src="${contextPath}/inverstAdvise/images/tgzl_04.gif"/></a></div>
  <div class="tgzl_con2">
 <c:forEach var="tgdata" items="${requestScope.list}">
  <div class="tgzl_li3">
  <a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticleItems&owner_id=${tgdata.id}"><img class="img2" src="${contextPath}/inverstAdvise/load_image.jsp?mpic=${tgdata.id}"/></a>
  <p>
  <a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticleItems&owner_id=${tgdata.id}"><strong>${tgdata.name}</strong></a></p>
  <p class="color1">
  ${fn:substring(tgdata.positionname,0,12)}
  </p>
  <p>投顾资格：${tgdata.inverstno}</p>
  </div>
  </c:forEach>
  
  </div>  
  </div>
  </div>
 
  <!--请从此处复制代码结束--> 
</div>

</td></tr><tr><td>
<jsp:include page="/share/bottom.jsp" />
</td></tr></table>
</body>
</html>