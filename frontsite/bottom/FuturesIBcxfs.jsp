<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
  <div class="dqwz">当前位置：首页 - 期货IB业务 - 交易结算结果查询方式</div>
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
  		<div class="comtit1"><h4>交易结算结果查询方式</h4>
  		</div>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh22 mt10">
      <tr>
        <td>
          1、登陆中国期货保证金监控中心查询系统<a href="http://www.cfmmc.com" target="_blank" class="blue2">www.cfmmc.com</a>查询（主要方式）； <br />
          <br />
          2、登陆广发期货客户网上交易系统查询；<br />
          <br />
        3、通过电话语音查询系统查询（020—83936606）； <br />          
        <br />
        4、通过电子邮件或到营业部领取交易结算单查询。 <br /><br />
        <span class="bold red">重要提示：</span>客户对交易结算报告有异议的，必须在下一交易日开市前或合同约定的时间内向期货公司提出书面异议，否则，视同对交易结算报告内容的确认。 </td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>