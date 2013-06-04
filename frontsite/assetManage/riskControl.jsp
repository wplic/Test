<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="${contextPath }/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a> - <a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 风险控制</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=ywgk&nav1=fxkz" />
     <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  <div class="comtit1">
    <h4>风险控制</h4>
  </div>
  <div class="blank10"></div>
    <table width="95%" align="center" class="lh28">
      <tr>
        <td>　　广发证券客户资产管理业务遵循“风险收益匹配，全业务覆盖、全过程监控，风险管理和业务拓展的对立统一”的风险控制理念，为有效防范和化解风险，在建立了严格防火墙的基础上，搭建了科学、严谨、流畅的风险控制系统。</td>
      </tr>
      <tr>
        <td align="center">
        	<img src="${contextPath }/pic/assetManage/fxkz01.jpg" />
   		  <div class="blank5"></div>
			<p align="center" class="font13 bold font_73">广发证券资产管理业务风险控制体系图示</p>
    		<div class="blank5"></div>     
       </td>
      </tr>
    </table>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">一、独立的风险控制组织架构</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td>设风险控制委员会、风险管理部和监管员，采用相互牵制、高效的原则进行岗位设置。 <br /></td>
      </tr>
    </table>
    <div class="blank10"></div>
<p align="center"><img src="${contextPath }/pic/assetManage/fxkz02.jpg" /></p>
<div class="blank10"></div>
<p align="center" class="font13 bold font_73">广发证券资产管理业务风险控制组织架构图</p>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">二、制度和流程<br /></td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28">
      <tr>
        <td>　　结合国家相关法律法规，在对各项业务和管理进行严密分析、论证和模拟运行的基础上，建立了严谨、严密的制度和明晰、顺畅的流程；</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">三、严格的防火墙<br /></td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td>　　为切实防范利益输送行为，保障客户利益，资产管理业务与公司其他业务在经营场地、人员配置、帐户资金管理等方面严格分离，投资决策和投资运作独立进行。<br /></td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">四、先进的风险控制系统、技术和方法<br /></td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28">
      <tr>
        <td>　　引入投资管理信息系统，并在此基础上进行风险控制程序的开发，能实时进行风险监控、识别和预警。<br /></td>
      </tr>
    </table>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <div class="w210 fright" style="vertical-align:top">
	<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" onload="frameFitSelfHeight('leftlogin')"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <jsp:include page="lc3h.jsp" /> 
  
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath }/commons/msbottom.jsp" />
</body>
</html>