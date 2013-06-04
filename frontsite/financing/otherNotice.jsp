<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/rateNoticeLl.html">公告信息</a> - 历次公告</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/financing/notice_lmenu.jsp" />
         <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>历次公告</h4></div>
    <div class="blank10"></div>
     <iframe  id="ifm" name="ifm" onload="frameFitSelfHeight('ifm')" src="${contextPath }/financing/financinglist.jsp?state=1&whichCat=rzrq_qtgg&is_delete=0"   frameborder="0" marginheight="0" marginwidth="0"  width="100%" scrolling="no">
                   </iframe>
  
<div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>