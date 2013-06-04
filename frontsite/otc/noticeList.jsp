<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${pageTile }</title>
		<link href="${ctx }/css/otc/common.css" rel="stylesheet" type="text/css" />
		<script>
		</script>
	</head>
	<%
		List noticeList = (List)request.getAttribute("noticeList");
	%>
	<body>
		<jsp:include page="${ctx}/commons/mstop.jsp" />
		<div class="main">
		<div class="gtjy_l_t"><span>当前位置：</span><a href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList">广发OTC首页 </a> > ${pageTile }</div>
			            <table width="100%" class="lh25 font_st">
			            	<c:if test="${not empty noticeList}">
			            		<logic:iterate id="data" name="noticeList" indexId="num">
							  	<tr class="xuxian">
								    <td width="70%" align="left"><span class="font_8c">·</span>
								      <a href="${ctx }/front/otcDocumentAction.do?method=getDocInfo3&documentId=${data.id }" target=\"_blank\">
										    ${data.title}
								      </a>
								    </td>
								    <td align="right"><span class="font_8c">${data.upddate }</span></td>
								  </tr>
							  </logic:iterate>
			            	</c:if>
							  <c:if test="${empty noticeList}">
							 	<tr>
							 		<td colspan="2" align="center">暂无记录...</td>
							 	</tr>
							 </c:if>
							 <%if(noticeList!=null && noticeList.size()<15){ 
							  	for(int i=0;i<(15-noticeList.size());i++){
							  %>
							  		<tr class="xuxian">
								    <td width="70%" align="left"><span class="font_8c">.</span>
								    </td>
								    <td align="right"><span class="font_8c"></span></td>
								  </tr>
							  <%} }%>
						</table>
					<div align="center"> <c:out value="${linkStr}" escapeXml="false"></c:out></div>
		</div>	
		<div class="foot">
			<jsp:include page="${ctx }/commons/msbottom.jsp" />
		</div>
	</body>
</html>