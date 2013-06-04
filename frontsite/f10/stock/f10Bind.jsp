<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@include file="/commons/taglibs.jsp"%>
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
  <div class="dqwz">当前位置：首页 > 个股 > 关联关系</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="5" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})关联关系</div> 
    <div class="blank10"></div>

     <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
      <tr>
        <th height="30" class="center bold">关联方名称</th>
        <th class="center bold">关联关系</th>
        <th class="center bold">是否控制关系</th>
        <th class="center bold">备注</th>
   </tr>
    <c:forEach var="linkRelation" items="${linkRelationList}">
	              <tr>
	                <td width="37%" align="center">${linkRelation.relationName}</td>
	                <td width="15%" align="center">${linkRelation.linkRelation}</td>
	                <td width="15%" align="center">${linkRelation.controlRelation}</td>
	                <td width="33%" align="center">
	                	<c:if test='${linkRelation.remark==""}'>&nbsp;</c:if>
	                	${linkRelation.remark}
	                </td>
	              </tr>
              </c:forEach>
     </table>
     <form action="/stock.do?method=getLinkRelation&code=${stockCode}" method="post" id="relationForm">					
					<table width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td height="35" class="tdr"><%=PageUtil.pagination("relationForm",totleCount, currentPage, pagesize)%></td>
						</tr>
					</table>
				</form>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>