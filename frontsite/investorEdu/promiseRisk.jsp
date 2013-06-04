<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=school" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt;  投资者承诺函</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="investorRisk_lmenu.jsp" />
<table width="95%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh21 mt5" align="center">
  <tr>
    <td width="94%" class="info_th01" style=" border-bottom:0">教育专栏检索</td>
  </tr>
  <tr>
    <td style="padding:5px"><table width="100%" class="font_43">
      <tr>
        <td>时间：</td>
        <td><input type="text" name="textfield" id="textfield" class="input108" /></td>
      </tr>
      <tr>
        <td>到：</td>
        <td><input type="text" name="textfield2" id="textfield2" class="input108" /></td>
      </tr>
      <tr>
        <td>栏目：</td>
        <td><label>
          <select name="select" id="select">
            <option>--所有栏目--</option>
          </select>
        </label></td>
      </tr>
      <tr>
        <td>关键字：</td>
        <td><input type="text" name="textfield8" id="textfield8" class="input108"/></td>
      </tr>
      <tr>
        <td height="28" colspan="2" align="center"><input type="submit" class="but_01" name="button3" id="button3" value="查询" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">投资者承诺函</div> 
    <div class="blank10"></div>
    <p align="center" class="font14 bold mtb16">投资者承诺函</p>
    <div class="lh21 p10">
      <p>　　本证券投资者（下称“本投资者”）郑重承诺如下： <br />
        　　1、本投资者具有相应合法的证券投资主体资格，不存在任何法律、行政法规、中国证券监督管理委员会和上海证券交易所、深圳证券交易所颁布的规范性文件及交易规则禁止或限制投资证券市场的情形。 <br />
        　　2、本投资者提供的所有证件、资料均真实、全面、有效、合法，并且保证资金来源合法。 <br />
        　　3、本投资者承诺自觉遵守与证券市场有关的法律、法规、规章制度及规范性文件，上海证券交易所交易规则、深圳证券交易所交易规则和中国证券登记结算有限责任公司的各项业务规定，以及所在证券公司的相关规章制度，并且自觉配合上海证券交易所、深圳证券交易所、中国证券登记结算有限责任公司和所在证券公司的规范证券市场行为。 <br />
        　　4、本投资者承诺在进行证券投资之前已经对证券交易规则、证券交易惯例、证券交易知识、所投资的证券产品有了一定的了解，并完全知悉证券投资过程中可能蕴含的亏损风险与盈利机会。 <br />
        　　5、本投资者承诺在开户过程中已充分接受了贵司员工对本投资者进行的投资者教育，并经贵司员工告知知晓了基本投资知识及各类投资风险。 <br />
        　　6、本投资者承诺已充分理解“投资责任自负”的含义，本投资者确认：本投资者进行的所有证券投资既存在盈利的可能，同时也存在亏损的可能，无论证券投资的结果是盈利或亏损均由本投资者自行承担。 <br />
      本人/机构已详细阅读并理解了《投资者承诺函》的各项内容。 </p>
</div><br />
    <div class=" blank10"></div>
    <div class="risytit">特别提示</div>
    <p class="p15 lh21"> 　　本公司敬告投资者，应当根据自身的经济实力和心理承受能力认真制定证券投资策略，尤其是当您决定购买ST、ST类股票时，尤其应该清醒地认识到该类股票比其他股票蕴涵更大的风险。由此可见，证券市场是一个风险无时不在的市场。您在进行证券交易时存在赢利的可能，也存在亏损的风险。<br />
    　　本风险揭示书并不能揭示从事证券交易的全部风险及证券市场的全部情形。您务必对此有清醒的认识，认真考虑是否进行证券交易。市场有风险，入市需谨慎！</p>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/commons/bottom.jsp" />
</body>
</html>