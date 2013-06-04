<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.dql.*"%>
<%@page import="com.css.cms.document.util.*"%>
<%@page import="java.util.*"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	
	function gotoSelectedPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	     //alert("Original action: " + x.action)  
	     x.submit();  
	 }  



</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 信息披露</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="sunnyPofService_lmenu.jsp">
	 	<jsp:param value="xxpl" name="menu"/>
	 </jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>信息披露</h4>
  </div>
  
  <table border="1" bordercolor="#cccccc" width="700" align="center" class="lh24">
      <tr class="rrtab_tt bold">
        <td align="center">产品代号</td>
        <td align="center">信息标题</td>
        <td align="center">发布日期</td>
       
      </tr>
	 <c:choose>
    	<c:when test="${cpcgwdList!=null }">
    		<c:forEach items="${cpcgwdList }" var="cpcg">

					<tr class="list_bline1">
					<td width="100" style="text-align: center;">
							${cpcg.prod_code }
						</td>
						<td width="458">
						
							<a href="/sunnyCustAction.do?method=showDownList&id=${cpcg.id }&title=${cpcg.title }" target="_blank"> ${cpcg.title }</a>
						</td>

						<td width="100" style="text-align: center;">
							${cpcg.fbrq }
						</td>
					</tr>
    		</c:forEach>
    	</c:when>
    	<c:otherwise>
    	<tr>
    			<td align="center" colspan="3">暂时没有记录</td>
    		</tr>
    	</c:otherwise>
    </c:choose>

    </table>
  <div class="pageBar">
				<form action="/sunnyCustAction.do?method=showCpcgwdByCust" method="post" id="navigatorForm">
					总共${totalPages }页，每页20条，共${totalPosts }条记录&nbsp;&nbsp;&nbsp;
				    <a href="/sunnyCustAction.do?method=showCpcgwdByCust&pageNumber=1">首页</a>   
				    <c:if test="${pageNumber>1}">  
				        <a href="/sunnyCustAction.do?method=showCpcgwdByCust&pageNumber=${pageNumber-1}">上一页</a>  
				    </c:if>   
				    跳转到第 <select name="pageNumber" onchange="gotoSelectedPage();">  
				    <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">  
				        <c:choose>  
				            <c:when test="${pageIndex eq pageNumber}">  
				                <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
				            </c:when>  
				            <c:otherwise>  
				                <option value="${pageIndex}">${pageIndex}</option>  
				            </c:otherwise>  
				        </c:choose>  
				    </c:forEach>  
				    </select>页
				    <c:if test="${pageNumber<totalPages}">  
				        <a href="/sunnyCustAction.do?method=showCpcgwdByCust&pageNumber=${pageNumber+1}">下一页</a>  
				    </c:if>   
				    <a href="/sunnyCustAction.do?method=showCpcgwdByCust&pageNumber=${pageNumber}">末页</a>  
				</form> 
				
			</div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</body>
</html>