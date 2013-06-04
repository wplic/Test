<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.question.po.JgjQuestion"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page import="com.cssweb.common.util.StringUtils"%>

<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List jgjQuestList = null;
		if (request.getAttribute("list") != null)
		{
				jgjQuestList = (List) request.getAttribute("list");
		} 
		String textStr = "";
		if (request.getAttribute("queryText") != null)
		{
			textStr = (String )request.getAttribute("queryText") ;
		}
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />

<script>
var hotCount =${requestScope.listCount};
var lastOperatedPool = -1;
var lastOperatedHotPool = -1;

function showPoolHotContent(showPoolId, questionId){
	if(hotCount != -1){
		if(lastOperatedHotPool != showPoolId){
			for(var i=0; i<hotCount; i++){
				document.getElementById("poolHotContent"+i).style.display="none";
			}
			document.getElementById("poolHotContent"+showPoolId).style.display="";
			lastOperatedHotPool = showPoolId;
		}else{
			document.getElementById("poolHotContent"+showPoolId).style.display="none";
			lastOperatedHotPool = -1;
		}
	}
}

</script>
</head>

<body>
  <jsp:include page="${contextPath}/share/top.jsp?nav=wsyyt&nav1=gfydjyt" />
  <div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> 
   <jsp:include page="/mobile/pmdList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="2"/>
				    	</jsp:include></div>
  <div class="blank5"></div>
</div>
<div class="mobox">
  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp?leftnav=management5&leftnav2=null"/>
  </div>
  
  
<div class="moright">

		<form action="${contextPath }/jgjQuesAction.do?method=getJgjQuestionList" name="queryForm" method="post">
  		<p>
  		<jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include>
  		</p>
        <div class="blank10"></div>
		<div class="rtit2"><span style="float:right;_padding-top:2px; padding-right:5px"><input class="font_a8" name="queryText" onclick="this.value=''" type="text" value="<%=textStr %>" />
        <a href="javascript:document.queryForm.submit()"><img src="${contextPath}/pic/mobile/btn_sear.jpg" align="absmiddle" /></a></span>常见问题</div>
		
		<%
				if (jgjQuestList != null )
				{
						for (int i = 0 ; i < jgjQuestList.size() ; i ++ )
						{
								JgjQuestion jgjquest =(JgjQuestion)jgjQuestList.get(i);
								%>
									<dl class="faqlist">
											<dt><a title="<%=(jgjquest.getQuestion() == null ?"":jgjquest.getQuestion() ) %>" href="javascript:showPoolHotContent('<%=i %>','<%=jgjquest.getId() %>')"><%= (jgjquest.getQuestion() != null ? jgjquest.getQuestion()  :"") %></a><br/></dt>
											<dd style="display: none" id="poolHotContent<%=i %>">
							                <%
							                		String requestStr = "";
							                		if (jgjquest.getResult() != null && !"".equals(jgjquest.getResult()))
							                		{
							                				
							                				//	requestStr =StringUtils.subString(jgjquest.getResult(),100,"......");
							                				requestStr =jgjquest.getResult();
							                		}
							                 %>
							                 <%=requestStr %>
							                 </dd>
							        </dl>
								<%
						}
				}
		 %>
		
	
        
        <div class="blank10"></div><br />
        <div align="right"> <%=PageUtil.pagination("window.queryForm",totleCount, currentPage, pagesize)%></div>
        <div class="blank10"></div>	
	</form>
</div>
<div class="blank0"></div>
<br />
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
<script src="${contextPath}/js/setTab.js" type="text/javascript"></script>
</body>
</html>