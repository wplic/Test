<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 对帐单明细</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="clientService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>对帐单明细</h4></div>
  <div class="blank10"></div>
  <div class="khfwcx">
    <a href="#"></a>
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60">起始日期：</td>
        <td width="70"><input name="textfield" type="text" id="textfield" style=" width:60px" /></td>
        <td width="30"><a href="#"><img src="/pic/assetManage/date.gif"  /></a></td>
        <td width="60">终止日期：</td>
        <td width="70"><input name="textfield3" type="text" id="textfield3" style=" width:60px" /></td>
        <td width="30"><a href="#"><img src="/pic/assetManage/date.gif"  /></a></td>
        <td><a href="#"><img src="/pic/assetManage/butCx.jpg"/></a></td>
      </tr>
    </table>
  </div>
  <div class="blank10"></div>
  
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>