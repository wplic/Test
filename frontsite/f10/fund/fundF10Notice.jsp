<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.List"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 基金个股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <jsp:include page="/f10/fund/fundF10_lmenu.jsp">
			<jsp:param name="menu" value="13" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
<div class="w706 fright"> 
   <!--右侧个股价格开始-->
  <div class="ggxx"><!--右侧个股价格结束-->
 <div class="left_tit2">
    <jsp:include flush="true" page="/f10/fund/FundCodeSearch.jsp"></jsp:include>
 </div> 
<div class="blank5"></div>
<div class="f10_tab03 textcenter">
	<span class="red font14 bold ml32">${name}</span>
    <span class="font14 ml10">(${code})</span>
    <span class="ml20"></span>
</div>
<div class="blank5"></div>
<table width="97%" align="center" class="lh28 font_st list_bline1">
<c:forEach var="baseInfo" items="${baseInfoList}">
	<tr>
		 <td width="537">
			<a	href="${ctx }/cms/newsContentGazx.jsp?table=${tableName}&guid=${baseInfo.guid}"
				title='${baseInfo.title}'
				target="_blank">${baseInfo.title}</a>
		</td>
		<td width="136" align="right" class="red"><fmt:formatDate value="${baseInfo.publishDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
</c:forEach>
  </table>
<div class="lh30 textcenter">
  <form action="/baseInfo.do?method=getList&tableName=${tableName}&codeType=${codeType}&code=${code}" method="post" id="infoForm">					
					<table width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td height="35" class="tdr"><%=PageUtil.pagination("infoForm",totleCount, currentPage, pagesize)%></td>
						</tr>
					</table>
				</form>
</div>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>