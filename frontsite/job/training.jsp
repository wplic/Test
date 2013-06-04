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
 <div class="training">
 <div class="buttons">
	 <a href="training.jsp" class="positive">
	  培训发展
    </a>
	
	 <a href="culture.jsp" class="regular">
        
      企业文化
    </a>

    <a href="activity.jsp" class="regular">
      
      员工活动
    </a>  
	</div>
	 <img style="padding-left:85px;" src="images/training_01.png"/>
      <p>　　公司具有人才密集、知识密集、技术密集的鲜明特点，通过组织形式多样、内容丰富的培训活动，有力地促进了公司员工在各自岗位上发挥自己的专业优势，将知识优势转化为公司发展的竞争力。<br />
        <br />
        <strong>网上学习系统</strong><br />
        　　学习管理系统（LMS）包含在线学习、培训管理、资源中心、考试中心和同步课堂等功能，已建立370余门、近900个学时的菜单式在线课程，另有员工上传的各类学习资料2700余份，有效地支持员工随时、随地学习各项业务和管理知识、提升职业素质。 <br />
        <br />
        <strong>境外培训</strong><br />
        　　为了增加公司的市场竞争力，培养全球视野、国际化的金融人才，公司连续多年投资境外培训，通过深入考察北美资本市场，学习和借鉴成熟资本市场同类型业务的发展经验。 <br />
        <br />
        　　广发证券的中加培训项目已经连续开展了五期，超过500名员工参加了相关培训。参加培训的学员通过学习和借鉴北美成熟资本市场先进的管理经验和业务实践，结合中国市场实际环境和工作岗位实践，为公司的业务和管理发展献计献策，较好地促进了公司的业务发展。 </p>
     
        <iframe allowTransparency="true" src="training/flash.html" frameBorder="0" width="628" height="309" scrolling="no"></iframe>
      
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>