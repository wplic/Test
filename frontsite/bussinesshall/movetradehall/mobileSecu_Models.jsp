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
    <div class="left_tit2">手机证券 - 支持机型</div>
    <div id="mobileSecu">
    <p class="title"><span class="tt3"><i>支持机型</i></span></p>
    <div class="textArea">
    <p>基于Kjava、Symbian、Windows Mobile、Palm等平台的手机终端都支持手机证券业务，部分典型机器列表如下（排名不分先后）： </p>
    <table width="100%" class="modelsTd">
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_moto.gif" alt="摩托罗拉"/></th>
    <td>Moto 388C Moto A760 Moto A760i Moto A768 Moto A768i Moto A780 Moto E680 Moto E680i Moto E680G Moto MPX Moto MPX220 Moto V3 Moto V3i Moto V300 Moto V303 Moto V500 Moto V600 Moto V501 Moto V635 Moto V80 V750 Moto V872 Moto V878 Moto A1200 Moto E2 Moto T720 Moto MOTOROKR_E6 Moto L7 L2 L6 L6i E375 E398 E398B E1000 V171 V180 V220 V3ie V3r V360 V360i V600i C380 C650 A668 A732 V191 A728 A835 Z3 C450 K1 Z6 V8 </td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_nokia.gif" alt="诺基亚"/></th>
    <td>N-Gage 2610 3128 5300 6030 6060 6070 6101 6102 6111 6131 6170 6270 6230i 6288 6300 6610i 6708 7260 7270 2610 3100 3128 3120 3200 3220 3230 3300 3650 6100 6108 6220 6230 6260 6600 6610 6630 6670 6680 6681 6820 7200 7210 7250 7250i 7360 7370 7610 7650 8800SI 8800 N80 7710 N70 N71 N72? N73 N90 N91 N93 N93i N95 N3250 E50 E61 E62 N-GageQD </td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_nec.gif" alt="NEC"/></th>
    <td>Ag NK Nq N8605 N6602 N6305 N6207 N6206 N6203 N5105 N5102 N940 N938 N930 N850 N840 N830 N820 N810 N800 N750 N728 N720 N718 N717 NEC N620 NEC N630 NEC N710 N610 N110 N118 </td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_se.gif" alt="索爱"/></th>
    <td>SE123 K700 K750 K300c K310c K500c K506c K508c k510c K550c K700c K750c K758c k790c K300i K500i K508i? K700i K750i S700i S700c P800 P908 P908c P910c T618 T628 J300 J300i M608c M600i W550i W800i W850i W300c W580C w550c W600c W610c W700c W710c W800c w810c W830c W958c? Z520i Z558c Z550c Z520c Z530c Z530</td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_samsung.gif" alt="三星"/></th>
    <td>D508 D600 D608 D728 D828 D828E I308 I718 I858 X138 X168 X208 X218 X478? X638 X658 X668 X678 X708 X818 E388 E398 E578 E728? E788 E788e E818 E838 E878 C158? P318 U108 U308</td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_dopod.gif" alt="多普达"/></th>
    <td>310 515 535 565 566 568 575 576 577 585 586 595 596 696 699 710 818 828 838 C720 C858 D600 D802 D830 P800 577W 586W E616 D810 900 D830 P805 M700 U100 9100 P802 CHT9000 C720W C600 C800 P4350</td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_lg.gif" alt="LG"/></th>
    <td>G210 G262 G622 G635 G660 G672 G688 G832 G1800 G7100 G932 G933 B2050 KG90 KG328 G850 KE608(巧克力) </td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_lenovo.gif" alt="联想"/></th>
    <td>G900 ET960 ET980 930 V806 ET280 ET560 P902 I921 </td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_panasonic.gif" alt="松下"/></th>
    <td>X700 X800 X400P A500 VS7 VS6 VS3 VS2 MX7 MX6 </td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_alcatel.gif" alt="阿尔卡特"/></th>
    <td>OT756</td>
  </tr>
  <tr>
    <th>大唐</th>
    <td>GX20N</td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_philips.gif" alt="飞利浦"/></th>
    <td>968</td>
  </tr>
  <tr>
    <th>BenQ</th>
    <td>P50 P51</td>
  </tr>
  <tr>
    <th>夏新</th>
    <td>A660 A310 E606 D80 E65 E70 E72 E78 C310 E860 E800 E850 M650 M630</td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_tcl.gif" alt="TCL"/></th>
    <td>E767 e300 U58</td>
  </tr>
  <tr>
    <th>海尔（HAIER）</th>
    <td>V100 V280</td>
  </tr>
  <tr>
    <th><img src="${ctx }/pic/wsyyt/mobileDeal/mobile_logo_bird.gif" alt="波导"/></th>
    <td>M19 M29 SC17C</td>
  </tr>
  <tr>
    <th>康佳（KONKA）</th>
    <td>A66 -A19</td>
  </tr>
  <tr>
    <th>Palm</th>
    <td>750 650 680</td>
  </tr>
  <tr>
    <th>首信（Capitel）</th>
    <td>C8188</td>
  </tr>
  <tr>
    <th><img src="/pic/wsyyt/mobileDeal/mobile_logo_siemens.gif" alt="西门子"/></th>
    <td>CX6C SK65 -CF62 SX1 CF6C</td>
  </tr>
  <tr>
    <th>华硕</th>
    <td>P535 P525 P735 P305 P505 </td>
  </tr>
  <tr>
    <th>技嘉</th>
    <td>Gigabyte g-Smart g-Smart i g-smart i300? g-Smart i加强版</td>
  </tr>
  <tr>
    <th>moboDA</th>
    <td>3360</td>
  </tr>
  <tr>
    <th>HTC</th>
    <td>8100</td>
  </tr>
</table>

    </div>
    </div>
   
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${ctx}/share/bottom.jsp" />

</body>
</html>