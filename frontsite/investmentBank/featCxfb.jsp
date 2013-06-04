<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<bean:parameter name="nav" id="nav" value="cxhyfb"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - <a href="/investmentBank/feat.html"> 辉煌业绩</a> - 承销行业分布</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="feat_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
   <!--右侧sied开始-->
  <div class="w706 fright">
  	<div class="comtit1">
    <h4>承销行业分布</h4></div>
    <div class="blank10"></div>
    <div class="hyfbInfo">
    	<div class="txt">公司投资银行业务历年主承销项目涉及电力、能源、交通、运输、电子、信息、仪器、设备、医药、化工、冶炼、材料、建筑、地产和金融等多个行业；尤其是在机械设备仪表、石油化学、医药、金属与非金属等行业积累了丰富的经验并逐渐形成了特色及品牌。</div>
    </div>
    <div class="blank10"></div>
    <table width="98%" align="center" class="lh24 mt10">
      <tr>
        <td><span class="red font_st font12 ">·</span><span class="font14 bold font_43">主承销项目行业分布图</span>&nbsp;  ............................................................................................................................................................................</td>
      </tr>
    </table>
    
    <div class="bg_f5 p8">
    	<div class="bg_ff p8">
        <p align="center"><img src="${contextPath }/pic/investmentBank/qycx01.gif" /></p>
         <p align="right"><img src="${contextPath }/pic/investmentBank/qycx02.gif"/></p>
      </div>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>