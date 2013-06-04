<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${ctx}/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> &gt; 支持机型 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp" />
<table width="93%" class="mt10" align="center">
  <tr>
    <td class="right_tit1">金管家手机证券公告</td>
  </tr>
</table>
<jsp:include page="${ctx}/bussinesshall/movetradehall/newsListNotify.jsp">
            <jsp:param name="catName" value="金管家手机证券公告" />
            <jsp:param name="whichCat" value="wsyyt_ydjyt_ydjytgg"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
    </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">支持手机列表</div>
    <p class="mtb10 indent10 font_43 bold">请点击各个型号查看具体使用方式：（此为代表机型，其它同类机型下载办法相类似）</p>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_nokia.gif"/></td>
        <td width="76%" class="pl6">3250/N70/5500/N71/N73/N75/N80/N83/N91/N92/N93/ N95/E50/ 
E60/E61/E70 3230 7610 6708 3660 N-Gage/QD 6670 6260 6680 6681 6600 7650 3650 6270/8800/7370/7360/7260/6060 7200 6230/6111 6020 7280 7270 6820 6610 3220 3120 2650 9500 6170 5140 3105 6220 6108 3300 3200 3108 3100/3120/3220 7250 6100 </td>
      </tr>
      <tr>
        <td class="pl6">3128 7710 9300</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_moto.gif" /></td>
        <td width="76%" class="pl6">V3/L7/U6 E680/E680i/E6 E398/E2 A728 A760 A768 A780 A1010 388C MPX220/100/200 V300 V303 V400 V500 V226 V501 V600 V690 V878 V系列其他型号</td>
      </tr>
      <tr>
        <td class="pl6">V635 V291 V226 V290 E365 C350 C650 E360 T720 T720i</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_se.gif" /></td>
        <td width="76%" class="pl6">K500/K506/K508/W800/W550 K700/K700C/K750C P802 P900/P908/M608 P910/P10C S700C T610/T616/T618 T628/T630 Z1010/Z500 Z600/Z608</td>
      </tr>
      <tr>
        <td class="pl6">J200c T290c F500 V800 Z500 T238 T312</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_samsung.gif" /></td>
        <td width="76%" class="pl6">D608/D808 D508/D528/X708 E608/E618/E638/E318 E338/E348/E358 D428/D418/D488 E108 X458 C208 C238</td>
      </tr>
      <tr>
        <td class="pl6">D720 P518 D448 D108 V208 S208 E418 P408 T508 T408 T308 E720 D500 E818 S508 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_siemens.gif"/></td>
        <td width="76%" class="pl6">SX1 </td>
      </tr>
      <tr>
        <td class="pl6">SF65 SL65 CV65 A51 A53 A62 A65 S65 M65 CXV65 CX65 CF62 C65 C60 C62 ST60 SL55   MC60 ST55 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="pt5"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_philips.gif" /></td>
        <td width="76%" class="pl6">9@9c 859 855 659 639 636 568 535 355 530</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="pt5"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_alcatel.gif" width="128" height="55" /></td>
        <td width="76%" class="pl6">OT835 OT757 OT756 OT557 OT735</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="pt5"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_lg.gif" width="82" height="37" /></td>
        <td width="76%" class="pl6">G622 G1800 G660 G920 G810 G650 G210</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="pt5"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_mitsubishi.gif" width="120" height="47" /></td>
        <td width="76%" class="pl6">M900 M800 M760 M750 M520 M350 M720 M330 M320</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_panasonic.gif" width="121" height="72" /></td>
        <td width="76%" class="pl6">X700/X800</td>
      </tr>
      <tr>
        <td class="pl6">Z800 X800 X77 X66 X500 X400 X300 X200 X100 A200 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" class="pt5"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_nec.gif" width="101" height="27" /></td>
        <td width="76%" class="pl6">N168 N916 N910 N900 N830 N820 N720 N718 N710 N620 N610 N810 N800 N8</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_dopod.gif" /></td>
        <td width="76%" class="pl6">515/535/565/575/585/566/586 830 686 696/699 700 818 828 838 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mio8390.jpg" width="110" height="70" /></td>
        <td width="76%" class="pl6">8390 </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_pda.gif" width="58" height="27" /></td>
        <td width="76%" class="pl6">各种Windows Mobile或者PocketPC系统的PDA </td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_lenovo.gif" width="114" height="53" /></td>
        <td width="76%" class="pl6">ET180 ET280 ET980 ET960 ET560 G900/901 XP618</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_bird.gif" width="118" height="55" /></td>
        <td width="76%" class="pl6">S689</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_capitel.gif" width="97" height="54" /></td>
        <td width="76%" class="pl6">F600 V859 F650 F608 G99 C8188 C8189 C8090 C8190</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_kejian.gif" width="102" height="55" /></td>
        <td width="76%" class="pl6">K580 K616 K529 A718 K686 K656 K618 K358 K368</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_tcl.gif" width="96" height="37" /></td>
        <td width="76%" class="pl6">E777 e767 818 728</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" align="center" style=" padding:5px 0"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_daxian.gif" width="124" height="66" /></td>
        <td width="76%" class="pl6">CU928</td>
      </tr>
    </table>
    <table width="98%" align="center" border="3" bordercolor="#e1e6ef" class="lh25 mt15">
      <tr>
        <td width="24%" rowspan="2" align="center"><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_sagem.gif" width="123" height="55" /></td>
        <td width="76%" class="pl6">myS-7</td>
      </tr>
      <tr>
        <td class="pl6">myX-8 myX-6 myX-7 myS-7 myS3</td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${ctx}/share/bottom.jsp" />

</body>
</html>