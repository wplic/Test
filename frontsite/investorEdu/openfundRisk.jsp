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
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; 开放式基金风险揭示</div>
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
  <div class="left_tit2">开放式基金风险揭示</div> 
    <div class="blank10"></div>
    <p align="center" class="font14 bold mtb16">开放式基金风险揭示</p>
    <div class="lh21 p10">
      <p>　　第一条 您在申请开设基金账户之前，确认本人具备购买开放式基金资格，并已经详细阅读了拟申（认）购的《基金契约》、《招募说明书》、业务规则和其它公告的基金信息，充分认识投资基金的风险；基金以往的经营业绩，并不代表基金的未来业绩；基金管理人除尽诚信管理的义务外，不负责基金的盈亏，也不保证基金的最低收益。 <br />
        　　第二条 我部是您申请开放式基金交易业务的代理销售机构，只负责将您的申请数据传送至基金管理公司，申请数据的最终确认结果由基金管理公司及其过户登记机构负责，与我部无关。对由于以下原因造成的后果，我部不承担任何责任： <br />
        　　1、在您办理开户之日，您对我部还没有取得代理销售资格的基金开户申请，我部不予接受，并不承担由此带来的任何责任； <br />
        　　2、因不符合证券投资基金契约和招募说明书规定的条件而使各类申请无效； <br />
        　　3、对因基金账户开立不成功以及申（认）购失败，导致您损失的，我部不承担由此带来的任何责任； <br />
        　　4、由于基金管理公司过失，造成损害结果的发生； <br />
      　　5、其它非我部过失造成的原因，如突发性的通讯、设备故障或自然灾害及其它不可抗力因素。 </p>
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