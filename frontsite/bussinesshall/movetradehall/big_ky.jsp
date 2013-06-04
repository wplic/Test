<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%@ include file="/commons/taglibs.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz"></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
	<div class="tlbg3">
        	<p class="textTitle1" align="center"><b><font size="2px">中国人民银行《金融机构大额交易和可疑交易报告管理办法》</font></b></p>
  <p class="textTitle2" align="center">中国人民银行令〔2006〕第2号</p>
   
   <div class="newstextArea" align="left">
   <p class="newstextAreatop">
   </p>
   <b>
  &nbsp;&nbsp;&nbsp;&nbsp; 根据《中华人民共和国反洗钱法》、《中华人民共和国中国人民银行法》等法律规定，中国人民银行制定了《金融机构大额交易和可疑交易报告管理办法》，
  经2006年11月6日第25次行长办公会议通过，现予发布，自2007年3月1日起施行。
                                                <div align="right">    <p align="right">行长：周小川&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
　　　　　　二〇〇六年十一月十四日</p></div>

   </b><br/>
   <div>

  </div>
    <p class="newstextAreabottom"></p></div>

   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div class="lh24">
  <p align="center"> <b style="font-size: 15px">金融机构大额交易和可疑交易报告管理办法</b></p><br/>
<br/><b>第一条</b>&nbsp;&nbsp; 为防止利用金融机构进行洗钱活动，规范金融机构大额交易和可疑交易报告行为，根据《中华人民共和国反洗钱法》、《中华人民共和国中国人民银行法》等有关法律、行政法规，制定本办法。
   <br/><b> 第二条 </b>&nbsp;&nbsp;本办法适用于在中华人民共和国境内依法设立的下列金融机构：
    <br/>（一）商业银行、城市信用合作社、农村信用合作社、邮政储汇机构、政策性银行。
    <br/>（二）证券公司、期货经纪公司、基金管理公司。
    <br/>（三）保险公司、保险资产管理公司。
    <br/>（四）信托投资公司、金融资产管理公司、财务公司、金融租赁公司、汽车金融公司、货币经纪公司。
    <br/>（五）中国人民银行确定并公布的其他金融机构。
     从事汇兑业务、支付清算业务和基金销售业务的机构报告大额交易和可疑交易适用本办法。
   <br/> <b>第三条 </b>&nbsp;&nbsp;中国人民银行及其分支机构对金融机构履行大额交易和可疑交易报告的情况进行监督、检查。
    <br/><b>第四条 </b>&nbsp;&nbsp;中国人民银行设立中国反洗钱监测分析中心，负责接收人民币、外币大额交易和可疑交易报告。
    中国反洗钱监测分析中心发现金融机构报送的大额交易报告或者可疑交易报告有要素不全或者存在错误的，可以向提交报告的金融机构发出补正通知，金融机构应在接到补正通知的5个工作日内补正。
    <br/><b>第五条</b>&nbsp;&nbsp; 金融机构应当设立专门的反洗钱岗位，明确专人负责大额交易和可疑交易报告工作。
    金融机构应当根据本办法制定大额交易和可疑交易报告内部管理制度和操作规程，并向中国人民银行报备。
    金融机构应当对下属分支机构大额交易和可疑交易报告制度的执行情况进行监督管理。
    <br/><b>第六条</b>&nbsp;&nbsp; 金融机构及其工作人员应当对报告可疑交易的情况予以保密，不得违反规定向任何单位和个人提供。
   <br/> <b>第七条</b>&nbsp;&nbsp;金融机构应当在大额交易发生后的5个工作日内，通过其总部或者由总部指定的一个机构，及时以电子方式向中国反洗钱监测分析中心报送大额交易报告。没有总部或者无法通过总部及总部指定的机构向中国反洗钱监测分析中心报送大额交易的，其报告方式由中国人民银行另行确定。
    客户通过在境内金融机构开立的账户或者银行卡发生的大额交易，由开立账户的金融机构或者发卡银行报告；客户通过境外银行卡发生的大额交易，由收单行报告；客户不通过账户或者银行卡发生的大额交易，由办理业务的金融机构报告。
    <br/><b>第八条</b>&nbsp;&nbsp;金融机构应当将可疑交易报其总部，由金融机构总部或者由总部指定的一个机构，在可疑交易发生后的10个工作日内以电子方式报送中国反洗钱监测分析中心。没有总部或者无法通过总部及总部指定的机构向中国反洗钱监测分析中心报送可疑交易的，其报告方式由中国人民银行另行确定。
    <br/><b>第九条</b>&nbsp;&nbsp; 金融机构应当向中国反洗钱监测分析中心报告下列大额交易：
    <br/>（一）单笔或者当日累计人民币交易20万元以上或者外币交易等值1万美元以上的现金缴存、现金支取、现金结售汇、现钞兑换、现金汇款、现金票据解付及其他形式的现金收支。
    <br/>（二）法人、其他组织和个体工商户银行账户之间单笔或者当日累计人民币200万元以上或者外币等值20万美元以上的款项划转。
    <br/>（三）自然人银行账户之间，以及自然人与法人、其他组织和个体工商户银行账户之间单笔或者当日累计人民币50万元以上或者外币等值10万美元以上的款项划转。
    <br/>（四）交易一方为自然人、单笔或者当日累计等值1万美元以上的跨境交易。
    累计交易金额以单一客户为单位，按资金收入或者付出的情况，单边累计计算并报告，中国人民银行另有规定的除外。<br/>
   <font color="red"> &nbsp;&nbsp;&nbsp;&nbsp;客户与证券公司、期货经纪公司、基金管理公司、保险公司、保险资产管理公司、信托投资公司、金融资产管理公司、财务公司、金融租赁公司、汽车金融公司、货币经纪公司等进行金融交易，通过银行账户划转款项的，由商业银行、城市信用合作社、农村信用合作社、邮政储汇机构、政策性银行按照第一款第（二）、（三）、（四）项的规定向中国反洗钱监测分析中心提交大额交易报告。
   </font><br/> &nbsp;&nbsp;&nbsp;&nbsp;中国人民银行根据需要可以调整第一款规定的大额交易标准。
   <br/> <b>第十条 </b>&nbsp;&nbsp;对符合下列条件之一的大额交易，如未发现该交易可疑的，金融机构可以不报告：
  <br/>  （一）定期存款到期后，不直接提取或者划转，而是本金或者本金加全部或者部分利息续存入在同一金融机构开立的同一户名下的另一账户。
    活期存款的本金或者本金加全部或者部分利息转为在同一金融机构开立的同一户名下的另一账户内的定期存款。
    定期存款的本金或者本金加全部或者部分利息转为在同一金融机构开立的同一户名下的另一账户内的活期存款。
  <br/>  （二）自然人实盘外汇买卖交易过程中不同外币币种间的转换。
   <br/> （三）交易一方为各级党的机关、国家权力机关、行政机关、司法机关、军事机关、人民政协机关和人民解放军、武警部队，但不含其下属的各类企事业单位。
    <br/>（四）金融机构同业拆借、在银行间债券市场进行的债券交易。
    <br/>（五）金融机构在黄金交易所进行的黄金交易。
    <br/>（六）金融机构内部调拨资金。
    <br/>（七）国际金融组织和外国政府贷款转贷业务项下的交易。
    <br/>（八）国际金融组织和外国政府贷款项下的债务掉期交易。
    <br/>（九）商业银行、城市信用合作社、农村信用合作社、邮政储汇机构、政策性银行发起的税收、错账冲正、利息支付。
    <br/>（十）中国人民银行确定的其他情形。
    <br/><b>第十一条</b>&nbsp;&nbsp; 商业银行、城市信用合作社、农村信用合作社、邮政储汇机构、政策性银行、信托投资公司应当将下列交易或者行为，作为可疑交易进行报告：
    <br/>（一）短期内资金分散转入、集中转出或者集中转入、分散转出，与客户身份、财务状况、经营业务明显不符。
   <br/>（二）短期内相同收付款人之间频繁发生资金收付，且交易金额接近大额交易标准。
    <br/>（三）法人、其他组织和个体工商户短期内频繁收取与其经营业务明显无关的汇款，或者自然人客户短期内频繁收取法人、其他组织的汇款。
    <br/>（四）长期闲置的账户原因不明地突然启用或者平常资金流量小的账户突然有异常资金流入，且短期内出现大量资金收付。
　<br/>（五）与来自于贩毒、走私、恐怖活动、赌博严重地区或者避税型离岸金融中心的客户之间的资金往来活动在短期内明显增多，或者频繁发生大量资金收付。
    <br/>（六）没有正常原因的多头开户、销户，且销户前发生大量资金收付。
    <br/>（七）提前偿还贷款，与其财务状况明显不符。
    <br/>（八）客户用于境外投资的购汇人民币资金大部分为现金或者从非同名银行账户转入。
    <br/>（九）客户要求进行本外币间的掉期业务，而其资金的来源和用途可疑。
    <br/>（十）客户经常存入境外开立的旅行支票或者外币汇票存款，与其经营状况不符。
    <br/>（十一）外商投资企业以外币现金方式进行投资或者在收到投资款后，在短期内将资金迅速转到境外，与其生产经营支付需求不符。
    <br/>（十二）外商投资企业外方投入资本金数额超过批准金额或者借入的直接外债，从无关联企业的第三国汇入。
    <br/>（十三）证券经营机构指令银行划出与证券交易、清算无关的资金，与其实际经营情况不符。
    <br/>（十四）证券经营机构通过银行频繁大量拆借外汇资金。
    <br/>（十五）保险机构通过银行频繁大量对同一家投保人发生赔付或者办理退保。
    <br/>（十六）自然人银行账户频繁进行现金收付且情形可疑，或者一次性大额存取现金且情形可疑。
<br/>（十七）居民自然人频繁收到境外汇入的外汇后，要求银行开具旅行支票、汇票或者非居民自然人频繁存入外币现钞并要求银行开具旅行支票、汇票带出或者频繁订购、兑现大量旅行支票、汇票。
  <br/>  （十八）多个境内居民接受一个离岸账户汇款，其资金的划转和结汇均由一人或者少数人操作。
    <br/><b>第十二条</b>&nbsp;&nbsp; 证券公司、期货经纪公司、基金管理公司应当将下列交易或者行为，作为可疑交易进行报告：
<br/>（一）客户资金账户原因不明地频繁出现接近于大额现金交易标准的现金收付，明显逃避大额现金交易监测。
   <br/> （二）没有交易或者交易量较小的客户，要求将大量资金划转到他人账户，且没有明显的交易目的或者用途。
    <br/>（三）客户的证券账户长期闲置不用，而资金账户却频繁发生大额资金收付。
    <br/>（四）长期闲置的账户原因不明地突然启用，并在短期内发生大量证券交易。
    <br/>（五）与洗钱高风险国家和地区有业务联系。
   <br/> （六）开户后短期内大量买卖证券，然后迅速销户。
    <br/>（七）客户长期不进行或者少量进行期货交易，其资金账户却发生大量的资金收付。
    <br/>（八）长期不进行期货交易的客户突然在短期内原因不明地频繁进行期货交易，而且资金量巨大。
    <br/>（九）客户频繁地以同一种期货合约为标的，在以一价位开仓的同时在相同或者大致相同价位、等量或者接近等量反向开仓后平仓出局，支取资金。
    <br/>（十）客户作为期货交易的卖方以进口货物进行交割时，不能提供完整的报关单证、完税凭证，或者提供伪造、变造的报关单证、完税凭证。
   <br/> （十一）客户要求基金份额非交易过户且不能提供合法证明文件。
    <br/>（十二）客户频繁办理基金份额的转托管且无合理理由。
    <br/>（十三）客户要求变更其信息资料但提供的相关文件资料有伪造、变造嫌疑。
   <br/> <b>第十三条</b>&nbsp;&nbsp; 保险公司应当将下列交易或者行为，作为可疑交易进行报告：
    <br/>（一）短期内分散投保、集中退保或者集中投保、分散退保且不能合理解释。
    <br/>（二）频繁投保、退保、变换险种或者保险金额。
    <br/>（三）对保险公司的审计、核保、理赔、给付、退保规定异常关注，而不关注保险产品的保障功能和投资收益。
   <br/> （四）犹豫期退保时称大额发票丢失的，或者同一投保人短期内多次退保遗失发票总额达到大额的。
   <br/> （五）发现所获得的有关投保人、被保险人和受益人的姓名、名称、住所、联系方式或者财务状况等信息不真实的。
    <br/>（六）购买的保险产品与其所表述的需求明显不符，经金融机构及其工作人员解释后，仍坚持购买的。
    <br/>（七）以趸交方式购买大额保单，与其经济状况不符的。
    <br/>（八）大额保费保单犹豫期退保、保险合同生效日后短期内退保或者提取现金价值，并要求退保金转入第三方账户或者非缴费账户的。
    <br/>（九）不关注退保可能带来的较大金钱损失，而坚决要求退保，且不能合理解释退保原因的。
    <br/>（十）明显超额支付当期应缴保险费并随即要求返还超出部分。
   <br/> （十一）保险经纪人代付保费，但无法说明资金来源。
    <br/>（十二）法人、其他组织坚持要求以现金或者转入非缴费账户方式退还保费，且不能合理解释原因的。
    <br/>（十三）法人、其他组织首期保费或者趸交保费从非本单位账户支付或者从境外银行账户支付。
    <br/>（十四）通过第三人支付自然人保险费，而不能合理解释第三人与投保人、被保险人和受益人关系的。
    <br/>（十五）与洗钱高风险国家和地区有业务联系的。
    <br/>（十六）没有合理的原因，投保人坚持要求用现金投保、赔偿、给付保险金、退还保险费和保单现金价值以及支付其他资金数额较大的。
    <br/>（十七）保险公司支付赔偿金、给付保险金时，客户要求将资金汇往被保险人、受益人以外的第三人；或者客户要求将退还的保险费和保单现金价值汇往投保人以外的其他人。
    <br/><b>第十四条</b>&nbsp;&nbsp; 除本办法第十一、十二、十三条规定的情形外，金融机构及其工作人员发现其他交易的金额、频率、流向、性质等有异常情形，经分析认为涉嫌洗钱的，应当向中国反洗钱监测分析中心提交可疑交易报告。
    <br/><b>第十五条</b>&nbsp;&nbsp;金融机构对按照本办法向中国反洗钱监测分析中心提交的所有可疑交易报告涉及的交易，应当进行分析、识别，有合理理由认为该交易或者客户与洗钱、恐怖主义活动及其他违法犯罪活动有关的，应当同时报告中国人民银行当地分支机构，并配合中国人民银行的反洗钱行政调查工作。
   <br/> <b>第十六条 </b>&nbsp;&nbsp;对既属于大额交易又属于可疑交易的交易，金融机构应当分别提交大额交易报告和可疑交易报告。
    交易同时符合两项以上大额交易标准的，金融机构应当分别提交大额交易报告。
  <br/> <b> 第十七条</b>&nbsp;&nbsp; 金融机构应当按照本办法所附的大额交易和可疑交易报告要素要求（要素内容见附表），提供真实、完整、准确的交易信息，制作大额交易报告和可疑交易报告的电子文件。具体的报告格式和填报要求由中国人民银行另行规定。
   <br/> <b>第十八条</b>&nbsp;&nbsp; 金融机构违反本办法的，由中国人民银行按照《中华人民共和国反洗钱法》第三十一条、第三十二条的规定予以处罚；区别不同情形，建议中国银行业监督管理委员会、中国证券监督管理委员会或者中国保险监督管理委员会采取下列措施：
    <br/>（一）责令金融机构停业整顿或者吊销其经营许可证。
    <br/>（二）取消金融机构直接负责的董事、高级管理人员和其他直接责任人员的任职资格、禁止其从事有关金融行业工作。
    <br/>（三）责令金融机构对直接负责的董事、高级管理人员和其他直接责任人员给予纪律处分。
    中国人民银行县（市）支行发现金融机构违反本办法的，应报告其上一级分支机构，由该分支机构按照前款规定进行处罚或提出建议。
    <br/><b>第十九条</b>&nbsp;&nbsp; 中国人民银行和其地市中心支行以上分支机构对金融机构违反本办法的行为给予行政处罚的，应当遵守《中国人民银行行政处罚程序规定》的有关规定。
    <br/><b>第二十条</b>&nbsp;&nbsp; 本办法下列用语的含义如下：
   <br/> “短期”系指10个工作日以内，含10个工作日。
   <br/> “长期”系指1年以上。
   <br/> “大量”系指交易金额单笔或者累计低于但接近大额交易标准的。
    <br/>“频繁”系指交易行为营业日每天发生3次以上，或者营业日每天发生持续3天以上。
   <br/> “以上”，包括本数。
    <br/><b>第二十一条</b>&nbsp;&nbsp;本办法自2007年3月1日起施行。2003年1月3日中国人民银行发布的《人民币大额和可疑支付交易报告管理办法》（中国人民银行令[2003]第2号）和《金融机构大额和可疑外汇资金交易报告管理办法》（中国人民银行令[2003]第3号）同时废止。
    <br/>附表：金融机构大额交易和可疑交易报告要素内容 <br/>
    <p align="center"><b>金融机构大额交易和可疑交易报告要素内容</b></p>
    <table align="center" border="1" style="border-color: black" frame="border" width="70%">
    	<tr >
    	<td style="border-color: black;">编号</td><td style="border-color: black;">要素名称</td>
    	<td style="border-color: black;">编号</td><td style="border-color: black;">要素名称</td>
    	</tr>
    	<tr>
    	<td style="border-color: black;">1</td><td style="border-color: black;">金融机构名称</td>
    	<td style="border-color: black;">2</td><td style="border-color: black;">金融机构代码类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">3</td><td style="border-color: black;">金融机构代码</td>
    	<td style="border-color: black;">4</td><td style="border-color: black;">客户名称/姓名</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">5</td><td style="border-color: black;">客户身份证件/证明文件类型</td>
    	<td style="border-color: black;">6</td><td style="border-color: black;">客户身份证件/证明文件号码</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">7</td><td style="border-color: black;">客户国籍</td>
    	<td style="border-color: black;">8</td><td style="border-color: black;">代办人姓名</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">9</td><td style="border-color: black;">代办人身份证件/证明文件类型</td>
    	<td style="border-color: black;">10</td><td style="border-color: black;">代办人身份证件/证明文件号码</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">11</td><td style="border-color: black;">代办人国籍</td>
    	<td style="border-color: black;">12</td><td style="border-color: black;">账户类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">13</td><td style="border-color: black;">账号</td>
    	<td style="border-color: black;">14</td><td style="border-color: black;">交易日期</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">15</td><td style="border-color: black;">业务标示号</td>
    	<td style="border-color: black;">16</td><td style="border-color: black;">交易方式</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">17</td><td style="border-color: black;">资金收付标志</td>
    	<td style="border-color: black;">18</td><td style="border-color: black;">交易去向</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">19</td><td style="border-color: black;">资金用途</td>
    	<td style="border-color: black;">20</td><td style="border-color: black;">币种</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">21</td><td style="border-color: black;">交易金额</td>
    	<td style="border-color: black;">22</td><td style="border-color: black;">对方金融机构名称</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">23</td><td style="border-color: black;">对方金融机构代码类型</td>
    	<td style="border-color: black;">24</td><td style="border-color: black;">对方金融机构代码</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">25</td><td style="border-color: black;">交易对手姓名/名称</td>
    	<td style="border-color: black;">26</td><td style="border-color: black;">交易对手身份证件/证明文件类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">27</td><td style="border-color: black;">交易对手身份证件/证明文件号码</td>
    	<td style="border-color: black;">28</td><td style="border-color: black;">交易对手账户类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">29</td><td style="border-color: black;">交易对手账号</td>
    	<td style="border-color: black;">30</td><td style="border-color: black;">报告日期</td>
    	</tr>
    </table>
<p align="center"><b>银行业金融机构可疑交易报告要素内容列表</b></p>
   <table align="center" border="1" style="border-color: black" frame="border" width="70%">
    	<tr >
    	<td style="border-color: black;">编号</td><td style="border-color: black;">要素名称</td>
    	<td style="border-color: black;">编号</td><td style="border-color: black;">要素名称</td>
    	</tr>
    	<tr>
    	<td style="border-color: black;">1</td><td style="border-color: black;">金融机构名称</td>
    	<td style="border-color: black;">2</td><td style="border-color: black;">金融机构代码类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">3</td><td style="border-color: black;">金融机构代码</td>
    	<td style="border-color: black;">4</td><td style="border-color: black;">客户名称/姓名</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">5</td><td style="border-color: black;">客户身份证件/证明文件类型</td>
    	<td style="border-color: black;">6</td><td style="border-color: black;">客户身份证件/证明文件号码</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">7</td><td style="border-color: black;">客户类型</td>
    	<td style="border-color: black;">8</td><td style="border-color: black;">客户联系方式</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">9</td><td style="border-color: black;">客户国籍</td>
    	<td style="border-color: black;">10</td><td style="border-color: black;">代办人姓名</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">11</td><td style="border-color: black;">代办人身份证件/证明文件类型</td>
    	<td style="border-color: black;">12</td><td style="border-color: black;">代办人身份证件/证明文件号码</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">13</td><td style="border-color: black;">代办人国籍</td>
    	<td style="border-color: black;">14</td><td style="border-color: black;">对私客户的职业</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">15</td><td style="border-color: black;">对公客户的行业类别</td>
    	<td style="border-color: black;">16</td><td style="border-color: black;">对公客户注册资金</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">17</td><td style="border-color: black;">对公客户法定代表人姓名</td>
    	<td style="border-color: black;">18</td><td style="border-color: black;">对公客户法定代表人身份证件类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">19</td><td style="border-color: black;">对公客户法定代表人身份证件号码</td>
    	<td style="border-color: black;">20</td><td style="border-color: black;">账户类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">21</td><td style="border-color: black;">账号</td>
    	<td style="border-color: black;">22</td><td style="border-color: black;">开户时间</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">23</td><td style="border-color: black;">销户时间</td>
    	<td style="border-color: black;">24</td><td style="border-color: black;">交易日期</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">25</td><td style="border-color: black;">交易方式</td>
    	<td style="border-color: black;">26</td><td style="border-color: black;">业务标示号</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">27</td><td style="border-color: black;">资金收付标志</td>
    	<td style="border-color: black;">28</td><td style="border-color: black;">资金来源和用途</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">29</td><td style="border-color: black;">币种</td>
    	<td style="border-color: black;">30</td><td style="border-color: black;">交易金额</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">31</td><td style="border-color: black;">对方金融机构名称</td>
    	<td style="border-color: black;">32</td><td style="border-color: black;">对方金融机构代码类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">33</td><td style="border-color: black;">对方金融机构代码</td>
    	<td style="border-color: black;">34</td><td style="border-color: black;">交易对手身份证件/证明文件类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">35</td><td style="border-color: black;">交易对手姓名/名称</td>
    	<td style="border-color: black;">36</td><td style="border-color: black;">交易对手账户类型</td>
    	</tr>
    		<tr>
    	<td style="border-color: black;">37</td><td style="border-color: black;">交易对手身份证件/证明文件号码</td>
    	<td style="border-color: black;">38</td><td style="border-color: black;">交易对手账号</td>
    	</tr>
    	<tr>
    	<td style="border-color: black;">39</td><td style="border-color: black;">可疑交易特征描述</td>
    	<td style="border-color: black;">40</td><td style="border-color: black;">填报人</td>
    	</tr>
    	<tr>
    	<td style="border-color: black;">41</td><td style="border-color: black;">报告日期</td>
    	<td style="border-color: black;">&nbsp;</td><td style="border-color: black;">&nbsp;</td>
    	</tr>
    </table>
    <p align="center"><b>证券期货业金融机构可疑交易报告要素内容列表</b></p>
     <table align="center" border="1" style="border-color: black" frame="border" width="70%">
<tr> <td style="border-color: black;">编号</td><td style="border-color: black;">要素名称</td><td style="border-color: black;">编号</td><td style="border-color: black;">	要素名称</td></tr>
<tr> <td style="border-color: black;">1	</td><td style="border-color: black;">金融机构名称</td>	<td style="border-color: black;">	2	</td><td style="border-color: black;">金融机构代码类型</td></tr>
<tr> <td style="border-color: black;">3	</td><td style="border-color: black;">金融机构代码</td>	<td style="border-color: black;">	4	</td><td style="border-color: black;">金融机构联系方式</td></tr>
<tr> <td style="border-color: black;">5	</td><td style="border-color: black;">客户名称/姓名</td>	<td style="border-color: black;">	6	</td><td style="border-color: black;">客户身份证件/证明文件类型</td></tr>
<tr> <td style="border-color: black;">7</td><td style="border-color: black;">	客户身份证件/证明文件号码</td>	<td style="border-color: black;">	8	</td><td style="border-color: black;">客户类型</td></tr>
<tr> <td style="border-color: black;">9	</td><td style="border-color: black;">客户联系方式</td>	<td style="border-color: black;">	10	</td><td style="border-color: black;">客户职业或行业</td></tr>
<tr> <td style="border-color: black;">11	</td><td style="border-color: black;">代办人姓名	</td>	<td style="border-color: black;">12</td><td style="border-color: black;">	代办人身份证件/证明文件类型</td></tr>
<tr> <td style="border-color: black;">13	</td><td style="border-color: black;">代办人身份证件/证明文件号码	</td>	<td style="border-color: black;">14</td><td style="border-color: black;">	对公客户主要股东信息</td></tr>
<tr> <td style="border-color: black;">15	</td><td style="border-color: black;">对公客户法定代表人姓名	</td>	<td style="border-color: black;">16	</td><td style="border-color: black;">对公客户法定代表人身份证件号码</td></tr>
<tr> <td style="border-color: black;">17	</td><td style="border-color: black;">对公客户法定代表人身份证件类型</td>	<td style="border-color: black;">	18</td><td style="border-color: black;">	证券/基金/期货账户号码</td></tr>
<tr> <td style="border-color: black;">19	</td><td style="border-color: black;">资金/结算账户号码	</td>	<td style="border-color: black;">20</td><td style="border-color: black;">	资金/结算账户开户行名称</td></tr>
<tr> <td style="border-color: black;">21	</td><td style="border-color: black;">交易日期</td>	<td style="border-color: black;">	22</td><td style="border-color: black;">	交易种类</td></tr>
<tr> <td style="border-color: black;">23	</td><td style="border-color: black;">交易品种代码	</td>	<td style="border-color: black;">24</td><td style="border-color: black;">	业务标示号</td></tr>
<tr> <td style="border-color: black;">25</td><td style="border-color: black;">	币种</td>	<td style="border-color: black;">26</td><td style="border-color: black;">	交易金额</td></tr>
<tr> <td style="border-color: black;">27	</td><td style="border-color: black;">资金进出方向</td>	<td style="border-color: black;">	28</td><td style="border-color: black;">	资金进出方式</td></tr>
<tr> <td style="border-color: black;">29</td><td style="border-color: black;">经办人/交易指示人姓名</td>	<td style="border-color: black;">	30</td><td style="border-color: black;">	经办人/交易指示人身份证件类型</td></tr>
<tr> <td style="border-color: black;">31</td><td style="border-color: black;">	经办人/交易指示人身份证件号码</td>	<td style="border-color: black;">	32	</td><td style="border-color: black;">可疑交易特征描述</td></tr>
<tr> <td style="border-color: black;">33	</td><td style="border-color: black;">填报人</td>	<td style="border-color: black;">	34	</td><td style="border-color: black;">报告日期</td></tr>
</table>
    <p align="center"><b>保险业金融机构可疑交易报告要素内容列表</b></p>
     <table align="center" border="1" style="border-color: black" frame="border" width="70%">
    
 <tr> <td style="border-color: black;">   编号</td><td style="border-color: black;">	要素名称</td><td style="border-color: black;">	编号	</td><td style="border-color: black;">	要素名称</td></tr>
<tr> <td style="border-color: black;">1</td><td style="border-color: black;">	金融机构名称</td><td style="border-color: black;">	2	</td><td style="border-color: black;">	金融机构代码类型</td></tr>
<tr> <td style="border-color: black;">3</td><td style="border-color: black;">	金融机构代码</td><td style="border-color: black;">	4	</td><td style="border-color: black;">	金融机构联系方式</td></tr>
<tr> <td style="border-color: black;">5</td><td style="border-color: black;">业务发生地	</td><td style="border-color: black;">6	</td><td style="border-color: black;">	投保人名称/姓名</td></tr>
<tr> <td style="border-color: black;">7	</td><td style="border-color: black;">投保人身份证件/证明文件类型</td><td style="border-color: black;">	8	</td><td style="border-color: black;">	投保人身份证件/证明文件号码</td></tr>
<tr> <td style="border-color: black;">9	</td><td style="border-color: black;">投保人类型	</td><td style="border-color: black;">10	</td><td style="border-color: black;">	客户联系方式</td></tr>
<tr> <td style="border-color: black;">11</td><td style="border-color: black;">	客户职业或行业	</td><td style="border-color: black;">12	</td><td style="border-color: black;">	被保险人名称/姓名</td></tr>
<tr> <td style="border-color: black;">13	</td><td style="border-color: black;">被保险人身份证件/证明文件类型	</td><td style="border-color: black;">14	</td><td style="border-color: black;">	被保险人身份证件/证明文件号码</td></tr>
<tr> <td style="border-color: black;">15</td><td style="border-color: black;">	投保人与被保险人关系	</td><td style="border-color: black;">16	</td><td style="border-color: black;">	受益人名称/姓名</td></tr>
<tr> <td style="border-color: black;">17	</td><td style="border-color: black;">受益人身份证件/证明文件类型	</td><td style="border-color: black;">18	</td><td style="border-color: black;">	受益人身份证件/证明文件号码</td></tr>
<tr> <td style="border-color: black;">19</td><td style="border-color: black;">	对公客户主要股东信息</td><td style="border-color: black;">	20	</td><td style="border-color: black;">	对公客户法定代表人姓名</td></tr>
<tr> <td style="border-color: black;">21	</td><td style="border-color: black;">对公客户法定代表人身份证件号码</td><td style="border-color: black;">	22	</td><td style="border-color: black;">	对公客户法定代表人身份证件类型</td></tr>
<tr> <td style="border-color: black;">23</td><td style="border-color: black;">	险种名称	</td><td style="border-color: black;">24	</td><td style="border-color: black;">	保险合同号</td></tr>
<tr> <td style="border-color: black;">25	</td><td style="border-color: black;">保险期间	</td><td style="border-color: black;">26	</td><td style="border-color: black;">	保险内容概述</td></tr>
<tr> <td style="border-color: black;">27	</td><td style="border-color: black;">交易日期</td><td style="border-color: black;">	28	</td><td style="border-color: black;">	交易类型</td></tr>
<tr> <td style="border-color: black;">29	</td><td style="border-color: black;">币种	</td><td style="border-color: black;">30	</td><td style="border-color: black;">	交易金额</td></tr>
<tr> <td style="border-color: black;">31</td><td style="border-color: black;">	资金进出方向</td><td style="border-color: black;">	32	</td><td style="border-color: black;">	资金进出方式</td></tr>
<tr> <td style="border-color: black;">33	</td><td style="border-color: black;">资金账户开户行 </td><td style="border-color: black;">	34	</td><td style="border-color: black;">	银行转账资金账号</td></tr>
<tr> <td style="border-color: black;">35	</td><td style="border-color: black;">经办人/交易指示人身份证件类型</td><td style="border-color: black;">	36	</td><td style="border-color: black;">	经办人/交易指示人姓名</td></tr>
<tr> <td style="border-color: black;">37	</td><td style="border-color: black;">可疑交易特征描述	</td><td style="border-color: black;">38	</td><td style="border-color: black;">	经办人/交易指示人身份证件号码</td></tr>
<tr> <td style="border-color: black;">39	</td><td style="border-color: black;">报告日期	</td><td style="border-color: black;">40	</td><td style="border-color: black;">	填报人</td></tr>
   </table> 
 
   
 <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
					 <tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>

                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>