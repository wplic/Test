<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
var size=14;            //字体大小
function fontZoom(fontsize){    //设置字体
    size=fontsize;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='red';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='';
}
function fontMax(){    //字体放大
    
    size=16
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='red';
    document.getElementById('xiao').className='';
}
function fontMin(){    //字体缩小
    size=12;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='red';
}
</SCRIPT>


</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz"></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
	<div class="tlbg3">
        	<p class="textTitle1" align="center">反洗钱知识</p>
	<div class="newstextArea">
   <div class="lh24">
			 <p>1、 什么是洗钱<br/>
              　　洗钱（money laundering），原意就是把脏污的硬币清洗干净。据说，早在上个世纪初，美国旧金山市一家饭店老板，看到自己饭店里一些用于日常流通的硬币上沾满了油污，因为怕弄脏了顾客所带的白手套而影响了饭店的生意，于是就将有油污的硬币用碱液去清洗，然后再将这些清洗后的干净硬币在饭店里使用。这或许可以称之为“洗钱”原始的辞源。<br>
              <br/>
              　　20 世纪20年代，美国芝加哥一黑手党金融专家买了一台投币式洗衣机，开了一洗衣店。他在每晚计算当天的洗衣收入时，就把其它非法所得的赃款加入其中，再向税务部门申报纳税。这样，扣去应缴的税款后，剩下的其它非法得来的钱财就成了他的合法收入。法律意义上的“洗钱” 
              一词由此得名。<br/>
              <br/>
              　　据说，我国早在清朝乾隆时期，“洗钱”的行为就已经存在。权臣和?|位高权重，又深得乾隆皇帝的宠爱，所以想托和?|“办事”的人很多，和?|自然也不会放过这么一个发财的机会。但“受人钱财、与人消灾”时间不长，和?|意识到，送到家里的钱多了，太容易出问题。 
              于是，他想出了一个办法——成立一间当铺，把家里不值钱的瓶瓶罐罐拿到当铺出售。每当有人想托和?|办事送礼的时候，就到和?|开的当铺，以极高的价格赎出一件根本不值钱的东西，或者是以极低的价钱当掉一件极其珍贵的物件。这样一来，送给和?|的钱表面上根本没有经过和?|的手，钱都来源于他的当铺，都是正当收入，但合法的外表下，却掩盖行贿受贿的实质。当铺掌柜会定期向和?|进行汇报，当和?|发现谁送的钱多的时候，就会派人去问有什么事，然后利用手中的权力搞定。如此一来，和?|的不义之财安全地在他的当铺中越积越多。这种把不法所得变为合法所得的行为就是典型的洗钱行为。<br>
              <br/>
              　　犯罪分子之所以通过“洗钱”行为把犯罪所得变为纳税后的合法所得，是为了在当局追查其收入来源时能对其收入有个“合理的解释”，不让这笔非法收入被当局依法收缴。并使得这些被“洗白”的钱因此能够放心大胆地花用。<br>
              <br/>
              　　洗钱行为在现代已经成了各个国际组织和国家所打击取缔的对象。对“洗钱”的定义各国有所不同，但大都大同小异。我国现有法律对“洗钱”有明确的界定：根据我国《反洗钱法》的规定，“洗钱”是指“通过各种方式掩饰、隐瞒毒品犯罪、黑社会性质的组织犯罪、恐怖活动犯罪、走私犯罪、贪污贿赂犯罪、破坏金融管理秩序犯罪、金融诈骗犯罪等犯罪所得及其收益的来源和性质”。</p>
            <p></p>
            <p>2、 犯罪分子洗钱的过程<br/>
              　　洗钱一般要经过3个程序：即部署阶段（platement stage）、分账阶段（layering stage）和融合阶段（integration 
              stage）。在部署阶段，犯罪分子对非法活动得来的钱财的进行初期处置，通常是将黑钱存入银行或进入股市或进行所谓实业投资如买楼、开酒店等；分账阶段，通过一系列复杂的金融交易，如银行转账，现金与证券的变换，跨国转移资金等，不断倒腾，可能会造成损失，但会使黑钱的最初来源逐渐模糊。第三，融合阶段，将分散的钱再收回来，以合法的形式回到罪犯手中。</p>
            <p>3、 为什么要反洗钱</p>
            <p>　　“洗钱”侵害着社会中每个合法公民的利益。<br/>
              <br/>
              　　“洗钱”本身是一种犯罪行为，而且它与其他各种“上游犯罪行为”——比如走私、贩毒、贪污贿赂、恐怖活动、金融诈骗、黑社会——是密切相关的。需要“洗”的钱一般都是犯罪所得。通过洗钱，犯罪组织和犯罪分子掩盖了其犯罪活动踪迹，得以“正当地享受”犯罪所得；另一方面，洗钱为犯罪集团提供了资金，使其能够“以合法掩护非法”，不断扩大犯罪势力，对社会造成更大的危害。<br/>
              此外，洗钱的猖獗会助长官员贪污腐败，造成贪官外逃。我国的资本外流数额排行世界第四位，仅次于委内瑞拉、墨西哥和阿根廷，已给经济发展带来负面影响；二是会损害金融机构的声誉，严重影响银行业务的拓展，诱发金融危机。如国际商业信贷银行倒闭，原因之一就是参与洗钱；三是严重损害了社会公平原则，冲击合法经济，破坏国家投资环境。如果一个国家洗钱盛行，大量的“黑钱”在金融市场上流转，显然是一种经济病态，投资者不可能没有安全顾虑。<br/>
              <br/>
              　　洗钱的危害还远不止这些，它甚至会影响到国家安全、加剧国家间的贫富差距。在国际社会严厉打击洗钱行为的大背景下，我国不参与国际反洗钱合作，任由洗钱罪行滋生，那无疑会损害政府声誉，影响我国的国际地位。因此，反洗钱是我国政府、金融机构和每个合法公民都应当尽到的责任。</p>
            <p></p>
            <p>4、 证券金融机构在反洗钱过程中所承担的义务<br/>
              <br/>
              　　根据我国法律规定，金融机构在业务过程中必须履行三项主要义务：<br/>
              <br/>
              　　第一， 客户身份识别义务。证券公司必须保证客户及其资料的真实、完整、一致；<br/>
              <br/>
              　　第二， 保存客户身份资料与交易资料的义务。证券公司必须按照法律规定的期限保存客户身份与交易资料，并保证其完整与真实；<br/>
              <br/>
              　　第三， 报送大额和可疑交易报告义务。当发现法律所规定的大额或可疑交易时，证券公司必须向相关部门进行报告。<br/>
              <br/>
              　　其他次要的义务还包括建立反洗钱内控机制、不向除有权机关外的机构和个人泄露客户资料、配合国家机关的反洗钱调查等。违反了这些义务的证券公司和个人会受到法律的处罚以及主管机关的纪律惩处。<br/>
              <br/>
            </p>
            <br/>
                           <br />
                           <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
	                	<tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>

                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>