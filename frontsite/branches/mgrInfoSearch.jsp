<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/golden/golden.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tab_cj{ border:1px solid #ece9d8;}
</style>
</head>

<body  onload="MM_preloadImages('/pic/golden/but_lczx2.jpg')">
<jsp:include page="/share/top.jsp?nav=grgf&nav1=mgrInfo" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/branches/index.html">分支机构</a> &gt; 业务人员执业资格信息查询</div>
  <p align="center"><img src="/pic/golden/banner.jpg" /></p>
  <div class="blank10"></div>
    <div class="blank10"></div>
  <div class="goldenp1">

<table cellspacing="0" border="1" class="tab_cj" cellpadding="0" width="100%">
 <tr>
  		<td class="xl64" width="100%" align="center">
  			 <form action="${contextPath }/mgrInfoAction.do?method=getMgrInfo" method="post" id="mgrForm" name="mgrForm" onSubmit="return check1();">
  				<table cellpadding="0" cellspacing="0" border="0">
  						<tr>
  								<td colspan="2" class="font14 goldenzi lh28">
  								    业务人员执业资格查询
  								</td>
  						</tr>
  						<tr>
  								<td align="right">员工姓名：</td>
  								<td><input type="text" size="10" class="input108" name="ygxm" id="ygxm" /> </td>
  						</tr>
  						<tr>
  								<td align="right">执业证书编号：</td>
  								<td><input type="text" size="10" class="input108" name="zsbh" id="zsbh" /> </td>
  						</tr>
  						<tr>
  								<td align="right"> 员工编号：</td>
  								<td><input type="text" size="10" class="input108" name="ygbh" id="ygbh" /> </td>
  						</tr>
  						<tr>
  								<td colspan="2" align="center">
  								 <input type="image" src="${ctx}/pic/wsyyt/but_cx1.jpg" />
  								</td>
  						</tr>
  						<tr>
  							<td colspan="2" height="10"></td>
  						</tr>
  				</table>
  			</form>	
  		</td>
  </tr>
  
  <tr>
    <td class="xl64" width="100%">
    <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">
    广发证券业务人员经纪业务营销活动规范
   </div>
    </td>
  </tr>
 
  <tr>
  		<td>
  		<div class="p10 lh22">
  		  <p>一、许可行为 <br />
  			1.	向客户介绍证券市场和广发证券的基本情况。 <br />
			2.	向客户介绍证券投资的基本知识及开户、交易、资金存取等业务流程。 <br />
			3.	向客户介绍与证券交易有关的法律、法规、证监会规定、自律规则和广发证券的有关规定。 <br />
			4.	向客户传递由广发证券统一提供的研究报告及与证券投资有关的信息。 <br />
			5.	向客户充分揭示证券市场风险，履行投资者教育义务。 <br />
			6.	广发证券股份有限公司规定客户经理可以从事的其他活动。 <br />
			</p></div>
			<div class="p10 lh22">
  		  <p>
			二、禁止行为 <br />
			1.	禁止代理或擅自替客户办理账户开立、注销、转移，证券认购、交易（含各种形式的全权委托交易） <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或者资金存取、划转、查询等事宜。违反规定泄漏所掌握的客户信息。 <br /> 
			2.	禁止提供、传播虚假或者误导客户的信息，或者诱使客户进行不必要的证券买卖。  <br />
			3.	禁止采取贬低竞争对手、进入竞争对手营业场所劝导客户等不正当手段招揽客户。  <br />
			4.	禁止泄露客户的商业秘密或者个人隐私。  <br />
			5.	禁止为客户之间的融资提供中介、担保或者其他便利。  <br />
			6.	禁止委托他人代理其开展证券经纪业务营销活动。  <br />
			7.	禁止损害客户利益或者扰乱市场秩序的其他行为。  <br />
			8.	禁止私自与客户签订各种形式的合同（含口头协议）。  <br />
			9.	禁止代理客户签字。  <br />
			10.	禁止在营业网点拦截主动开户的客户。  <br />
			11.	禁止给客户提供股票交易的肯定性意见。  <br />
			12.	禁止采取非道德手段争抢客户（含返佣等手段）。  <br />
			13.	公司规定的其它禁止行为。  <br />
		 </p>
		
		</div>
  		</td>
  </tr>
 
</table>
 
  </div>
    <div class="blank10"></div>

</div>
<script src="/js/imge.js"></script>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
<SCRIPT LANGUAGE="JavaScript">
     function check1(){
	   var ygxm=document.getElementById("ygxm").value;
	   var zsbh=document.getElementById("zsbh").value;
	   var ygbh=document.getElementById("ygbh").value;  
	   if(ygxm==""&&zsbh==""&&ygbh=="")
	   {
	     alert("请输入任何一个查询条件！");
	     return false;
	   }
     }  
  </script>
</html>