<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@page import="com.cssweb.inverstAdvise.service.InversAdviserService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.util.DataRow"%>
 <%@ include file="/commons/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%
 		String posittionname=request.getParameter("posittionname");
 		InversAdviserService inversAdviserService = new InversAdviserService(request);
 		List<DataRow> itemlist=inversAdviserService.queryTgbygroup(posittionname);
  %>
  <c:set var="list" scope="page" value="<%=itemlist%>"></c:set>
  <c:set var="list" value="<%=itemlist%>"></c:set>
      <!-- 开始循环投资顾问信息BOX -->
     <c:forEach var="data" items="${pageScope.list}" varStatus="status">

          <div class="tgzl_li_c">
            <div class="tgzl_li_i">
            <a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticleItems&owner_id=${data.id}">
            <img alt="${data.name}" style="width: 115px;height: 117px;" src="${contextPath}/inverstAdvise/load_image.jsp?mpic=${data.id}"/>
            </a>
              <div class="tgzl_li_n">${data.name}</div>
            </div>
            <div class="link_p"><a href="${contextPath}${data.cpinfourl}">查看产品信息</a><a href="${contextPath}/inverstAdvise/web/InverstAdviserAction.go?function=ShowFronArticleItems&owner_id=${data.id}">进入投顾专栏</a></div>
            <div class="tgzl_li_js">${data.introduction} </div>
          </div>
          <%if(itemlist.size()>1){ %>
          <c:if test="${!status.last}">
          <p class="tgzl_xi"></p>
          </c:if>
          <%} %>
    </c:forEach>
       <!-- 结束循环投资顾问信息BOX -->