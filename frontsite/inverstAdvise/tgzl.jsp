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
<script src="${ctx }/commons/js/page.js" type="text/javascript"></script>
<script src="/js/setTab.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</head>

<body>
<form name="searchForm" id="searchForm"	action="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronItems" method="post">

<jsp:include page="/share/top.jsp" />
<table border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;"><tr><td>
<div class="main">
<div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
   <input type="hidden" id="pageNumber" name="pageNumber" value="1" />
    <!--请从此处复制代码开始-->
  <div id="tgzl" style="margin-left:-24px;">
    <div class="tgzl_l">
      <div class="tgzl_lm1"><img src="${contextPath}/inverstAdvise/images/tgzl_01.gif"/></div>
      <div class="tgzl_con1">
      <!-- 开始循环投资顾问信息BOX -->
     <c:forEach var="data" items="${requestScope.pagegrouplist.data}" >
      <div class="tgzl_li">
          <div class="tgzl_li_t"><span>${data.positionname}</span></div>
          <jsp:include page="${contextPath}/inverstAdvise/tgzl_load.jsp">
			  <jsp:param name="posittionname" value="${data.positionname}"/>
		</jsp:include>
        </div>
    </c:forEach>
    <c:choose>
	<c:when  test="${not empty requestScope.pagegrouplist.data}">
     <div align="right">
      <table>
   <tr height="5">
			<td  align="right" > <c:out
		value="${linkStr}" escapeXml="false"></c:out>
	&nbsp;&nbsp; 跳到 <input type=text name=jump id=jump size=3
	style="text-align:center" value='${requestScope.pagegrouplist.currentPage}'/>
	页&nbsp; <img border="0"
	src="${ctxPath }/match/nxsy/mncg/skin/default/pic/button020.gif" width="26"
	height="24" style="cursor:pointer;"
	onclick="javascript:checkPage(${requestScope.pagegrouplist.totalPages});"></img>
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
       <!-- 结束循环投资顾问信息BOX -->
      </div>
  </div>
    <div class="tgzl_r">
      <div class="tgzl_li_t2"><span>最新专栏文章</span><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticles"><img src="${contextPath}/inverstAdvise/images/tgzl_04.gif"/></a></div>
      <div class="tgzl_con2">
        <ul>
        <c:forEach var="articdata" items="${requestScope.articlelist}">
       
          <li><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronDetilArticle&owner_id=${articdata.owner_id}&article_id=${articdata.id}"> ${fn:substring(articdata.title,0,14)}...</a></li>
         </c:forEach>
        </ul>
      </div>
    </div>
  </div>
  
  <!--请从此处复制代码结束--> 
 
  
</div>
</td></tr><tr><td>
<jsp:include page="/share/bottom.jsp" />
</td></tr></table>
 </form>
</body>
</html>