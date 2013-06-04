<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
.cybnav{ background:#fff9f1; border:1px solid #f3cfa3; padding:19px; text-align:center}
.blank15{ height:15px; overflow:hidden}
.red{ font-size:12px; color:#cd0303;}
.bold{ font-weight:bold}
.txtlist{ font-size:12px; padding:2px 8px; line-height:22px}

</style>
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
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; 创业板开户指引</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="investorCyb_lmenu.jsp" />
      <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
    	<div class="cybnav"> <a href="#cyb01"><img src="${contextPath }/pic/investorEdu/ctab01.jpg" border="0" /></a><a href="#cyb02"><img src="${contextPath }/pic/investorEdu/ctab02.jpg"  border="0" /></a><a href="#cyb03"><img src="${contextPath }/pic/investorEdu/ctab03.jpg" border="0" /></a><a href="#cyb04"><img src="${contextPath }/pic/investorEdu/ctab04.jpg" border="0" /></a>
        </div>
    </td>
  </tr>
</table>
<div class="blank15"></div>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="red bold" height="25" id="cyb01">&nbsp;&nbsp;一、投资者要求</td>
  </tr>
  <tr>
    <td><img src="${contextPath }/pic/investorEdu/titline.jpg" /></td>
  </tr>
  <tr>
    <td class="txtlist">1、具有两年以上（含两年）交易经验的投资者申请参与创业板交易，需与证券公司现场签署《创业板市场投资风险揭示书》两个交易日后开通交易权限；<br />
2、未具备两年交易经验的投资者如申请参与创业板交易，在现场签署风险揭示书的同时，还应就其自愿承担市场风险抄录“特别声明”，五个交易日后才能开通交易权限。</td>
  </tr>
</table>
<div class="blank15"></div>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="red bold" height="25" id="cyb02">&nbsp;&nbsp;二、开户流程图</td>
  </tr>
  <tr>
    <td><img src="${contextPath }/pic/investorEdu/titline.jpg" /></td>
  </tr>
  <tr>
    <td align="center"><img src="${contextPath }/pic/investorEdu/cyb01.gif"  /></td>
  </tr>
  <tr>
    <td align="center"><img src="${contextPath }/pic/investorEdu/cyb02.gif"  /></td>
  </tr>
</table>
<div class="blank15"></div>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="red bold" height="25" id="cyb03">&nbsp;&nbsp;三、创业板投资者风险承受能力评估</td>
  </tr>
  <tr>
    <td><img src="${contextPath }/pic/investorEdu/titline.jpg" /></td>
  </tr>
  <tr>
    <td class="txtlist">
    <table width="80%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="36%">
           <a href="http://119.145.72.232/ECMMS/comjsp/ecmms/questionary/CustFillInfo.do" target="_blank"> 
            
            证券投资者调查问卷（创业板）</a></td>
            <td width="64%"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
</table>
<div class="blank15"></div>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="red bold" height="25" id="cyb04">&nbsp;&nbsp;四、风险揭示书</td>
  </tr>
  <tr>
    <td><img src="${contextPath }/pic/investorEdu/titline.jpg" /></td>
  </tr>
  <tr>
    <td class="txtlist"><table width="80%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="36%"><a href="${contextPath }/cms/showDocumentFile.jsp?id=246279 ">创业板风险揭示书.doc</a></td>
        <td width="64%"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div></div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</body>
</html>