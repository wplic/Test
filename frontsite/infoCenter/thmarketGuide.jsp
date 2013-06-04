<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
String whichCat="rszn";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
	whichCat=request.getParameter("whichCat");
}

String nav2=whichCat;
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=sb" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 >　资讯中心  &gt; 三板</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
<jsp:include page="/infoCenter/thmarket_lmenu.jsp">
           <jsp:param name="nav2" value="<%=nav2%>"/>
    	</jsp:include>
	  <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">入市指南</div>
    <div class="blank10"></div>
<div class="tabsL01" style=" width:706px">
   	      	<h2 class="active red" id="tagtabs1" onclick="SwitchNews('tabs', 1, 4,'active red','')"><a href="#">代办转让风险揭示</a></h2>
            <h2 id="tagtabs2" onclick="SwitchNews('tabs', 2, 4,'active red','')"><a href="#">代办转让开户</a></h2>
      <h2 id="tagtabs3" onclick="SwitchNews('tabs', 3, 4,'active red','')"><a href="#">办理流程</a></h2>
      <h2 id="tagtabs4" onclick="SwitchNews('tabs', 4, 4,'active red','')"><a href="#">交易规则</a></h2>
    <h2><a href="http://www.gfzr.com.cn/index2.htm" target="_blank">SCA平台</a></h2>
    	</div>
<div class="tabsLcon01 lh28 p20" style=" width:666px">
          <div id="tabs1">
          	参与股份报价转让，除股票投资的共有风险外，还应特别关注以下风险：<br /><br />
1、公司风险：挂牌公司集中于高新技术行业，技术更新换代较快，对单一技术和核心技术人员的依赖度较高。部分公司规模较小，抗市场风险和行业风险的能力较弱，主营业务收入可能波动较大。<br /><br />
2、流动性风险：报价转让由买卖双方自行达成转让协议，存在一定时间内无法成交的可能性。<br /><br />
3、信息风险：挂牌公司信息披露要求和标准低于上市公司，投资者不应完全依赖公司所披露的信息作出投资决策。<br /><br />
4、信用风险：报价转让业务不实行担保交收，可能因其交易对手方的原因导致无法完成交收。<br /><br />
本风险揭示书并不保证揭示股份报价转让业务的全部投资风险。在您参与此项业务前，请务必对此有清醒的认识。<br /><br />
本人已认真阅读本报价转让特别风险揭示书，理解所揭示的风险，并愿意承担投资风险给本人造成的损失。
          </div>
          
          <div id="tabs2" style=" display:none">
          	A、境内个人投资者：中华人民共和国居民身份证及复印件；填妥的《股份账户注册申请表（个人）》。若委托他人代理开户的，还须提供经公证的代理委托书及复印件、代办人身份证及复印件。<br/> <br />
B、境内法人投资者：法人营业执照（或注册登记证书）副本及复印件；法定代表人证明书；法定代表人授权委托书；法定代表人和经办人身份证及复印件；填妥的《股份账户注册申请表（法人）》。<br/>
*境内法人暂不允许参与B类股份转让。<br/> <br /> 
C、境外个人投资者：本人有效境外居民身份证、护照或其他有效身份证件及复印件；填妥的《股份账户注册申请表（个人）》；若委托他人代理开户的，还须提供授权委托书原件、代理人有效身份证明及复印件。<br/> <br /> 
D、境外法人投资者：商业注册登记证明文件或其他具有同等法律效力的并能证明该机构设立的有效证明文件及复印件；董事会、董事、主要股东或有权人士的授权委托书；授权人有效身份证明文件复印件；经办人有效身份证明文件及复印件。<br/> <br /> 
*境外投资者暂不允许参与A类股份转让。 <br/>
开户费用：境内投资者设立股份账户，按个人每户30元，法人每户100元；境外投资者设立股份账户，按个人每户4美元，法人每户15美元

          </div>
          
          <div id="tabs3" style=" display:none">
          	委托方式：投资者进行股份转让，可采用柜台委托、电话委托、互联网委托等委托方式进行。转让费用：转让佣金按股份转让金额的3‰收取，其他费用与A股相同。
交割：投资者于T+1日到原委托营业部进行交割，交割可在柜面进行也可在自助交割机上进行。<br/> 
股份暂停转让<br/> 
根据规定，出现以下情况之一的,股份暂停转让：<br/> 
⑴公司于转让日公布定期报告,股份当日暂停转让,下一个转让日恢复转让；<br/> 
⑵公司召开股东大会,会议期间为转让日的,股份暂停转让；<br/> 
⑶公司于转让日披露董事会有关“股份置换决议公告”或“股份终止代办转让公告”,股份当日暂停转让；<br/> 
⑷在公共传播媒介中出现股份转让公司尚未披露的消息，可能对股份转让产生较大影响的，可实施暂停转让，直至股份转让公司对该消息做出澄清公告后的第一个转让日恢复转让；<br/> 
此外，股份转让公司出现以下情形之一的，中国证券业协会，或证券公司报经中国证券业协会批准后，可以对其股份暂停转让，直至导致暂停转让的原因消除后恢复转让：<br/> 
①股份转让公司违反委托代办协议；<br/> 
②有关管理部门依法做出暂停转让的决定；<br/> 
③公司有重大违法行为；<br/> 
④公司发生影响股份转让的其他重大事件。<br/> 
出现下列情形之一的，股份转让公司或证券公司应当公告并终止股份转让。<br/> 
⑴股份转让公司获准上市或被收购；<br/> 
⑵股份转让公司或证券公司解散、依法被撤销、破产；<br/> 
⑶由于技术、管理上的原因，股份转让公司或证券公司不能实际履行其职责。<br/> 

股份转让公司实施分红派息：中国证券登记结算有限责任公司深圳分公司于股权登记日（R日）的次一工作日，将红股或股息自动划入投资者股份托管在证券公司处的证券账户或资金账户上。

  </div>
          
          <div id="tabs4" style=" display:none">
          	转让时间：股份转让日委托申报时间为上午9：30至11：30，下午1：00至3：00。<br/> <br/> 
竞价方式：在股份转让日下午3：00以集合竞价的方式配对撮合成交。<br/> <br/> 
交易单位：股份转让以"手"为单位，每"手"等于100股。<br/> <br/> 
申报规则：申报买入股份，数量应当为一手的整数倍。不足一手的股份，可一次性申报卖出。<br/> <br/> 
报价单位：A类股份每股价格，最小委托买卖单位为人民币0.01元；B类股份每股价格，最小委托买卖单位为0.001美元。<br/><br/>  
涨跌幅限制：涨跌幅限制为前一交易日转让价格的5％。
    </div>

          
        </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>