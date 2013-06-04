<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
    <% 
    	String category1="rczq_tfzgf";  
    	 String content= "";
    %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页</a> -<a href="${contextPath }/job/index.html">人才招聘</a> - 腾飞在广发</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
        <iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" height="198"></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="culture">
	<div class="buttons">
	 <a href="training.jsp" class="regular">
	  培训发展
    </a>
	
	 <a href="culture.jsp" class="positive">
        
      企业文化
    </a>

    <a href="activity.jsp" class="regular">
      
      员工活动
    </a>  
	</div>
	
      <p>　　广发证券是一家具有鲜明企业价值导向、富有凝聚力的公司。<br />
        多年以来，企业文化得到了很好的积淀和传承，并渗透在公司经营管理的各个环节之中，为公司实现发展战略目标、进行科学管理、广泛吸纳人才、不断创新进步提供了重要的精神动力和智力支持。也正是基于此种文化，凝成了一个求索进取、勇担责任且充满激情活力的团队。 <br />
        <br />
         　　公司的企业文化，是扎根证券行业十七年，在激烈的市场竞争条件下，将资本市场理论探索同资本市场实践相融汇，在长期的经营活动和管理实践中形成的具有自身特色的企业文化。</p>
      <ul>
        <img src="images/tb_01.png"/>
        <li>
          <h4>核心价值观</h4>
          <h3>知识图强 求实奉献</h3>
          <p>
		  广发证劵推崇以人为本、以知识为动力的企业发展理念；脚踏实地、回馈社会、做有责任心的企业公民、是广发证劵的不懈追求。
</p>
        </li>
      </ul>
      <ul>
        <img src="images/tb_02.png"/>
        <li>
          <h4>发展战略</h4>
          <h3>中国一流的证券金融集团</h3>
          <p>
		  我们将依托强大的人才优势和客户基础，锐意进取、大胆创新，逐步成长为涵盖证券、基金、期货、股权投资等领域的中国一流证券金融集团。
		  </p>
        </li>
      </ul>
      <ul>
        <img src="images/tb_03.png"/>
        <li>
          <h4>企业精神</h4>
          <h3>团结、开拓、求实、高效</h3>
          <p>强化员工的整体协作能力与团队精神，是公司可持续发展的核心所在;不断开拓、提升员工自身的金融创新能力、
		  并为客户提供高效、贴心的服务、是推动企业稳健前行的源源动力。</p>
        </li>
      </ul>
      <ul>
        <img src="images/tb_04.png"/>
        <li>
          <h4>行为规范</h4>
          <h3>合法经营、公平竞争、规范管理、客户至上、市场导向、追求卓越</h3>
          <p>
		  坚守法规法则,坚持公平竞争,规范化管理的企业,方能构成企业发展的基石。
		  唯有深谙把握市场脉搏,以客户需求为先、追求卓越的企业,才能与客户共享一路成长的喜悦。
		  </p>
        </li>
      </ul>
      <ul>
        <img src="images/tb_05.png"/>
        <li>
          <h4>人才观</h4>
          <h3>依靠一流人才创一流证劵公司</h3>
          <p>
		  人才是广发证劵最有价值的财富,我们希望员工"既做理论的探索者,又做资本市场的实践者;
		  既在制度保护下成为物质财富的拥有者,更要成为高尚品德的秉承者。
		  </p>
        </li>
      </ul>
      <ul>
        <img src="images/tb_06.png"/>
        <li>
          <h4>人才实现机制</h4>
          <h3>人才发现、人才培育、人才激励、人才约束</h3>
          <p>
		  优异的人才实现机制,是员工及企业同步成长的养料。通过敏锐的人才发现,以及广发证劵卓越
		  的人才培育过程,配合明晰的人才激励及约束机制,方能最大化发挥人才优势,助力客户实现财富成长的宏愿。
		  
		  </p>
        </li>
      </ul>
      <ul>
        <img src="images/tb_07.png"/>
        <li>
          <h4>人才评价标准</h4>
          <h3>
		  高层人员：廉洁、团结、实干
		  中层人员：准是忠诚、拚搏、自律
		  基层人员：奋发、进取、敬业
		  </h3>
          <p>
		  进取心是我们评价基层人员的关键所在,对中层人员我们更看重团队建设及管理能力,高层人员
		  则需具备深刻的洞察力,以及对策略的制定和实施能力,唯有如此,广发证劵方能不断提升自身水准,
		  更具核心竞争力。
		  </p>
        </li>
      </ul>
         </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>