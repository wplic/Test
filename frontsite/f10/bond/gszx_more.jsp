<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.cssweb.util.PageUtil"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@ include file="init.jsp" %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

<%
	String tableName = request.getParameter("tableName")==null?"GSBD":request.getParameter("tableName");
	
	String name="";
	   if(tableName.equals("GSBD")){ 
	      name="公司新闻";
	   }else if(tableName.equals("GSGG")){
	      name="公司公告";
	    }else if(tableName.equals("GSYW")){ 
	        name="报告原文";
	   }else if(tableName.equals("GSJYQKPS")){
	      name="市场评述";
	    }else if(tableName.equals("GSJYQKPS")){
	       name="研究报告"; 
	   }
%>
<div class="left_tit2">
	<jsp:include flush="true" page="bondCodeSearch.jsp"></jsp:include>
</div> 
  <!--右侧sied开始-->
		<div class="blank5"></div>
	<div class="f10_tab03 textcenter">
		<span class="red font14 bold ml32"><%=bondShortName %></span>
	    <span class="font14 ml10">
	    	<%
	    			if (bondCode != null && !"".equals(bondCode))
	    			{
	    					%>
	    						(<%=bondCode %>)
	    					<%
	    			}
	    	 %>
	    </span>
	
	</div>
	    <div class="blank5"></div>
	    <table width="97%" align="center" class="lh28 font_st list_bline1">
	    
	    <c:if test="${empty baseInfoList}">
						  <tr>
								<td align="center">没有找到相应数据！</td></tr>
							</c:if>
							<c:forEach var="baseInfo" items="${baseInfoList}">
								<tr>
									<td width="537">
										<a	href="${ctx }/cms/newsContentGazx.jsp?table=${tableName}&guid=${baseInfo.guid}"
											title='${baseInfo.title}'
											target="_blank">${baseInfo.title}</a>
									</td>
									<td width="136" align="right"><fmt:formatDate value="${baseInfo.publishDate}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
	    </table>
		   <div class="lh30 textcenter">
		   <form action="/baseInfo.do?method=getList&tableName=${tableName}&codeType=${codeType}&code=${code}" method="post" id="infoForm">				
							<table width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
								<tr>
									<td height="35" class="tdr"><%=com.cssweb.util.PageUtil.pagination("infoForm",totleCount, currentPage, pagesize)%></td>
								</tr>
							</table>
						</form>
		</div>
 