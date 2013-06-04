<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 期货IB业务 - 客户开户流程</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="FuturesIB_lmenu.jsp" />
        <div class="blank5"></div> 
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>客户开户流程</h4>
  		</div>
    <div class="blank10"></div>
    <p align="center"><img src="/pic/futuresIB/khlct.gif" /></p>
    <div class="blank10"></div>
    <p align="center" class="mt10">
    <img src="/pic/futuresIB/khjy.gif" border="0" usemap="#Map" />
      <map name="Map" id="Map">
        <area shape="rect" coords="301,47,412,65" href="http://www.gfqh.com.cn" target="_blank" />
        <area shape="rect" coords="483,262,628,281" href="http://www.cfmmc.com" target="_blank" />
      </map>
    </p>
    <br /><p align="center">遇网络故障等特殊情况请拨打人工报单电话：95105826 </p><br />
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>