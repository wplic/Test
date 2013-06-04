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
        	<p class="textTitle1" align="center"><b><font size="2px">金融机构报告涉嫌恐怖融资的可疑交易管理办法</font></b></p>
  <p class="textTitle2" align="center">中国人民银行令〔2007〕第1号</p>
   
   <div class="newstextArea" align="left">
   <p class="newstextAreatop">
   </p>
   <b>
  根据《中华人民共和国反洗钱法》、《中华人民共和国中国人民银行法》等法律规定，中国人民银行制定了《金融机构报告涉嫌恐怖融资的可疑交易管理办法》，
  经2007年6月8日第13次行长办公会议通过，现予发布，自发布之日起施行。
         <div align="right">    <p align="right">行长：周小川&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
　　　　　　 二○○七年六月十一日</p></div>

   </b><br/>
   <div>

  </div>
    <p class="newstextAreabottom"></p></div>

   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div class="lh24">
  <p align="center"> <b style="font-size: 15px">金融机构报告涉嫌恐怖融资的可疑交易管理办法</b></p><br/>
<br/><b>第一条 </b>&nbsp;&nbsp;为监测恐怖融资行为，防止利用金融机构进行恐怖融资，规范金融机构报告涉嫌恐怖融资可疑交易的行为，根据《中华人民共和国反洗钱法》、《中华人民共和国中国人民银行法》等有关法律、行政法规，制定本办法。 
    <br/><b>第二条</b>&nbsp;&nbsp; 本办法所称的恐怖融资是指下列行为： 
    <br/>（一）恐怖组织、恐怖分子募集、占有、使用资金或者其他形式财产。 
    <br/>（二）以资金或者其他形式财产协助恐怖组织、恐怖分子以及恐怖主义、恐怖活动犯罪。 
    <br/>（三）为恐怖主义和实施恐怖活动犯罪占有、使用以及募集资金或者其他形式财产。 
   <br/> （四）为恐怖组织、恐怖分子占有、使用以及募集资金或者其他形式财产。 
    <br/><b>第三条</b>&nbsp;&nbsp;本办法适用于在中华人民共和国境内依法设立的下列金融机构： 
    <br/>（一）政策性银行、商业银行、农村合作银行、城市信用合作社、农村信用合作社。 
    <br/>（二）证券公司、期货公司、基金管理公司。 
    <br/>（三）保险公司、保险资产管理公司。 
    <br/>（四）信托投资公司、金融资产管理公司、财务公司、金融租赁公司、汽车金融公司、货币经纪公司。 
    <br/>（五）中国人民银行确定并公布的其他金融机构。 
    从事汇兑业务、支付清算业务、基金销售业务和保险经纪业务的机构报告涉嫌恐怖融资的可疑交易适用本办法。 
    <br/><b>第四条</b>&nbsp;&nbsp; 中国人民银行及其分支机构对金融机构报告涉嫌恐怖融资的可疑交易的情况进行监督、检查。 
    <br/><b>第五条</b>&nbsp;&nbsp; 中国人民银行设立中国反洗钱监测分析中心负责接收、分析涉嫌恐怖融资的可疑交易报告。 
    中国反洗钱监测分析中心发现金融机构报送的涉嫌恐怖融资的可疑交易报告有要素不全或者存在错误的，可以向提交报告的金融机构发出补正通知，金融机构应当在接到补正通知的5个工作日内补正。 
   <br/> <b>第六条</b>&nbsp;&nbsp; 履行反恐怖融资义务的金融机构及其工作人员依法提交可疑交易报告受法律保护。 
   <br/> <b>第七条</b>&nbsp;&nbsp; 金融机构应当将涉嫌恐怖融资的可疑交易报告报其总部，由金融机构总部或者由总部指定的一个机构，在相关情况发生后的10个工作日内以电子方式报送中国反洗钱监测分析中心。没有总部或者无法通过总部及总部指定的机构向中国反洗钱监测分析中心报送可疑交易报告的，其报告方式由中国人民银行另行确定。 
  <br/>  <b>第八条 </b>&nbsp;&nbsp;金融机构怀疑客户、资金、交易或者试图进行的交易与恐怖主义、恐怖活动犯罪以及恐怖组织、恐怖分子、从事恐怖融资活动的人相关联的，无论所涉及资金金额或者财产价值大小，都应当提交涉嫌恐怖融资的可疑交易报告。提交可疑交易报告的具体情形包括但不限于以下种类： 
    <br/>（一）怀疑客户为恐怖组织、恐怖分子以及恐怖活动犯罪募集或者企图募集资金或者其他形式财产的。 
    <br/>（二）怀疑客户为恐怖组织、恐怖分子、从事恐怖融资活动的人以及恐怖活动犯罪提供或者企图提供资金或者其他形式财产的。 
    <br/>（三）怀疑客户为恐怖组织、恐怖分子保存、管理、运作或者企图保存、管理、运作资金或者其他形式财产的。 
    <br/>（四）怀疑客户或者其交易对手是恐怖组织、恐怖分子以及从事恐怖融资活动人员的。 
    <br/>（五）怀疑资金或者其他形式财产来源于或者将来源于恐怖组织、恐怖分子、从事恐怖融资活动人员的。 
    <br/>（六）怀疑资金或者其他形式财产用于或者将用于恐怖融资、恐怖活动犯罪及其他恐怖主义目的，或者怀疑资金或者其他形式财产被恐怖组织、恐怖分子、从事恐怖融资活动人员使用的。 
    <br/>（七）金融机构及其工作人员有合理理由怀疑资金、其他形式财产、交易、客户与恐怖主义、恐怖活动犯罪、恐怖组织、恐怖分子、从事恐怖融资活动人员有关的其他情形。 
    <br/><b>第九条</b>&nbsp;&nbsp; 金融机构发现或者有合理理由怀疑客户或者其交易对手与下列名单相关的，应当立即向中国反洗钱监测分析中心和中国人民银行当地分支机构提交可疑交易报告，并且按相关主管部门的要求依法采取措施。 
   <br/> （一）国务院有关部门、机构发布的恐怖组织、恐怖分子名单。 
    <br/>（二）司法机关发布的恐怖组织、恐怖分子名单。 
    <br/>（三）联合国安理会决议中所列的恐怖组织、恐怖分子名单。 
    <br/>（四）中国人民银行要求关注的其他恐怖组织、恐怖分子嫌疑人名单。 
    法律、行政法规对上述名单的监控另有规定的，遵守其规定。 
    <br/><b>第十条</b>&nbsp;&nbsp; 金融机构按照本办法报告可疑交易，具体的报告要素及报告格式、填报要求参照《金融机构大额交易和可疑交易报告管理办法》（中国人民银行令[2006]第2号发布）及相关规定执行。 
    <br/><b>第十一条</b>&nbsp;&nbsp; 金融机构违反本办法的，由中国人民银行按照《中华人民共和国反洗钱法》第三十一条、第三十二条的规定予以处罚；区别不同情形，向中国银行业监督管理委员会、中国证券监督管理委员会或者中国保险监督管理委员会建议采取下列措施： 
    <br/>（一）责令金融机构停业整顿或者吊销其经营许可证。 
    <br/>（二）取消金融机构直接负责的董事、高级管理人员和其他直接责任人员的任职资格、禁止其从事有关金融行业的工作。 
    <br/>（三）责令金融机构对直接负责的董事、高级管理人员和其他直接责任人员给予纪律处分。 
    中国人民银行县（市）支行发现金融机构违反本办法的，应当报告上一级中国人民银行分支机构，由上一级分支机构按照前款规定进行处罚或者提出建议。 
    <br/><b>第十二条</b>&nbsp;&nbsp; 中国人民银行及其地市中心支行以上分支机构对金融机构违反本办法的行为给予行政处罚的，应当遵守《中国人民银行行政处罚程序规定》（中国人民银行令[2001]第3号发布）的有关规定。 
    <br/><b>第十三条 </b>&nbsp;&nbsp;金融机构开展预防和打击恐怖融资工作时，履行建立健全内部控制制度、客户身份识别、保存客户身份资料和交易记录、保密以及其他相关义务，参照反洗钱相关规定执行。 
    <br/><b>第十四条</b>&nbsp;&nbsp; 本办法自发布之日起施行。


  
 
   
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