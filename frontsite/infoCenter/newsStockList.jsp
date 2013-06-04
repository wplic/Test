<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<bean:parameter id="category" name="whichCat" value="" />
<bean:parameter id="showSize1" name="showSize" value="15" />
<bean:parameter id="docId1" name="docId" value=""/>
<bean:parameter id="titleWidth" name="titleWidth" value="50"/>
<%
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(null!=request.getParameter("showSize") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("showSize")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
		if(null!=request.getParameter("titleWidth") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("titleWidth")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
    String buttonNameValue="1";
    String buttonName="往日新闻查询";
    if(request.getParameter("buttonName")!=null&&!request.getParameter("buttonName").equals(""))
    {
      buttonNameValue=request.getParameter("buttonName");
      if(buttonNameValue.equals("2"))
       buttonName="更早视点回顾";
    }
	if(category==null){
		%>
<script type="text/javascript">
	alert('您请求的资讯栏目错误');
</script>
	<%
		return ;
	}
	
	int rowNum = Integer.parseInt(showSize1);
	int i=0;
%>
<script type="text/javascript">
	var StartDateFlag = "";
	function ggcxListCrm(){
	  var StartDate = document.getElementById("StartDate").value;
	  if(StartDate==StartDateFlag){
	  	 return;
	  }
	  StartDateFlag = StartDate;
	  
	  var url="${contextPath}/infoCenter/newsStockList.jsp?whichCat=<%=category%>&showSize=<%=showSize1%>&buttonName=<%=buttonNameValue%>&titleWidth=<%=titleWidth%>";
	  if(StartDate!=""){
 		    url=url+"&StartDate="+StartDate+"&EndDate="+StartDate;
 	  }
	  location.href=url;
	}
</script>
<body>
 <paging:page count="false" row="<%=rowNum%>"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
<table width="95%" align="center" class="lh28 font_st">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						i++;
						
						//String detailPage = "/news/NewsContent.jsp?docPara="+docPara ;
						String detailPage = "/cms/newsNewsContent.jsp?docId="+doc.getId() ;
					%>
					<tr class="list_bline1">
					<td width="524"><a href="<%=detailPage %>" target="_blank"><%=DocumentHelper.getTitle(doc,Integer.parseInt(titleWidth))%></a></td>
			        <td width="67"><%=DocumentHelper.getUploadDate(doc,"yy/MM/dd")%></td>
			        </tr>
		</paging:pageRow>
		 <%if(i< Integer.parseInt(showSize1)){ 
			  	for(int j=0;j<Integer.parseInt(showSize1)-i;j++){
			  %>
	  		
				  	<tr>
						<td width="524">&nbsp;</td>
						<td width="67">&nbsp;</td>
			        </tr>
			  <%} 
			  }
			  %>
        </table>
        <table width="90%" cellspacing="0" cellpadding="0" >
		        	<tr>
		        		<td height="1">
		        			&nbsp;
		        		</td>
		        	</tr>
		            <tr>
		            	<td width="15%" align="center">
		            	<form action="" name="query" method="post">
		            	<input type="hidden" id="StartDate" name="StartDate" value="" onPropertyChange="ggcxListCrm()"/>
		            	<input type="hidden" id="EndDate" name="EndDate" value=""/>
		            	<input type="submit" name="button2" id="button2" value="<%=buttonName %>" class="but_02" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;"/>
		            	</form>
		            	</td>
						<td width="45%" align="right">
								<paging:pageInfo empty="没有记录" />
										</td>
										<td width="35%" align="right">
								<paging:pageLink hasText="true" hasPageNo="true" mode="text"
								pages="2" hasGo="false" />
						</td>
					</tr>
		          </table>
</paging:page>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 
</body>
</html>