<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/prototype.js" type="text/javascript" charset="UTF-8"></script>

<c:if test="${message != null }">
	<script>
		alert('${message}');
	</script>
</c:if>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 服务内容</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=khfw&nav1=fwnr" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  <div class="comtit1">
    <h4>服务内容</h4>
  </div>
  <div class="blank10"></div>
    <table width="95%" align="center" class="lh28">
      <tr>
        <td>　　秉承“客户至上、专业服务”的理念，我们认为“运作规范、透明高效”是服务客户最重要的原则，而提供深入周到、交流互动的个性化服务则是提高客户满意度及忠诚度的有效方式，因此我们将长期致力于不断提高客户服务工作的质量和效率，利用我们的系统资源优势更好地满足客户需求。</td>
      </tr>
      
    </table>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">我们的客户服务项目：</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td>1、 基本信息咨询服务：按照国家规定或合同约定进行定期的信息披露和客户账户的信息查询。<br /></td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td>2、 专项信息咨询服务：对客户需求调查、研究的基础上提供的服务项目，包括：<br /></td>
      </tr>
      <tr>
		<td><ul>
			<li><span class="font_st font_8c">（1） </span>提供专业理财咨询刊物；
			<li><span class="font_st font_8c">（2） </span>重要研究成果发布；
			<li><span class="font_st font_8c">（3） </span>投资培训交流会议；
			<li><span class="font_st font_8c">（4） </span>专题研讨会及巡回路演。
		</ul></td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td>3、个性化服务：<br /></td>
      </tr>
      <tr>
		<td><ul>
			<li><span class="font_st font_8c">（1） </span>根据客户提出的需求，提供个性化专业服务；
			<li><span class="font_st font_8c">（2） </span>投资经理对账户的投资进行专业化管理，并随时与客户联系互动；
			<li><span class="font_st font_8c">（3） </span>提供第三方专业金融投资信息，研究报告；
			<li><span class="font_st font_8c">（4） </span>提供定期举办投资理财说明会、财经专题报告及专户理财客户专场交流会等相关活动，共同调研上市公司。
		</ul></td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td>4、我们的服务手段：媒体公布、刊物传递、会议、通讯工具、上门沟通。<br /></td>
      </tr>
    </table>
    <div class="blank10"></div>
	<p align="center"><img src="${contextPath }/pic/assetManage/zcgl_khfw.jpg" /></p>
  </div>
  <!--中侧sied结束--> 
   
  <!--右侧sied开始-->
  <div class="w210 fright">
 <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <jsp:include page="lc3h.jsp" /> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</html>