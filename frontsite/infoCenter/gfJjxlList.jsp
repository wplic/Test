<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<bean:parameter id="category" name="whichCat" value="" />
<bean:parameter id="showSize1" name="showSize" value="15" />
<bean:parameter id="docId1" name="docId" value=""/>
<bean:parameter id="buttonName" name="buttonName" value="往日新闻查询"/>
<bean:parameter id="titleWidth" name="titleWidth" value="50"/>
<%
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
	  
	  var url="${contextPath}/infoCenter/stockList.jsp?whichCat=<%=category%>&showSize=<%=showSize1%>&buttonName=<%=buttonName%>&titleWidth=<%=titleWidth%>";
	  if(StartDate!=""){
 		    url=url+"&StartDate="+StartDate+"&EndDate="+StartDate;
 	  }
	  location.href=url;
	}
</script>
<body>
 <paging:page count="false" row="<%=rowNum%>"
				provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">

        <table width="95%" align="center" class="lh28 font_st list_bline1">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						i++;
						
						//String detailPage = "/news/NewsContent.jsp?docPara="+docPara ;
						String detailPage = "/cms/newsContent.jsp?docId="+doc.getId() ;
					%>
					<tr>
			            <td width="524"><a href="<%=detailPage %>" target="_blank">·<%=DocumentHelper.getTitle(doc,Integer.parseInt(titleWidth))%></a></td>
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
        <div class="blank10"></div>
        <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
		            	<td width="15%" align="center">
		            	<form action="" name="query" method="post">
		            	<input type="hidden" id="StartDate" name="StartDate" value="" onPropertyChange="ggcxListCrm()"/>
		            	<input type="hidden" id="EndDate" name="EndDate" value=""/>
		            	<input type="submit" name="button2" id="button2" value="往日新闻查询" class="but_02" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;"/>
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