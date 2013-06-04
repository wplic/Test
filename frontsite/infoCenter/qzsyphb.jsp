<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<%
String whichCat="qzsyphb";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
}

String nav2=whichCat;
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=zq" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心  &gt; 债券</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
		<jsp:include page="/infoCenter/bond_lmenu.jsp">
		           <jsp:param name="nav2" value="<%=nav2%>"/>
		    	</jsp:include>
			  <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">企债收益排行榜</div>
    <div class="blank10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
       <iframe width="100%" onload="frameFitSelfHeight('qzz')" height="580" src="${ctx }/zqsyph.do?method=getQzsyphList" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="qzz" name="qzz" ></iframe>		           
      
          	</td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>