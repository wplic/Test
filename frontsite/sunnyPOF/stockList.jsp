<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
  <!--中侧sied开始-->
  <div>
  <table height= "100% " width="95%" align="center" class="lh28 font_st">
 <c:choose>
	<c:when test="${downList!=null }">
    		<c:forEach items="${downList }" var="down">
					<tr class="list_bline1">
						<td style="text-align: center;">
							<b> 【文件标题】<a href="/sunnyCustAction.do?method=showDown&id=${down.id }" target="_blank"> ${down.title }</a> </b>
						</td>
					</tr>
						<tr class="list_bline1">
						<td style="text-align: center;">
							 发布日期 ： ${down.fbrq }
						</td>
					</tr>
						<tr class="list_bline1">
						<td style="text-align: center;">
							<b>【内容】</b> ${down.content }
						</td>
					</tr>
						
    </c:forEach>
    </c:when>
    </c:choose>
    </table>
     <table height= "100% " width="95%" align="center" class="lh28 font_st">
 <c:choose>
	<c:when test="${cpcgwdList!=null }">
    		<c:forEach items="${cpcgwdList }" var="cpcgwd">
					
						<tr class="list_bline1">
						<td style="text-align: center;">
							<b>【附件】</b><a href="/sunnyCustAction.do?method=showDown&id=${cpcgwd.in_id }" target="_blank"> ${cpcgwd.v_title }</a>
						</td>
					</tr>
    </c:forEach>
    </c:when>
    	<c:otherwise>
    	<tr>
    			<td align="center">暂时没有下载附件</td>
    		</tr>
    	</c:otherwise>
    </c:choose>
    </table>
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</body>
</html>