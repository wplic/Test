<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.roadshow.service.RoadShowService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.roadshow.pojo.RoadShow"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.util.PageUtil"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<%
	List list = (List)request.getAttribute("list");
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	RoadShowService service = (RoadShowService)ctx.getBean("roadShowService");
	RoadShow bean = service.getFirstRoadShow();
%>

<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - 网上路演</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>网上路演</h4></div>
    <div class="blank10"></div>
     <form action="${ctx }/roadshow.do?method=getSellList" name="roadForm" method="post">
    <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
    
     	<%
     		if(list!=null && list.size()>0){
     			RoadShow roadShow = null;
     			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
     			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
     			for(int i=0;i<list.size();i++){
     				roadShow = (RoadShow)list.get(i);
     	%>			
     		 <tr>
		        <td width="27" align="center"><img src="/pic/msindex/list_03.gif"/></td>
		        <td width="403"><a href="<%=roadShow.getUrlInfo() %>" target="_blank"><%=sdf1.format(roadShow.getStartTime()) %>-<%=sdf2.format(roadShow.getEndTime()) %></a></td>
		        <td width="241"><a href="<%=roadShow.getUrlInfo() %>" target="_blank"><%=roadShow.getTitle() %></a></td>
		      </tr>
     		
     	<%		
     			}
     			
     		}
     	
     	%>
     </table>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"> <%=PageUtil.pagination("window.roadForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
     </form>
     
    
  </div>
  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
		<div class="rtit1">最新路演</div>
        <div class="bg_ff ptb6 ribor3">
        <p align="center">
        <%if (bean!=null) {  %>
        <img src="${ctx}/share/showUploadImage.jsp?id=<%=bean.getPicId()%>" width="180" height="135" alt="无图"/>
        </p>
        <table width="90%" class="fcenter lh21 mt5" align="center">
          <tr>
            <td><span class="bold">路演说明：</span><br />
            <%=bean.getIntro() %>
</td>
          </tr>
          <tr>
            <td class="red" align="right"><a href="<%=bean.getUrlInfo() %>" target="_blank">查看详细</a></td>
          </tr>
        </table>
        <%} %>

     	</div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>	