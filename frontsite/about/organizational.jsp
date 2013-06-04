<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/about/aboutUs.html">关于广发</a> - <a href="/about/aboutUs.html">广发概况</a> - 组织架构</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/about/about_lmenu.jsp">
		           <jsp:param name="meun" value="gfkl"/>
		           <jsp:param name="nav2" value="zzgj"/>
		    	</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>组织架构</h4></div>
    <div class="clearfloat h25"></div>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
           
            <td>
            <img src="/pic/about/zzjg_2013.jpg" usemap="#Map"/></td>
          </tr>
        </table>
        <div class="clearfloat h25"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<map name="Map" id="Map">
  <area shape="rect" coords="7,149,169,183" href="http://www.gffunds.com.cn/" target="_blank" />
  <area shape="rect" coords="7,192,169,219" href="http://www.gfqh.com.cn/" target="_blank" />
  <area shape="rect" coords="7,230,169,256" href="http://www.gfgroup.com.hk/index.shtml" target="_blank" />
  <area shape="rect" coords="7,267,169,298" href="http://www.gfinvestment.cn" target="_blank"/>
</map>
</body>
</html>