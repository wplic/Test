<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<script type="text/javascript">
 		function  ggcxListCrm(){
 		  var StartDate = document.getElementById("StartDate").value;
 		  var EndDate = document.getElementById("EndDate").value;
 		  var stock_id = document.getElementById("stock_id").value;
 		  var url=document.getElementById("ifm").src;
 		  var dellen=url.indexOf("&is_delete=0");
 		 
 		  url=url.substring(0,dellen);
 		 
 		  url=url+"&is_delete=0";
 		  if(StartDate!="")
 		  {
 		    url=url+"&StartDate="+StartDate;
 		  }
 		  if(EndDate!="")
 		  {
 		    url=url+"&EndDate="+EndDate;
 		  }
 		  if(stock_id!="")
 		  {
 		    url=url+"&stock_id="+stock_id;
 		  }

 		  document.getElementById("ifm").src=url;
 	}
 	function ListCrmWhichCat(whichCat)
 	{
 	 var url="${ctx }/bussinesshall/jjggQueryNewsList.jsp?state=1&whichCat="+whichCat+"&is_delete=0";
 	 document.getElementById("ifm").src=url;
 	}
 </script>
 <%
 String displayName="交易公告";
  %>
<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index" target="_brank">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt" target="_brank">网上营业厅</a> <%=displayName %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${ctx }/infoCenter/stockgg_lmenu.jsp?nav2=jysmrgg&nav3=sstbts1" />
<jsp:include page="${ctx }/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
   <div class="w706 fright">
    <div class="left_tit2"><%=displayName %></div>
    <div class="w440 fleft">
  	<jsp:include page="${ctx }/bussinesshall/jjggQueryNewsList.jsp">
  			<jsp:param name="state" value="1" />
  			<jsp:param name="whichCat" value="wsyyt_jygg|zxzx_jysgg_ssgg|zxzx_jysgg_hsgg"/>
  			<jsp:param name="is_delete" value="0"/>
  	</jsp:include>
 
  </div>
     <div class="w262 fright bg_ec ptb13">
  		<div class="side_top"></div>
    <div class="side_mid">
   	  <p class="side_tit1">公告查询</p>
   	  <form action="" name="query" method="post">
        <table width="76%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh28 mt5">
          <tr>
            <td>时    间：</td>
            <td>
            <input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
            
          </td>
          </tr>
          <tr>
            <td>至</td>
            <td>
            <input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
            </td>
          </tr>
          <tr>
            <td>股票代码： </td>
            <td><input type="text" id="stock_id" name="stock_id"  class="input108" /></td>
          </tr>

          <tr>
            <td>&nbsp;</td>
            <td align="right"><a href="#" onclick="ggcxListCrm();"><img src="${ctx}/pic/wsyyt/but_cx.jpg" /></a></td>
          </tr>
      </table>
      </form>
		<p class="side_line"></p>
	 </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>