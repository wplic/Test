<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/csswebutf.js"></script>
</head>
<%
TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	  %>
	<script type="text/javascript">
		var url = "/golden/dcxdz/custom.jsp";
		document.location.href=url;
	</script>
<%
	}
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 金管家服务 > 短彩信定制服务介绍</div>
  <div class="left_tit007">E对壹服务</div>
  <p align="center"><a href="/branches/ggpteOne.html" title="短彩信定制服务"><img src="/pic/sms/banner6.jpg" title="短彩信定制服务" /></a></p>
  <div class="blank10"></div>



    <div class="kline">
      <div class="qiebg">

       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">服务介绍</div>
      <div class="p10 lh22">
        <p>　　

        广发证券金管家E对壹服务，是广发证券基于您的个性化需求，集合公司各类资讯产品精华的手机资讯服务，包括短信以及彩信两大产品。金管家E对壹服务为您量身定制个性化的手机资讯套餐，令您可随时随地、随手掌握唯您专属的投资理财服务。
          <br />
        </p>
      </div>

        <div class="p10 lh22"> <img src="/pic/sms/ede1.jpg" /><a href="/branches/ggpteOne.html" title="短彩信定制服务"><span>&nbsp;&nbsp;&nbsp;&nbsp;了解更多</span></a>
<p>　金管家E对壹彩信，荟集了广发证券总部顶级分析师及投资顾问团队的智慧结晶，每日准时为您发送精选市场资讯。产品集合了<strong>投顾市场策略、行业公司精选、广发研究速递</strong>等王牌栏目，是您投资理财的决策利器。
          </p>
          <p><font color="#0000FF">适用对象：</font>目前仅支持中国移动、中国联通用户<br />
            <font color="#0000FF">发送频率：</font>1条/交易日，22条/月均<br />
            <font color="#0000FF">服务内容与资费标准</font><br />
          </p>
          <table width="100%" border="1" cellpadding="0" cellspacing="0" class="tab_cj">
            <tr>
              <td colspan="3" width="100%"><div align="center">金管家E对壹彩信资费标准</div></td>
            </tr>
            <tr>
              <td width="30"><p align="center">定制项目 </p></td>
              <td width="50%"><p align="center">彩信提示内容</p></td>
              <td width="7%"><p align="center">元 / 月 </p></td>
            </tr>
            <tr>
              <td><p align="left">E对壹彩信精选版</p></td>
              <td><p align="left">融汇宏观版、行业公司版精华内容</p></td>
              <td><p align="center">30</p></td>
            </tr>
            <tr>
              <td><p align="left"><a href="${contextPath }/branches/rzh6h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh6h">E对壹彩信时报财富资讯</a></p></td>
              <td><p align="left">专业团队助您快人一步，从浩如烟海的信息中甄别有效资讯。</p></td>
              <td><p align="center">38</p></td>
            </tr>
            <!-- 2013年1月15日加入 -->
            <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/hxzx.jsp?nav=grgf&nav1=cpyfw&nav2=hxzx">广发研发核心资讯</a></p></td>
              <td class="tab_cj"><p align="left">为您揭示资讯背后的内涵、展示研究分析的方法与思路，以期为您提升投资方法、增加投资成功的概率。</p></td>
              <td class="tab_cj"><p align="center">80</p></td>
            </tr>
             <!-- 2012年6月14日 加入 -->
            <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh1h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh1h">E对壹彩信“睿”组合1号</a></p></td>
              <td class="tab_cj"><p align="left">资深投资经理为您全方位提供组合持仓、操作计划、调研心得、时机选择、投资思考、财经点评等最新的个性化观点。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr>
            <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh2h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh2h">E对壹彩信“睿”组合2号</a></p></td>
              <td class="tab_cj"><p align="left">为您全方位示范选股、选时、仓位比例、止损控制等具体的投资操作计划，以短线进取的操作方式，力求助您把握市场脉络、主动捕捉市场热点投资机会。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr>
            <!-- 2012-10-26 取消蓝筹 -->
            <!-- <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh3h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh3h">E对壹彩信“睿”组合蓝筹优选</a></p></td>
              <td class="tab_cj"><p align="left">组合投资标的以低估值蓝筹为主要方向，以中期配置为主要投资策略，力争在保持组合的流动性、稳定性的基础上，为客户实现保值增值的目标。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr> -->
            <!-- 2012年6月14日 加入 -->
            <!-- 2013年1月14日 关闭 -->
            <!-- 
            <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/newGrow.jsp?nav=grgf&nav1=cpyfw&nav2=newGrow">E对壹彩信“睿”组合新兴成长</a></p></td>
              <td class="tab_cj"><p align="left">专注新兴成长公司，通过精选标的和组合配置，在合理控制投资风险的基础上，追求稳健回报。</p></td>
              <td class="tab_cj"><p align="center">688</p></td>
            </tr>  -->
            <!-- 2012年7月9日 加入 -->
             <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh4h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh4h">E对壹彩信“睿”组合双向策略</a></p></td>
              <td class="tab_cj"><p align="left">组合以财务数据精选价值被低估的优质个股，同时提供新股申购完整策略，力争提供固定收益品种最佳配置方案。本组合还引入了融券做空机制，通过先融券卖出股票，待股价下跌后买券还券，实现做空获利，多空双向使得大盘无论涨跌均有获利机会，尤其适合以保值增值为目标的高净值客户。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr>
            <!-- 2012年9月11日 加入 -->
            <!-- 2013年3月8日 取消定制
             <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh5h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh5h">E对壹彩信“睿”组合多空趋势</a></p></td>
              <td class="tab_cj"><p align="left">本组合为“股票+融资融券”类型，在行情趋势上涨时组合可以融资做多，当行情趋势下跌时组合可以融券做空或卖空对冲持仓股票的下跌风险，实现牛市加码投资和熊市卖空赚钱或对冲风险的功能优势。本组合为大盘趋势型投资风格，根据大盘趋势动态调节组合仓位比例，防范风险。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr>  -->
            <!-- 2012年11月7日加入 -->
            <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh7h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh7h">E对壹彩信“睿”组合趋势避险</a></p></td>
              <td class="tab_cj"><p align="left">组合着眼于趋势投资，即在对市场趋势进行充分研判的情况下，运用控制组合仓位、调整产品结构、改变交易频率等主动策略规避市场风险，把握绝对收益。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr>
              <!-- 2013年01月28日加入 -->
            <tr class="tab_cj">
              <td class="tab_cj"><p align="left"><a href="${contextPath }/branches/rzh8h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh8h">E对壹彩信“睿”组合价值优选</a></p></td>
              <td class="tab_cj"><p align="left">组合由资深投顾在把握经济结构调整和产业升级发展趋势的基础上，重点关注结构升级中的投资机会，深入挖掘具有长期投资价值的优质上市公司，并兼顾传统产业中具备新成长动力的上市公司，助您演绎财富增值传奇。</p></td>
              <td class="tab_cj"><p align="center">500</p></td>
            </tr>
          </table>
          <p class="p10" align="center"><input name="" class="dybtn1" onclick="Effect.openwin('msgview')" type="button" value="我要定制" />&nbsp;&nbsp;
          <input name="" onclick="javascript:window.location.href='https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do'" class="dybtn1" type="button" value="我要预约开户" />　</p>
       <div align="center" style="color: red"> 金管家E对壹彩信“睿”组合系列产品暂未开通网上定制业务。客户如有需要，请前往营业部现场咨询办理。</div>
      </div>
        <div class="p10 lh22">
          <p><img src="/pic/sms/ede2.jpg" />　<a href="/branches/ggpteOne.html" title="短彩信定制服务"><span>&nbsp;&nbsp;&nbsp;&nbsp;了解更多</span></a><br />
            金管家E对壹短信，是根据您的个性化需求，随时将第一手的财经资讯传递给您，便于您及时掌控账户状况、了解市场最新动态，获取专属的第一手财经信息。</p>
          <p><font color="#0000FF">适用对象：</font>适合中国移动、中国联通以及中国电信所有用户<br />
            <font color="#0000FF">服务内容与资费标准</font><br />
          </p>
      </div>
        <div class="p10 lh22">
  <table cellspacing="0" border="1" class="tab_cj" cellpadding="0">
  <tr>
    <td width="100%" colspan="4"><p align="center">金管家E对壹短信服务资费标准 </p></td>
  </tr>
  <tr>
    <td width="13%"><p align="center">信息类型 </p></td>
    <td width="30"><p align="center">定制项目 </p></td>
    <td width="50%"><p align="center">短信提示内容 </p></td>
    <td width="7%"><p align="center">元 / 月 </p></td>
  </tr>
  <tr>
    <td rowspan="8"><p align="center">账户交易信息 </p></td>
    <td><p align="left">账户明细提示 </p></td>
    <td><p align="left">账户总资产、持仓股票明细以及资金余额提示 </p></td>
    <td><p align="center">1 </p></td>
  </tr>
  <tr>
    <td><p align="left">账户市值提示 </p></td>
    <td><p align="left">账户总资产、持仓股票市值以及资金余额提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">成交提示 </p></td>
    <td><p align="left">交易成交提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">委托提示 </p></td>
    <td><p align="left">委托交易提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">转账提示 </p></td>
    <td><p align="left">资金转账提示 </p></td>
    <td><p align="center">1 </p></td>
  </tr>
  <tr>
    <td><p align="left">账户安全提示 </p></td>
    <td><p align="left">当账户发生交易密码改密、交易密码清密、资产账户改密、资产账户清密、资产账户挂失、资产账户解挂、资产账户冻结、资产账户解冻业务时发出通知 </p></td>
    <td><p align="center">1 </p></td>
  </tr>
  <tr>
    <td><p align="left">新股中签提示 </p></td>
    <td><p align="left">新股中签提示 </p></td>
    <td><p align="center">1 </p></td>
  </tr>
  <tr>
    <td><p align="left">分红派息提示 </p></td>
    <td><p align="left">账户分红、派息到账提示 </p></td>
    <td><p align="center">1 </p></td>
  </tr>
  <tr>
    <td rowspan="9"><p align="center">持仓个股信息 </p></td>
    <td><p align="left">持仓股票报价 </p></td>
    <td><p align="left">持仓股票的每交易日开盘报价 </p></td>
    <td><p align="center">5 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票交易所信息提示 </p></td>
    <td><p align="left">持仓股票的相关交易所公告的短信精简版 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票价位报警 </p></td>
    <td><p align="left">股票当日涨跌幅达到 3% 时提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票异常换手率提示 </p></td>
    <td><p align="left">股票当日换手超过 10% 时提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票连续多日收阳提示 </p></td>
    <td><p align="left">股票连续 3 日收阳时提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票连续多日收阴提示 </p></td>
    <td><p align="left">股票连续 3 日收阴时提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票多日累计换手率超 30% 提示 </p></td>
    <td><p align="left">股票 3 日内累计换手率超 30% 时提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓股票异动提示 </p></td>
    <td><p align="left">成交金额比明日增大 3 倍以上时提示 </p></td>
    <td><p align="center">2 </p></td>
  </tr>
  <tr>
    <td><p align="left">持仓封闭式基金净值提示 </p></td>
    <td><p align="left">持仓封闭式基金的净值提票 </p></td>
    <td><p align="center">1 </p></td>
  </tr>
  <tr>
    <td rowspan="11"><p align="center">提示预警信息 </p></td>
    <td><p align="left">新股发行提示 </p></td>
    <td><p align="left">每日新股配售消息提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">新股上市提示 </p></td>
    <td><p align="left">新股上市日消息提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">新股开盘报价提示 </p></td>
    <td><p align="left">新股首个交易日开盘价提示 </p></td>
    <td><p align="center">10 </p></td>
  </tr>
  <tr>
    <td><p align="left">深沪指数开盘点位提示 </p></td>
    <td><p align="left">每日深沪指数开盘点位提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">深沪五大涨幅个股提示 </p></td>
    <td><p align="left">涨幅前五位的个股，深沪个股合并计算 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">深沪五大跌幅个股提示 </p></td>
    <td><p align="left">跌幅前五位的个股，深沪个股合并计算 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">深沪五大活跃股提示 </p></td>
    <td><p align="left">成交金额前五位的个股，深沪个股合并计算 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">深沪五大换手率个股提示 </p></td>
    <td><p align="left">成交量换手率前五位的个股，深沪个股合并计算 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">沪 A 大盘预警 </p></td>
    <td><p align="left">当沪 A 综和指数大盘涨或跌 3% 时提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">深 A 大盘预警 </p></td>
    <td><p align="left">当深 A 成份指数大盘涨或跌 3% 时提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td><p align="left">新股中签率提示 </p></td>
    <td><p align="left">新股发行中签率提示 </p></td>
    <td><p align="center">3 </p></td>
  </tr>
  <tr>
    <td rowspan="3"><p align="center">国内外财经信息 </p></td>
    <td><p align="left">国内要闻 </p></td>
    <td><p align="left">国内综合新闻（偏重于经济类） </p></td>
    <td><p align="center">15 </p></td>
  </tr>
  <tr>
    <td><p align="left">国际要闻 </p></td>
    <td><p align="left">国际综合新闻（偏重于经济类） </p></td>
    <td><p align="center">15 </p></td>
  </tr>
  <tr>
    <td><p align="left">港澳台要闻 </p></td>
    <td><p align="left">港澳台综合新闻（偏重于经济类） </p></td>
    <td><p align="center">10 </p></td>
  </tr>
  <tr>
    <td rowspan="6"><p align="center">投资建议信息 </p></td>
    <td><p align="left">操作策略 </p></td>
    <td><p align="left">投资策略分析 </p></td>
    <td><p align="center">20 </p></td>
  </tr>
  <tr>
    <td><p align="left">早间财经 </p></td>
    <td><p align="left">第一时间解读市场要闻，把握市场动向。 </p></td>
    <td><p align="center">20 </p></td>

  </tr>
  <tr>
    <td><p align="left">内参快讯 </p></td>
    <td><p align="left">解读最新研究资讯，搜寻最具潜力个股。 </p></td>
    <td><p align="center">30 </p></td>
  </tr>
  <tr>
    <td><p align="left">盘中荐股 </p></td>
    <td><p align="left">以短线个股推荐为主 </p></td>
    <td><p align="center">30 </p></td>
  </tr>
  <tr>
    <td><p align="left">重点基金推荐 </p></td>
    <td><p align="left">关注基金动态，遴选最优基金投资品种。 </p></td>
    <td><p align="center">20 </p></td>
  </tr>
  <tr>
     <td><p align="left">广发研发核心资讯 </p></td>
     <td><p align="left">揭示资讯背后的内涵、展示研究分析的方法与思路，以期为您提升投资方法、增加投资成功的概率。</p></td>
     <td><p align="center">30 </p></td>
  </tr>
</table>
<p class="p10" align="center"><input name="" onclick="Effect.openwin('msgview')" class="dybtn1" type="button" value="我要定制" />&nbsp;&nbsp;
<input name="" onclick="javascript:window.location.href='https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do'" class="dybtn1" type="button" value="我要预约开户" />　</p>
      </div>
<br />
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">定制方法</div>
      <div class="p10 lh22">
        <p>　　

        广发证券客户请亲临开户营业部柜台或登录广发网办理金管家E对壹短信（彩信）定制业务，定制两个工作日后可获得相关的手机信息资讯。
          <br />
        </p>
      </div>
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">风险提示</div>
      <div class="p10 lh22">
        <p>　　

        以上短彩信资讯内容仅供参考，据此投资风险自担。
          <br />
        </p>
      </div>
    </div>
    </div>


  <!--右侧sied结束-->



</div>

<div class="winfix" id="msgview" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)" ><em><a href="#" onclick="Effect.openwin('msgview')"><img src="/pic/Subscribe/dot4.jpg" /></a></em>提示</div>
    <div class="popCon font14 lh30" >
	对不起，本短彩信定制服务只面向广发客户开放，请您<span class="red">
	<a href="/share/login.jsp"> 登录 </a></span>
	后应进入“金管家服务——>短彩信定制”进行定制，如果您还没有成为广发客户，请点击<span class="red"><a href="https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do">【预约开户】</a></span> ，进行在线预约，会有专人为您进行开户咨询。
    </div>
    <div class="popBot">
    	<input name="" onclick="Effect.openwin('msgview')" type="button" value="我知道了" class="popBtn1" />　
    </div>
</div>
<div id="winmask" style="display:none"></div> <!-- 遮罩层 -->
</body>
<jsp:include page="/commons/bottom.jsp" />


</html>