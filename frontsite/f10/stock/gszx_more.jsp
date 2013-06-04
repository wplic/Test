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
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > <%=name %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <%if(tableName.equals("GSBD")){ %>
       <jsp:include flush="true" page="/f10/stock/stockF10_lmenu.jsp?menu=10"></jsp:include>
    <%}else if(tableName.equals("GSGG")){ %>
       <jsp:include flush="true" page="/f10/stock/stockF10_lmenu.jsp?menu=11"></jsp:include>
    <%}else if(tableName.equals("GSYW")){ %>
       <jsp:include flush="true" page="/f10/stock/stockF10_lmenu.jsp?menu=12"></jsp:include>
    <%}else if(tableName.equals("GSJYQKPS")){ %>
       <jsp:include flush="true" page="/f10/stock/stockF10_lmenu.jsp?menu=13"></jsp:include>
    <%}else if(tableName.equals("GSYJ")){ %>
       <jsp:include flush="true" page="/f10/stock/stockF10_lmenu.jsp?menu=14"></jsp:include>
    <%}else{ %>
       <jsp:include flush="true" page="/f10/stock/stockF10_lmenu.jsp"></jsp:include>
	<%} %>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})<%=name %></div> 
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
							<td height="35" class="tdr"><%=PageUtil.pagination("infoForm",totleCount, currentPage, pagesize)%></td>
						</tr>
					</table>
				</form>
</div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>