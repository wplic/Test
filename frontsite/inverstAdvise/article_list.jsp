<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/inverstAdvise/css/common.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${ctx }/commons/js/page.js" type="text/javascript"></script>
<script src="/js/setTab.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</head>

<body>
<jsp:include page="/share/top.jsp" />
<table border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;"><tr><td>
<div class="main">
 <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
<form name="searchForm" id="searchForm"	action="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticles" method="post">
   <input type="hidden" id="pageNumber" name="pageNumber" value="1" />
<!--请从此处复制代码开始-->
  <div id="tgzl" style="margin-left:-24px;">
  <div class="tgzl_l2">
  <div class="tgzl_con3">
 
  <div align="center">
<img src="${contextPath}/inverstAdvise/images/tgzl_05_r.gif"/>
  <div class="tgzl_li2_r">
  <ul>
  <c:forEach var="articdata" items="${requestScope.articlelist.data}">
   <li><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronDetilArticle&owner_id=${articdata.owner_id}&article_id=${articdata.id}"> ${fn:substring(articdata.title,0,14)}...</a><span>${articdata.owner_name}&nbsp;&nbsp;${fn:substring(articdata.createdate,0,4)}-${fn:substring(articdata.createdate,4,6)}-${fn:substring(articdata.createdate,6,8)}</span></li>
   </c:forEach>
  </ul>
   <c:choose>
	<c:when  test="${not empty requestScope.articlelist.data}">
   <div align="right">
		   <table>
		   <tr height="5">
					<td  align="right" > <c:out
				value="${linkStr}" escapeXml="false"></c:out>
			&nbsp;&nbsp; 跳到 <input type="text" name="jump" id="jump" size="3"
			style="text-align:center" value='${requestScope.articlelist.currentPage}'/>
			页&nbsp; <img border="0"
			src="${ctxPath }/match/nxsy/mncg/skin/default/pic/button020.gif" width="26"
			height="24" style="cursor:pointer;"
			onclick="javascript:checkPage(${requestScope.articlelist.totalPages});"></img>
			</td>
				</tr>
		   </table>
	</div>
	</c:when>
		<c:otherwise>
			<div align="center">
				暂无数据
			</div>
		</c:otherwise>
	</c:choose>
	
	
</div>
  </div>
  </div>
  </div>
  <div class="tgzl_r2">
  <div class="tgzl_li_t2"><span>更多投资顾问专栏</span> <a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronItems"><img src="${contextPath}/inverstAdvise/images/tgzl_04.gif"/></a></div>
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
  </form>
</div>

</td></tr><tr><td>
<jsp:include page="/share/bottom.jsp" />
</td></tr></table>
</body>
</html>