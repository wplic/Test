<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("cat")!=null&&!request.getParameter("cat").equals("")){
		if(sqlInjectValidate.validateSql2(request.getParameter("cat"))){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
%>
<script>
	function SwitchNewsRczp(obj,num,sum,class1,class2)
	{
	 	ClearNewsRczp(obj,sum,class1,class2);
		document.getElementById("tag" + obj + num).className=class1;
	}

	function ClearNewsRczp(name, num,class1,class2)
	{					
		for(i=1;i<= num;i++)
		{										
			var tag=document.getElementById("tag"+ name + i).className;
			if(tag==class1){
				document.getElementById("tag"+ name + i).className=class2; 
			}
		}
	}

	function changeIframe(cat,type,desc){
		if(desc=='noCat'){
			document.getElementById("jobiframe").src='${ctx }/thrPostInfoAction.do?method=getList&cat='+cat+'&type='+type;
		}
		if(desc=='Cat'){
			document.getElementById("jobiframe").src='${ctx }/job/jobContent.jsp?whichCat='+cat;
		}
	}
</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 校园招聘</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" onload="iframeFitHeight(this)"></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>校园招聘</h4></div>
<div class="blank10"></div>
<div class="line28 pl15 w96"><ul class="rrqh">
<li class="rrqh_down red" id="tagtabs01" onmouseover="SwitchNewsRczp('tabs0', 1, 3,'rrqh_down red','font_73');changeIframe(2,1,'noCat');"><a href="javascript:void(0)">总部招聘</a></li>
<li class="font_73" id="tagtabs02" onmouseover="SwitchNewsRczp('tabs0', 2, 3,'rrqh_down red','font_73');changeIframe(2,2,'noCat');"><a href="javascript:void(0)">分支机构招聘</a></li>
<li class="font_73" id="tagtabs03" onmouseover="SwitchNewsRczp('tabs0', 3, 3,'rrqh_down red','font_73');changeIframe('rczp_xyzp',1,'Cat');"><a href="javascript:void(0)">校园招聘情况说明</a></li>
</ul>
</div><div class="blank10"></div>
 <iframe id="jobiframe" name="" src="${ctx }/thrPostInfoAction.do?method=getList&cat=2&type=1" frameborder="0" marginheight="0" marginwidth="0" onload="iframeFitHeight(this)" width="100%" scrolling="no">
 </iframe>
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>