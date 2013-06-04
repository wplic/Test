<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="body_bg">
<jsp:include page="${ctx}/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> &gt;手机证券 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${ctx}/bussinesshall/movetradehall/mobileDeal_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">掌上股市 - 支持机型</div>
    <div id="mobileSecu">
    <p class="title"><span class="tt3"><i>开通、退订方式</i></span></p>
    </div>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt5">
      <tr>
        <td width="24%" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_samsung.gif" /></td>
        <td width="76%" class="pl6">SCH-W579/SCH-M359/SCH-F589/SCH-W579/SCH-M359/SCH-F589/SCH-W539/SCH-F609/SCH-W399/F329/W379/SCH—W109/SCH-W569/W509/SCH-F679/SCH-S179/SCH-S169/SCH-F399/SCH-F359/SCH-F369/SCH-M309/M339/SCH-X609/SCH-X799/SCH-F509/F519/SCH-F319/F379/X989/SCH-W219/SCH-X369/X559/X619/SCH-X909/x919/x929/x939/SCH-X639/X699/X809/SCH—S259/SCH-F209/M299/SCH-S159/SCH-E159/SCH-X899/SCH-M509/SCH-X839/SCH-E239 

</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="pt5"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_lg.gif" width="82" height="37" /></td>
        <td width="76%" class="pl6">LG KG90C/LG C670/C676/LG KX236/KX206/LG KG70C/LG C820/LG Cu8280/LG C620/LG CU6260/LC5150/LC7150/LG C280/LG C810/C610/C686/LG CU8188/LG C650/LG C960/LG C910/c930/C950/c260/LG KX256/LG C270 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_moto.gif" /></td>
        <td width="76%" class="pl6">MOTO K2/ MOTO U6c/ MOTO A860</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="blue bold font16 ptb6">三洋/Sanyo</td>
        <td width="76%" class="pl6">SCP580 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="blue bold font16 ptb6">海信/Hisense</td>
        <td width="76%" class="pl6">Hisense C807/Hisense D806/Hisense C668/HisenseC3699/3700 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="blue bold font16 ptb6">海尔/HAIER</td>
        <td width="76%" class="pl6">S3000 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="blue bold font16 ptb6">酷派/COOLPAD</td>
        <td width="76%" class="pl6">coolpad238</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="blue bold font16 ptb6">华为</td>
        <td width="76%" class="pl6">huawei7188</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="blue bold font16 ptb6">CECT</td>
        <td width="76%" class="pl6">CECT C828</td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${ctx}/share/bottom.jsp" />
</div>
</body>
</html>