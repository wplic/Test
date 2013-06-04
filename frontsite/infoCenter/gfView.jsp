<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.cssweb.common.util.GetCategory"%>
<%@page import="com.oreilly.servlet.Base64Encoder"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryNode"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<jsp:directive.page import="com.css.system.Configuration" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
 String hangqingUrlzx = Configuration.getProperty("hangqingUrlzx");

%>
<body class="">
<jsp:include page="${contextPath}/share/top.jsp" />
<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt;  <a href="${contextPath }/infoCenter/index.jsp?nav=zxzx">资讯中心</a> &gt; 广发视点</div>
</div>
<div class="wrap_info2c">
  <!--左侧sied开始-->
    <div class="w677 fleft">
   	  <div class="gfsd font_43">
   	  <!--  -->
             <img src="${contextPath }/pic/infoCenter/list_gfsd.jpg" class="fleft mr15" />
        <div class="gfsd_txt">
        <!--  -->
        <jsp:include flush="true" page="${contextPath}/infoCenter/gfViewTop.jsp">
	          <jsp:param name="whichCat" value="gfsd"/>
	          
	 </jsp:include>
            <div class="blank5"></div>
          <hr style="border:1px solid #cccccc;clear:both; height:1px;" />
         
          <div class="blank10"></div>
          <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
              <td  valign="top">
					         <iframe width="100%"  src="${contextPath}/infoCenter/stockList.jsp?whichCat=gfsd&showSize=16&buttonName=2" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" height="500" ></iframe>
					
				</td>
             
            </tr>
          </table>
        </div>
           
    	</div>
  	</div>
  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w236 fright">
    	<ul class="info_tab1">
       <li class="active red" id="tagtabs71" onmouseover="SwitchNews('tabs7', 1, 3,'active red','link white')"><a href="#">大盘行情</a></li>
      <li class="link white" id="tagtabs72" onmouseover="SwitchNews('tabs7', 2, 3,'active red','link white')"><a href="#">广发基金</a></li>
      <li class="link white" id="tagtabs73" onmouseover="SwitchNews('tabs7', 3, 3,'active red','link white')"><a href="#">广发理财</a></li>
    </ul>
    <div class="blank5"></div>
         <iframe src="<%=hangqingUrlzx %>" id="hqIframes" name="hqIframes"  marginWidth="0" marginHeight="0" frameBorder="0" noresize width="100%" scrolling="no"></iframe>

    <table width="93%" align="center">
      <tr>
        <td height="10"></td>
        <td><label>
         
        </label></td>
      </tr>
    </table>
    <ul class="info_tab1">
       <li class="active red" id="tagtabs81" onmouseover="SwitchNews('tabs8', 1, 2,'active red','link white')"><a href="#">涨幅前五名</a></li>
      <li class="link white" id="tagtabs82" onmouseover="SwitchNews('tabs8', 2, 2,'active red','link white')"><a href="#">跌幅前五名</a></li>
    </ul>
    <div class="blank5"></div>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs81" >
     	<jsp:include flush="true" page="zdflist.jsp">
             <jsp:param name="zd" value="涨"/>
		     <jsp:param name="num" value="5"/>
        </jsp:include>
    </table>
    <table width="95%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs82" style=" display:none">
      <jsp:include flush="true" page="zdflist.jsp">
             <jsp:param name="zd" value="跌"/>
		     <jsp:param name="num" value="5"/>
        </jsp:include>
    </table>
    <div class="blank5"></div>
     <jsp:include page="/infoCenter/Search.jsp"/>
    </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<script src="${contextPath }/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 

</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 48]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>
