<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserWorkExperienceService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserWorkExperience"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserItemService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserItem"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value="myResume"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/js/validate/prototype.js" type="text/javascript"
		charset="UTF-8"></script>
	<script src="${ctx}/js/validate/effects.js" type="text/javascript"
		charset="UTF-8"></script>
	<script src="${ctx}/js/validate/validation_cn.js" type="text/javascript"
		charset="UTF-8"></script>
<c:if test="${message!=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
<%
	HrUser hrUser = (HrUser)request.getSession().getAttribute("hrUser");
	if(hrUser==null){
%>
	<script>
		alert("登陆超时,请重新登陆");
		window.location="${ctx }/job/index.jsp";
	</script>
<%
	}
 %>
  
 <script>
	function MaxLen(o,n) 
	{    
		//if((event.ctrlKey)&&(event.keyCode==86)) 
		//{ 
		//	alert("a");
	   	//	event.returnValue=false; 
		//}    //屏蔽Ctrl+v    
	     //var txt = document.hrForm.textarea2.value;    
	     if((event.keyCode!=8)&&(event.keyCode!=37)&&(event.keyCode!=38)&&(event.keyCode!=39)&&(event.keyCode!=40)&&(event.keyCode!=46)&&(o.value.length>n-1)) 
		{    
			alert("长度不能超过"+n+"个字！");
			o.value=o.value.substr(0,n);
	        event.keyCode=0;
	        event.returnValue=false;    
	     }    
	}
	function onlyNum()
	{
	  if((window.event.keyCode>95&&window.event.keyCode<106)   
	  ||(window.event.keyCode>47&&window.event.keyCode<59)   
	  ||window.event.keyCode==8   
	  ||window.event.keyCode==46   
	  ||window.event.keyCode==37   
	  ||window.event.keyCode==39)   
	  {   
	  }   
	  else   {   
	  	alert("请您输入0-9之间的数字！");   
	  	window.event.returnValue=false;
	  }
	}
	function showTable(type){
		if(1==type){
			if('none'==document.getElementById("worktable").style.display){
				document.getElementById("worktable").style.display="block";
				document.getElementById("workbutton").value="取 消";
				document.hrForm.input.focus();
			}else{
				document.getElementById("worktable").style.display="none";
				document.getElementById("workbutton").value="新 增";
			}
		}else if(2==type){
			if('none'==document.getElementById("itemtable").style.display){
				document.getElementById("itemtable").style.display="block";
				document.getElementById("itembutton").value="取 消";
				document.hrForm1.input3.focus();
			}else{
				document.getElementById("itemtable").style.display="none";
				document.getElementById("itembutton").value="新 增";
			}
		}
	}
 	function showStr(obj,value)
	{
		if(obj.value=='-1'){
	    	document.getElementById(value).style.display ='block';
	    }else{
	    	document.getElementById(value).style.display ='none';
	    }
	}
	
 	String.prototype.trim = function() {   
	    return this.replace(/^\s+/g,"").replace(/\s+$/g,"");   
	}  
	
 	function onSubWork(){
 		var startDateYeart = document.hrForm.startDateYeart.value.trim();
    	var endDateYeart = document.hrForm.endDateYeart.value.trim();
    	var companyName = document.hrForm.companyName.value.trim();
    	var companyScopet = document.hrForm.companyScopet.value.trim();
    	var workStylet = document.hrForm.workStylet.value.trim();
    	var workDept = document.hrForm.workDept.value.trim();
    	var workPosition = document.hrForm.workPosition.value.trim();
    	var laboraget = document.hrForm.laboraget.value.trim();
    	var workResponse = document.hrForm.workResponse.value.trim();
    	var prover = document.hrForm.prover.value.trim();
    	var prorelation = document.hrForm.prorelation.value.trim();
    	var proverphone = document.hrForm.proverphone.value.trim();
    	var lzyy = document.hrForm.lzyy.value.trim();
    	var mainResult = document.hrForm.mainResult.value.trim();
    	var startDateMonth = document.hrForm.startDateMonth.value.trim();
    	var endDateMonth = document.hrForm.endDateMonth.value.trim();
 		if(startDateMonth<10)
 			startDateMonth = "0"+startDateMonth;
 		if(endDateMonth<10)
 			endDateMonth = "0"+endDateMonth;
    	if(startDateYeart==""){
				alert("开始时间年份不能为空");
 				document.hrForm.startDateYeart.focus();
				return;
		}else if(startDateYeart=="-1"){
			if(''!=document.hrForm.startDateYearStr.value){
				document.hrForm.startDateYear.value=document.hrForm.startDateYearStr.value;
			}else{
				alert("开始时间年份不能为空");
 				document.hrForm.startDateYeart.focus();
				return;
			}
		}else{
			document.hrForm.startDateYear.value=document.hrForm.startDateYeart.value;
		}
		if(''==startDateMonth){
 			alert("开始日期月份不能为空！");
 			document.hrForm.startDateMonth.focus();
 			return;
 		}
 		if(endDateYeart==""){
				alert("结束时间年份不能为空");
 				document.hrForm.endDateYeart.focus();
				return;
		}else if(endDateYeart=="-1"){
			if(''!=document.hrForm.endDateYearStr.value){
				document.hrForm.endDateYear.value=document.hrForm.endDateYearStr.value;
			}else{
				alert("结束时间年份不能为空");
 				document.hrForm.endDateYeart.focus();
				return;
			}
		}else{
			document.hrForm.endDateYear.value=document.hrForm.endDateYeart.value;
		}
 		if(''==endDateMonth){
 			alert("结束日期月份不能为空！");
 			document.hrForm.endDateMonth.focus();
 			return;
 		}
		if(document.hrForm.startDateYear.value>document.hrForm.endDateYear.value){
 			alert("开始日期不能大于结束日期！");
 			return;
 		}else if(document.hrForm.startDateYear.value==document.hrForm.endDateYear.value
 			&& startDateMonth>endDateMonth){
 			alert("开始日期不能大于结束日期！");
 			return;
 		}
		
		if(companyName==""){
			alert("公司名称不能为空");
 			document.hrForm.companyName.focus();
			return;
		}
		if(companyScopet==""){
				alert("公司规模不能为空");
 				document.hrForm.companyScopet.focus();
				return;
		}else if(companyScopet=="-1"){
			if(''!=document.hrForm.companyScopeStr.value){
				document.hrForm.companyScope.value=document.hrForm.companyScopeStr.value;
			}else{
				alert("公司规模不能为空");
 				document.hrForm.companyScopet.focus();
				return;
			}
		}else{
			document.hrForm.companyScope.value=document.hrForm.companyScopet.value;
		}
		if(workStylet==""){
				alert("工作形式不能为空");
 				document.hrForm.workStylet.focus();
				return;
		}else if(workStylet=="-1"){
			if(''!=document.hrForm.workStyleStr.value){
				document.hrForm.workStyle.value=document.hrForm.workStyleStr.value;
			}else{
				alert("工作形式不能为空");
 				document.hrForm.workStylet.focus();
				return;
			}
		}else{
			document.hrForm.workStyle.value=document.hrForm.workStylet.value;
		}
		if(workDept==""){
			alert("所在部门不能为空");
 			document.hrForm.workDept.focus();
			return;
		}
		if(workPosition==""){
			alert("工作岗位不能为空");
 			document.hrForm.workPosition.focus();
			return;
		}
		if(laboraget=="-1"){
			if(''!=document.hrForm.laboraget.value){
				document.hrForm.laborage.value=document.hrForm.laborageStr.value;
			}
		}else{
			document.hrForm.laborage.value=document.hrForm.laboraget.value;
		}
		if(workResponse==""){
			alert("工作职责不能为空");
 			document.hrForm.workResponse.focus();
			return;
		}
		if(workResponse.length>80){
			alert("工作职责不能超过80个长度");
 			document.hrForm.workResponse.focus();
			return;
		}
		document.hrForm.workResponse.value=replaceword(document.hrForm.workResponse.value);
		if(lzyy.length>80){
			alert("离职原因不能超过80个长度");
 			document.hrForm.lzyy.focus();
			return;
		}
		document.hrForm.lzyy.value=replaceword(document.hrForm.lzyy.value);
		if(mainResult.length>120){
			alert("主要业绩不能超过120个长度");
 			document.hrForm.mainResult.focus();
			return;
		}
		document.hrForm.mainResult.value=replaceword(document.hrForm.mainResult.value);
		if(prover==""){
			alert("证明人不能为空");
 			document.hrForm.prover.focus();
			return;
		}
		if(prorelation==""){
			alert("与证明人关系不能为空");
 			document.hrForm.prorelation.focus();
			return;
		}
		if(proverphone==""){
			alert("证明人电话不能为空");
 			document.hrForm.proverphone.focus();
			return;
		}
		//document.hrForm1.action="${ctx }/hrUserAction.do?method=saveHrUserItem&type="+val;
 		document.hrForm.submit();
 	}
 
 	function subToPage(val){
 		var startDateYeart = document.hrForm1.startDateYeart.value.trim();
    	var endDateYeart = document.hrForm1.endDateYeart.value.trim();
 		var itemName = document.hrForm1.itemName.value.trim();
    	var itemOrg = document.hrForm1.itemOrg.value.trim();
    	var roleName = document.hrForm1.roleName.value.trim();
    	var itemIntro = document.hrForm1.itemIntro.value.trim();
    	var prover = document.hrForm1.prover.value.trim();
    	var prorelation = document.hrForm1.prorelation.value.trim();
    	var proverphone = document.hrForm1.proverphone.value.trim();
    	var startDateMonth = document.hrForm1.startDateMonth.value.trim();
    	var endDateMonth = document.hrForm1.endDateMonth.value.trim();
 		if(startDateMonth<10)
 			startDateMonth = "0"+startDateMonth;
 		if(endDateMonth<10)
 			endDateMonth = "0"+endDateMonth;
		if(startDateYeart==""){
				alert("开始时间年份不能为空");
 				document.hrForm1.startDateYeart.focus();
				return;
		}else if(startDateYeart=="-1"){
			if(''!=document.hrForm1.startDateYearStr1.value){
				document.hrForm1.startDateYear.value=document.hrForm1.startDateYearStr1.value;
			}else{
				alert("开始时间年份不能为空");
 				document.hrForm1.startDateYeart.focus();
				return;
			}
		}else{
			document.hrForm1.startDateYear.value=document.hrForm1.startDateYeart.value;
		}
		if(''==startDateMonth){
 			alert("开始日期月份不能为空！");
 			document.hrForm1.startDateMonth.focus();
 			return;
 		}
		if(endDateYeart==""){
				alert("结束时间不能为空");
 				document.hrForm1.endDateYeart.focus();
				return;
		}else if(endDateYeart=="-1"){
			if(''!=document.hrForm1.endDateYearStr1.value){
				document.hrForm1.endDateYear.value=document.hrForm1.endDateYearStr1.value;
			}else{
				alert("结束时间不能为空");
 				document.hrForm1.endDateYeart.focus();
				return;
			}
		}else{
			document.hrForm1.endDateYear.value=document.hrForm1.endDateYeart.value;
		}
 		if(''==endDateMonth){
 			alert("结束日期月份不能为空！");
 			document.hrForm1.endDateMonth.focus();
 			return;
 		}
		if(document.hrForm1.startDateYear.value>document.hrForm1.endDateYear.value){
 			alert("开始日期不能大于结束日期！");
 			return;
 		}else if(document.hrForm1.startDateYear.value==document.hrForm1.endDateYear.value
 			&& startDateMonth>endDateMonth){
 			alert("开始日期不能大于结束日期！");
 			return;
 		}
		if(itemName==""){
			alert("项目/活动名称不能为空");
 			document.hrForm1.itemName.focus();
			return;
		}
		if(itemOrg==""){
			alert("项目/活动发起机构不能为空");
 			document.hrForm1.itemOrg.focus();
			return;
		}
		if(roleName==""){
			alert("担任角色不能为空");
 			document.hrForm1.roleName.focus();
			return;
		}
		if(itemIntro==""){
			alert("项目/活动简述不能为空");
 			document.hrForm1.itemIntro.focus();
			return;
		}
		document.hrForm1.itemIntro.value=replaceword(document.hrForm1.itemIntro.value);
		if(itemIntro.length>120){
			alert("项目/活动简述不超过120个长度");
 			document.hrForm1.itemIntro.focus();
			return;
		}
		if(prover==""){
			alert("证明人不能为空");
 			document.hrForm1.prover.focus();
			return;
		}
		if(prorelation==""){
			alert("与证明人关系不能为空");
 			document.hrForm1.prorelation.focus();
			return;
		}
		if(proverphone==""){
			alert("证明人电话不能为空");
 			document.hrForm1.proverphone.focus();
			return;
		}
		document.hrForm1.action="${ctx }/hrUserAction.do?method=saveHrUserItem&type="+val;
 		document.hrForm1.submit();
 	}
 	function deleteWorkExp(val){
 		if(confirm("确定删除吗？")){
 			document.hrForm.action="${ctx }/hrUserAction.do?method=deleteWorkExpById&eduId="+val;
 			document.hrForm.submit();
 		}
 	}
 	function deleteItemExp(val){
 		if(confirm("确定删除吗？")){
 			document.hrForm.action="${ctx }/hrUserAction.do?method=deleteItemExpById&eduId="+val;
 			document.hrForm.submit();
 		}
 	}
 	function gotonextpage(){
 		if(document.getElementById("workbutton").value=="取 消" || document.getElementById("itembutton").value=="取 消"){
 			if(confirm("新增的内容还没有提交，确定不提交保存而进入到下一步吗？")){
 				window.location='${ctx }/job/otherExp.jsp?nav=myResume';
 			}else{
 				return;
 			}
 		}else{
 			window.location='${ctx }/job/otherExp.jsp?nav=myResume';
 		}
 	}
	function replaceword(o){
		o = o.replace(/\r\n/g,"(r)");
		o = o.replace(/\r/g,"(r)");
		o = o.replace(/\n/g,"(n)");
		o = o.replace(/where/g,"(where)");
		o = o.replace(/and/g,"(and)");
		o = o.replace(/or/g,"(or)");
		return o;
	}
 </script>
</head>

<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	HrUserWorkExperienceService service = (HrUserWorkExperienceService)ctx.getBean("hrUserWorkExperienceService");
	HrUserItemService itemService = (HrUserItemService)ctx.getBean("hrUserItemService");
	
	HrUserWorkExperience basicInfo = null;
	HrUserItem userItem = null;
	
	List list = new ArrayList();
	List itemList = new ArrayList();
	
	if(hrUser!=null){
		list = service.getAllWorkList(hrUser.getId());
		itemList = itemService.getAllItemList(hrUser.getId());
	}
	pageContext.setAttribute("list",list);
	pageContext.setAttribute("itemList",itemList);
	
	String eduId=request.getParameter("id");
	String itemId=request.getParameter("itemsId");
	
	if(StringUtils.isNotEmpty(eduId))
		basicInfo = service.getBeanById(Long.parseLong(eduId));
	pageContext.setAttribute("basicInfo",basicInfo);
	
	if(StringUtils.isNotEmpty(itemId))
		userItem = itemService.getBeanById(Long.parseLong(itemId));
	pageContext.setAttribute("userItem",userItem);
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 简历投递系统</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/application_lmenu.jsp">
			<jsp:param value="work" name="nav1"/>
		</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>我的简历</h4></div>
<p class="inden25 lh30 cuxuxianb"><span class="red">填写提示：</span><span class="red">*</span>所指明的是必填内容（按照时间）由近到远的顺序填写</p>
<div class="clearfloat"></div>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30" width="70%"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">工作/实习经验</strong></td>
    <td height="30"><input type="button" class="but01" onclick="showTable(1)" value="新 增" id="workbutton"/></td>
  </tr>
</table>
<c:forEach items="${list }" var="bean">
<table width="97%" border="0" align="center" class="lh30">

  <tr>
    <td width="18%">【${bean.startDateYear }/${bean.startDateMonth }-${bean.endDateYear }/${bean.endDateMonth }】</td>
    <td width="20%">&nbsp;</td>
    <td colspan="2">${bean.companyName }/${bean.companyScope }</td>
    <td width="18%"><span  class="bold">工作形式：</span>${bean.workStyle }</td>
    <td width="15%" align="right">
    	<input name="" type="button" class="but01" value="修 改" onclick="window.location.href='${ctx }/job/workExp.jsp?id=${bean.id }'"/>
    	<input name="" type="button" class="but01" value="删 除" onclick="deleteWorkExp('${bean.id }')"/>
    </td>
  </tr>
  <tr>
    <td width="18%" align="right"><span  class="bold">所在部门：</span></td>
    <td width="20%">${bean.workDept }</td>
    <td width="10%" align="right"><span  class="bold">工作岗位：</span></td>
    <td>${bean.workPosition }</td>
    <td width="18%"><span  class="bold">职位月薪（税前）：</span></td>
    <td width="15%">${bean.laborage }</td>
  </tr>
  <tr>
    <td align="right"><span  class="bold">工作职责：</span></td>
    <td colspan="5" style="line-height:20px">${bean.workResponse }</td>
    </tr>
  <tr>
    <td align="right"><span  class="bold">离职原因：</span></td>
    <td colspan="5" style="line-height:20px">${bean.lzyy }</td>
    </tr>
  <tr <c:if test="${bean.mainResult eq null }">style='display:none'</c:if>>
    <td align="right"><span  class="bold">主要业绩：</span></td>
    <td colspan="5" style="line-height:20px">${bean.mainResult }</td>
    </tr>
  <tr <c:if test="${bean.mainResult eq null }">style='display:none'</c:if>>
    <td align="right"><span  class="bold">汇报对象：</span></td>
    <td>${bean.reportto }</td>
    <td align="right"><span  class="bold">下属人数：</span></td>
    <td>${bean.underling }</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span  class="bold">证明人信息：</span></td>
    <td colspan="5">${bean.prover }/${bean.prorelation }/${bean.proverphone }</td>
    </tr>
  <tr>
    <td height="15" colspan="6" class="cuxuxian"></td>
  </tr>
</table>
</c:forEach>
<form action="${ctx }/hrUserAction.do?method=saveHrUserWork&nav=<%=nav %>" method="post"
		name="hrForm">
	<input type="hidden" name="eduId" value="${basicInfo.id }"/>
<table width="97%" border="0" align="center" class="lh30" id="worktable" style='display:<%=null==basicInfo?"none":"block"%>'>

  <tr>
    <td width="20%" align="right"><span class="red">*</span>开始日期：</td>
    <td width="30%">
    	<input type="hidden" name="startDateYear" value="${basicInfo.startDateYear }"/>
	    <select name="startDateYeart" id="startDateYeart" onchange="showStr(this,'startDateYearStr')" >
			<option value="">请选择...</option>
	      <%for(int i=1980;i<=2020;i++){ %>
	    	 <option value="<%=i %>" <%if(basicInfo!=null && (i+"").equals(basicInfo.getStartDateYear())){out.println("selected");} %>><%=i %></option>
	    	 <%} %>
	    	 <option value="-1">其他</option>
	    </select>年
		<select name="startDateMonth" id="startDateMonth" >
			<option value="">请选择...</option>
		  <%for(int i=1;i<=12;i++){ %>
		    	 <option value="<%=i %>" <%if(basicInfo!=null && (i+"").equals(basicInfo.getStartDateMonth())){out.println("selected");} %>><%=i %></option>
		    	 <%} %>
		</select>月
    	<span style="display:none" id="startDateYearStr">
    		请填写相应的内容：<br/><input name="startDateYearStr" type="text" class="w66" value="${basicInfo.startDateYear }" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.startDateYeart.value==''){
	    			document.getElementById("startDateYearStr").style.display='block';
	    			document.hrForm.startDateYeart.value = '-1';
	    		}
	    	</script>
	    <%}%>
	</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>结束日期：</td>
    <td>
    	<input type="hidden" name="endDateYear" value="${basicInfo.endDateYear }"/>
    	<select name="endDateYeart" id="endDateYeart" onchange="showStr(this,'endDateYearStr')" >
			<option value="">请选择...</option>
       <%for(int i=1980;i<=2020;i++){ %>
    	 <option value="<%=i %>" <%if(basicInfo!=null && (i+"").equals(basicInfo.getEndDateYear())){out.println("selected");} %>><%=i %></option>
    	 <%} %>
	    	 <option value="-1">其他</option>
    	</select>年
	  	<select name="endDateMonth" id="endDateMonth" >
			<option value="">请选择...</option>
	     <%for(int i=1;i<=12;i++){ %>
	    	 <option value="<%=i %>" <%if(basicInfo!=null && (i+"").equals(basicInfo.getEndDateMonth())){out.println("selected");} %>><%=i %></option>
	    	 <%} %>
	  	</select>月
    	<span style="display:none" id="endDateYearStr">
    		请填写相应的内容：<br/><input name="endDateYearStr" type="text" class="w66" value="${basicInfo.endDateYear }" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.endDateYeart.value==''){
	    			document.getElementById("endDateYearStr").style.display='block';
	    			document.hrForm.endDateYeart.value = '-1';
	    		}
	    	</script>
	    <%}%>
  	</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>公司名称：</td>
    <td><input name="companyName" type="text" class="w123" id="companyName" value="${basicInfo.companyName }" maxlength="20"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>公司规模：</td>
    <td>
    	<input type="hidden" name="companyScope" value="${basicInfo.companyScope }" maxlength="10"/>
    	<select name="companyScopet" id="companyScopet" class="w123" onchange="showStr(this,'companyScopeStr')">
			<option value="">请选择...</option>
	    	 <option value="50人以下" <c:if test="${basicInfo.companyScope eq '50人以下' }">selected</c:if>>50人以下</option>
	    	 <option value="50-100人" <c:if test="${basicInfo.companyScope eq '50-100人' }">selected</c:if>>50-100人</option>
	    	 <option value="100-200人" <c:if test="${basicInfo.companyScope eq '100-200人' }">selected</c:if>>100-200人</option>
	    	 <option value="200-500人" <c:if test="${basicInfo.companyScope eq '200-500人' }">selected</c:if>>200-500人</option>
	    	 <option value="500-1000人" <c:if test="${basicInfo.companyScope eq '500-1000人' }">selected</c:if>>500-1000人</option>
	    	 <option value="1000人以上" <c:if test="${basicInfo.companyScope eq '1000人以上' }">selected</c:if>>1000人以上</option>
	    	 <option value="-1" <c:if test="${basicInfo.companyScope eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="companyScopeStr">
    		请填写相应的内容：<br/><input name="companyScopeStr" type="text" class="w123" value="${basicInfo.companyScope }" maxlength="50"/><span class="red">(50字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.companyScopet.value==''){
	    			document.getElementById("companyScopeStr").style.display='block';
	    			document.hrForm.companyScopet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>工作形式：</td>
    <td>
    	<input type="hidden" name="workStyle" value="${basicInfo.workStyle }" maxlength="20"/>
    	<select name="workStylet" id="workStylet" class="w123" onchange="showStr(this,'workStyleStr')">
			<option value="">请选择...</option>
	     <option value="全职" <c:if test="${basicInfo.workStyle eq '全职' }">selected</c:if>>全职</option>
	     <option value="实习" <c:if test="${basicInfo.workStyle eq '实习' }">selected</c:if>>实习</option>
	     <option value="兼职" <c:if test="${basicInfo.workStyle eq '兼职' }">selected</c:if>>兼职</option>
	     <option value="-1" <c:if test="${basicInfo.workStyle eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="workStyleStr">
    		请填写相应的内容：<br/><input name="workStyleStr" type="text" class="w123" value="${basicInfo.workStyle }" maxlength="20"/><span class="red">(20字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.workStylet.value==''){
	    			document.getElementById("workStyleStr").style.display='block';
	    			document.hrForm.workStylet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>所在部门：</td>
    <td><input name="workDept" type="text" class="w123" id="workDept" value="${basicInfo.workDept }" maxlength="20"/></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>工作岗位：</td>
    <td><input name="workPosition" type="text" class="w123" id="workPosition" value="${basicInfo.workPosition }" maxlength="20"/></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right">职位月薪（税前）：</td>
    <td>
    	<input name="laborage" type="hidden" class="w123" id="laborage" value="${basicInfo.laborage }"/>
    	<select name="laboraget" id="laboraget" class="w123" onchange="showStr(this,'laborageStr')">
			<option value="">请选择...</option>
	     <option value="无" <c:if test="${basicInfo.laborage eq '无' }">selected</c:if>>无</option>
	     <option value="2000以下" <c:if test="${basicInfo.laborage eq '2000以下' }">selected</c:if>>2000以下</option>
	     <option value="2000-4000" <c:if test="${basicInfo.laborage eq '2000-4000' }">selected</c:if>>2000-4000</option>
	     <option value="4000-6000" <c:if test="${basicInfo.laborage eq '4000-6000' }">selected</c:if>>4000-6000</option>
	     <option value="6000-8000" <c:if test="${basicInfo.laborage eq '6000-8000' }">selected</c:if>>6000-8000</option>
	     <option value="8000-10000" <c:if test="${basicInfo.laborage eq '8000-10000' }">selected</c:if>>8000-10000</option>
	     <option value="10000-15000" <c:if test="${basicInfo.laborage eq '10000-15000' }">selected</c:if>>10000-15000</option>
	     <option value="15000-20000" <c:if test="${basicInfo.laborage eq '15000-20000' }">selected</c:if>>15000-20000</option>
	     <option value="20000-40000" <c:if test="${basicInfo.laborage eq '20000-40000' }">selected</c:if>>20000-40000</option>
	     <option value="40000-60000" <c:if test="${basicInfo.laborage eq '40000-60000' }">selected</c:if>>40000-60000</option>
	     <option value="60000-80000" <c:if test="${basicInfo.laborage eq '60000-80000' }">selected</c:if>>60000-80000</option>
	     <option value="80000-100000" <c:if test="${basicInfo.laborage eq '80000-100000' }">selected</c:if>>80000-100000</option>
	     <option value="100000以上" <c:if test="${basicInfo.laborage eq '100000以上' }">selected</c:if>>100000以上</option>
	     <option value="-1" <c:if test="${basicInfo.laborage eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="laborageStr">
    		请填写相应的内容：<br/><input name="laborageStr" type="text" class="w123" value="${basicInfo.laborage }" maxlength="20"/><span class="red">(20字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.laboraget.value==''){
	    			document.getElementById("laborageStr").style.display='block';
	    			document.hrForm.laboraget.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>工作职责：</td>
    <td colspan="2"><textarea name="workResponse" id="workResponse"  class="max-length-80" cols="50" rows="4" onKeyDown="MaxLen(this,80)">${basicInfo.workResponse }</textarea>
      <span class="red">(80字以内)</span></td>
    </tr>
  <tr>
    <td align="right">离职原因：</td>
    <td colspan="2"><textarea name="lzyy" id="lzyy"  class="max-length-80" cols="50" rows="4" onKeyDown="MaxLen(this,80)">${basicInfo.lzyy }</textarea>
      <span class="red">(80字以内)</span></td>
    </tr>
  <tr>
    <td colspan="3"><strong class="bold">高级人才附加信息</strong>（针对高端人才）</td>
    </tr>
  <tr>
    <td align="right">主要业绩：</td>
    <td colspan="2"><textarea name="mainResult" id="mainResult" cols="50" class="max-length-120" rows="4" onKeyDown="MaxLen(this,120)">${basicInfo.mainResult }</textarea>
      <span class="red">(120字以内)</span></td>
    </tr>
  <tr>
    <td align="right">汇报对象：</td>
    <td><input name="reportto" type="text" class="w123" id="reportto" value="${basicInfo.reportto }" maxlength="20"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">下属人数：</td>
    <td><input name="underling" type="text" class="w123" maxlength="5" id="underling" value="${basicInfo.underling }" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>证明人：</td>
    <td><input name="prover" type="text" class="w123" id="prover" maxlength="8" value="${basicInfo.prover }"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>与证明人关系：</td>
    <td><input name="prorelation" type="text" class="w123" id="prorelation" maxlength="8" value="${basicInfo.prorelation }"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>证明人电话：</td>
    <td><input name="proverphone" type="text" class="w123" id="proverphone" maxlength="13" value="${basicInfo.proverphone }"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;&nbsp;
		<input name="input" type="button" class="bu08" value="保 存" onclick="onSubWork()"/>&nbsp;&nbsp;
	</td>
	<td>&nbsp;</td>
    </tr>
  <tr>
    <td height="15" colspan="3" class="cuxuxian"></td>
    </tr>
</table>
</form>
<div class="blank10"></div>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30" width="70%"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">项目/活动经验</strong></td>
    <td height="30">
    <%if(null==itemList || (null!=itemList && itemList.size()<5)){%>
    	<input type="button" class="but01" onclick="showTable(2)" value="新 增" id="itembutton"/></td>
    <%}else{%>
    	<input type="hidden" class="but01" onclick="showTable(2)" value="新 增" id="itembutton"/></td>
    <%} %>
  </tr>
</table>
<c:forEach items="${itemList }" var="itemBean">
<table width="97%" border="0" align="center" class="lh30">
  <tr>
    <td width="18%">【${itemBean.startDateYear }/${itemBean.startDateMonth }-${itemBean.endDateYear }/${itemBean.endDateMonth }】</td>
    <td width="30%">&nbsp;</td>
    <td colspan="2">${itemBean.itemName }</td>
    <td width="15%" align="right">
    	<input name="input2" type="button" class="but01" value="修 改" onclick="window.location.href='${ctx }/job/workExp.jsp?itemsId=${itemBean.id }'"/>
    	<input name="input4" type="button" class="but01" value="删 除" onclick="deleteItemExp('${itemBean.id }')"/>
    </td>
  </tr>
  <tr>
    <td width="18%" align="right"><span  class="bold">项目/活动发起机构：</span></td>
    <td width="30%">${itemBean.itemOrg }</td>
    <td width="10%" align="right"><span  class="bold">担任角色：</span></td>
    <td>${itemBean.roleName }</td>
    <td width="15%">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span  class="bold">项目/活动简述：</span></td>
    <td colspan="4" style="line-height:20px">${itemBean.itemIntro }</td>
  </tr>
  <tr>
    <td align="right"><span  class="bold">证明人信息：</span></td>
    <td colspan="4">${itemBean.prover }/${itemBean.prorelation }/${itemBean.proverphone }</td>
  </tr>
  <tr>
    <td height="15" colspan="5" class="cuxuxian"></td>
  </tr>
</table>
</c:forEach>
<form action="${ctx }/hrUserAction.do?method=saveHrUserItem&nav=<%=nav %>" method="post" 
		name="hrForm1">
	<input type="hidden" name="itemId" value="${userItem.id }"/>
<table width="97%" border="0" align="center" class="lh30" id="itemtable" style='display:<%=null==userItem?"none":"block"%>'>

  <tr>
    <td width="20%" align="right"><span class="red">*</span>开始日期：</td>
    <td width="30%">
    	<input type="hidden" name="startDateYear" value="${userItem.startDateYear }"/>
	    <select name="startDateYeart" id="startDateYeart" onchange="showStr(this,'startDateYearStr1')" >
			<option value="">请选择...</option>
	      <%for(int i=1980;i<=2020;i++){ %>
	    	 <option value="<%=i %>" <%if(userItem!=null && (i+"").equals(userItem.getStartDateYear())){out.println("selected");} %>><%=i %></option>
	    	 <%} %>
	    	 <option value="-1">其他</option>
	    </select>年
		<select name="startDateMonth" id="startDateMonth" >
			<option value="">请选择...</option>
		  <%for(int i=1;i<=12;i++){ %>
		    <option value="<%=i %>" <%if(userItem!=null && (i+"").equals(userItem.getStartDateMonth())){out.println("selected");} %>><%=i %></option>
		    	 <%} %>
		</select>月
    	<span style="display:none" id="startDateYearStr1">
    		请填写相应的内容：<br/><input name="startDateYearStr1" type="text" class="w66" value="${userItem.startDateYear }" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.startDateYeart.value==''){
	    			document.getElementById("startDateYearStr1").style.display='block';
	    			document.hrForm.startDateYeart.value = '-1';
	    		}
	    	</script>
	    <%}%>
	</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>结束日期：</td>
    <td>
    	<input type="hidden" name="endDateYear" value="${userItem.endDateYear }"/>
	    <select name="endDateYeart" id="endDateYeart"  onchange="showStr(this,'endDateYearStr1')">
			<option value="">请选择...</option>
	       <%for(int i=1980;i<=2020;i++){ %>
	    	 <option value="<%=i %>" <%if(userItem!=null && (i+"").equals(userItem.getEndDateYear())){out.println("selected");} %>><%=i %></option>
	    	 <%} %>
	    	 <option value="-1">其他</option>
	    </select>年
	  	<select name="endDateMonth" id="endDateMonth" >
			<option value="">请选择...</option>
	     <%for(int i=1;i<=12;i++){ %>
	    	 <option value="<%=i %>" <%if(userItem!=null && (i+"").equals(userItem.getEndDateMonth())){out.println("selected");} %>><%=i %></option>
	    	 <%} %>
	  	</select>月
    	<span style="display:none" id="endDateYearStr1">
    		请填写相应的内容：<br/><input name="endDateYearStr1" type="text" class="w66" value="${userItem.endDateYear }" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.endDateYeart.value==''){
	    			document.getElementById("endDateYearStr1").style.display='block';
	    			document.hrForm.endDateYeart.value = '-1';
	    		}
	    	</script>
	    <%}%>
  	</td>
    <td>&nbsp;</td>
    </tr>
    
    
  <tr>
    <td align="right"><span class="red">*</span>项目/活动名称：</td>
    <td><input name="itemName" type="text" class="w123" id="itemName" value="${userItem.itemName }" maxlength="20"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>项目/活动发起机构：</td>
    <td><input name="itemOrg" type="text" class="w123" id="itemOrg" value="${userItem.itemOrg }" maxlength="20"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>担任角色：</td>
    <td><input name="roleName" type="text" class="w123" id="roleName" value="${userItem.roleName }" maxlength="20"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>项目/活动简述：</td>
    <td colspan="2"><textarea name="itemIntro" id="itemIntro" cols="50" rows="4" onKeyDown="MaxLen(this,120)">${userItem.itemIntro }</textarea>
      <span class="red">(120字以内)</span></td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>证明人：</td>
    <td><input name="prover" type="text" class="w123" id="prover" maxlength="8" value="${userItem.prover }"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>与证明人关系：</td>
    <td><input name="prorelation" type="text" class="w123" id="prorelation" maxlength="8" value="${userItem.prorelation }"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>证明人电话：</td>
    <td><input name="proverphone" type="text" class="w123" id="proverphone" maxlength="13" value="${userItem.proverphone }"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;&nbsp;
		<input name="input3" type="button" class="bu08" value="保 存" onclick="subToPage('cur');"/>
		&nbsp;&nbsp;
	</td>
	<td>&nbsp;</td>
  </tr>
  <tr>
    <td height="15" colspan="3" class="cuxuxian"></td>
  </tr>
</table>
</form>
<table width="97%" border="0" align="center" class="lh30">
	<tr>
		<td>
	      	<input name="button2" type="button" class="bu08" id="button2" value="返回上一步" onclick="window.location.href='${ctx }/job/educationExp.jsp'" />
			&nbsp;&nbsp;
			<input name="button3" type="button" class="bu08" id="button3" value="下一步" onclick="gotonextpage();"/>&nbsp;&nbsp;
		</td>
	</tr>
</table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>