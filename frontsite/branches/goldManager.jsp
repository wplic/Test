<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 产品与服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="productsServices_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">广发金管家服务业务</div>
    <div class="blank10"></div>
   
    <div class="kline">
      <div class="qiebg">
      <div class="p10 lh22">
        <p class="inden25 red bold font14">个性服务 自主决策 传道解惑 专业策划 轻松赚钱 相伴成功！让投资成为快乐的事！！</p><br />
        <p>　　 <span class="bold">广发金管家投资顾问服务包含的服务内容——不仅仅是推荐一两只股票</span><br />
          　　根据您的投资偏好、风险承受和期望收益，为您制订个性化资产配置和投资计划，并全程跟踪和评估您的投资绩效，及时调整投资误差和减小投资风险。<br />
          <br />
          　　 <span class="bold"> 广发金管家投资顾问服务的具体方式——不仅仅是一份投资建议书</span><br />
          　　您的客户经理向您提交投资配置建议书后，仅仅代表服务的开始。您在其后的投资过程中，客户经理和广发专业团队会一直相伴在您的左右，您可以随时获得广发专业团队提供的一系列的专业化指导和专业化投资服务。<br />
          <br />
          　　 <span class="bold"> 广发金管家投资顾问服务特色——不仅仅是专业理财</span><br />
          　　在广发专业团队专家指导、专业服务过程中，您并非完全被动接受，区别于委托理财，深度化的咨询服务使您在投资过程中仍然拥有完全自主的投资决策权，您有充裕的时间去思考为您制作的个性化专业投资方案。<br />
          <br />
          　　  <span class="bold">广发金管家投资顾问服务的目标——不仅仅是使您获得投资收益</span><br />
          　　依托广发证券强大的专业资源和风控制度，协助您制定合适的投资计划，达到预期收益目标和回避市场风险是我们服务的基本目标。更高的目标是在服务中不断提高您自己的投资管理水平，让您自己在证券市场的波动中享受到把握市场节奏的乐趣，追求财富增值不停步，使证券投资成为轻松快乐的事情。<br />
          
          　　
        <p class=" red">　　有了广发证券金管家投资顾问服务，您的证券投资可以如此轻松<br />
          　　——不必再为选择什么行业、什么股票、什么品种来投资而大伤脑筋<br />
          　　——不必每天面对无序而海量的各种新闻、传闻、小道消息而无所适从<br />
          　　——不必看着时时波动，无法捉摸的证券价格而举棋不定<br />
          　　——不必担心自己市场经验不足，专业知识不够而错失市场机会</p>
        <br />
          　　本业务的服务对象主要面对非职业个人投资者和非专业投资者（企业），着重对具有持续注资能力、需要专业机构提供投资顾问服务的个人与具有闲置资金但没有专业投资人员的企业机构。为了达成服务的有效性，投资顾问服务的对象客户应符合如下的基本条件：<br />
          　　1、客户在营业部的托管资产（包括证券市值+可用资金）不低于人民币500万元；<br />
          　　2、客户能够并且愿意与营业部客户经理进行充分沟通，并且有可靠的联系方式。<br />
          　　3、客户对风险收益的对应关系具有明确的理解。<br />
          　　4、股市存在较大的风险，风险盈亏自负应具有充分了解。</p>
        <p>　　------欢迎您的加盟，详情请咨询广发证券各营业部</a>        </p>
        <p><br />
        </p>
      </div>
    </div>
    </div>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>