<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserEduExperienceService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserEduExperience"/>
<jsp:directive.page import="com.cssweb.common.dictionary.service.DictionaryService"/>
<jsp:directive.page import="com.cssweb.common.dictionary.pojo.Dictionary"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value="apply"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />

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
	function showTable(){
		if('none'==document.getElementById("edutable").style.display){
			document.getElementById("edutable").style.display="block";
			document.getElementById("addbutton").value="取 消";
		}else{
			document.getElementById("edutable").style.display="none";
			document.getElementById("addbutton").value="新 增";
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
 
 	function subToPage(val){
 		document.hrForm.action="${ctx }/hrUserAction.do?method=saveHrUserEdu&type="+val;
 		var startDateYeart = document.hrForm.startDateYeart.value.trim();
 		var startDateMonth = document.hrForm.startDateMonth.value.trim();
 		var endDateYeart = document.hrForm.endDateYeart.value.trim();
 		var endDateMonth = document.hrForm.endDateMonth.value.trim();
 		var schoolt = document.hrForm.schoolt.value.trim();
 		var spename = document.hrForm.spename.value.trim();
 		var searchpos = document.hrForm.searchpos.value.trim();
 		var studystylet = document.hrForm.studystylet.value.trim(); 		
 		var xuelit = document.hrForm.xuelit.value.trim();
 		var degreet = document.hrForm.degreet.value.trim(); 		
 		var classordert = document.hrForm.classordert.value.trim();
 		var prover = document.hrForm.prover.value.trim();
 		var prorelation = document.hrForm.prorelation.value.trim();
 		var proverphone = document.hrForm.proverphone.value.trim();
 		if(startDateMonth<10)
 			startDateMonth = "0"+startDateMonth;
 		if(endDateMonth<10)
 			endDateMonth = "0"+endDateMonth;
 		if(startDateYeart==""){
				alert("开始日期年份不能为空");
 				document.hrForm.startDateYeart.focus();
				return;
 		}else if(startDateYeart=="-1"){
			if(''!=document.hrForm.startDateYearStr.value){
				document.hrForm.startDateYear.value=document.hrForm.startDateYearStr.value;
			}else{
				alert("开始日期年份不能为空");
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
				alert("结束日期年份不能为空");
 				document.hrForm.endDateYeart.focus();
				return;
 		}else if(endDateYeart=="-1"){
			if(''!=document.hrForm.endDateYearStr.value){
				document.hrForm.endDateYear.value=document.hrForm.endDateYearStr.value;
			}else{
				alert("结束日期年份不能为空");
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
 			alert("a");
 			alert("开始日期不能大于结束日期！");
 			return;
 		}else if(document.hrForm.startDateYear.value==document.hrForm.endDateYear.value
 			&& startDateMonth>endDateMonth){
 			alert("开始日期不能大于结束日期！");
 			return;
 		}
 		if(schoolt==""){
				alert("学校不能为空");
 				document.hrForm.schoolt.focus();
				return;
 		}else if(schoolt=="-1"){
 			if(''!=document.hrForm.schoolStr.value){
 				document.hrForm.school.value=document.hrForm.schoolStr.value;
 			}else{
				alert("学校不能为空");
 				document.hrForm.schoolt.focus();
				return;
 			}
 		}else{
 			document.hrForm.school.value=document.hrForm.schoolt.value;
 		}
 		if(spename==""){
 			alert("专业名称不能为空");
 			document.hrForm.spename.focus();
 			return;
 		}
 		if(searchpos==""){
 			alert("研究方向不能为空");
 			document.hrForm.searchpos.focus();
 			return;
 		}
 		if(studystylet==""){
				alert("学习方式不能为空");
 				document.hrForm.studystylet.focus();
				return;
 		}else if(studystylet=="-1"){
 			if(''!=document.hrForm.studystyleStr.value){
 				document.hrForm.studystyle.value=document.hrForm.studystyleStr.value;
 			}else{
				alert("学习方式不能为空");
 				document.hrForm.studystylet.focus();
				return;
 			}
 		}else{
 			document.hrForm.studystyle.value=document.hrForm.studystylet.value;
 		}
 		if(xuelit==""){
				alert("学历不能为空");
 				document.hrForm.xuelit.focus();
				return;
 		}else if(xuelit=="-1"){
 			if(''!=document.hrForm.xueliStr.value){
 				document.hrForm.xueli.value=document.hrForm.xueliStr.value;
 			}else{
				alert("学历不能为空");
 				document.hrForm.xuelit.focus();
				return;
 			}
 		}else{
 			document.hrForm.xueli.value=document.hrForm.xuelit.value;
 		}
 		if(degreet==""){
				alert("学位不能为空");
 				document.hrForm.degreet.focus();
				return;
 		}else if(degreet=="-1"){
 			if(''!=document.hrForm.degreeStr.value){
 				document.hrForm.degree.value=document.hrForm.degreeStr.value;
 			}else{
				alert("学位不能为空");
 				document.hrForm.degreet.focus();
				return;
 			}
 		}else{
 			document.hrForm.degree.value=document.hrForm.degreet.value;
 		}
 		if(classordert==""){
				alert("班级排名不能为空");
 				document.hrForm.classordert.focus();
				return;
 		}else if(classordert=="-1"){
 			if(''!=document.hrForm.classorderStr.value){
 				document.hrForm.classorder.value=document.hrForm.classorderStr.value;
 			}else{
				alert("班级排名不能为空");
 				document.hrForm.classordert.focus();
				return;
 			}
 		}else{
 			document.hrForm.classorder.value=document.hrForm.classordert.value;
 		}
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
 		document.hrForm.submit();
 	}
 	function deleteEduExp(val){
 		if(confirm("确定删除吗？")){
 			document.hrForm.action="${ctx }/hrUserAction.do?method=deleteEduExpById&eduId="+val;
 			document.hrForm.submit();
 		}
 	}
 	function gotonextpage(){
 		if(document.getElementById("addbutton").value=="取 消"){
 			if(confirm("新增的内容还没有提交，确定不提交保存而进入到下一步吗？")){
 				window.location='${ctx }/job/workExp.jsp?nav=myResume';
 			}else{
 				return;
 			}
 		}else{
 			window.location='${ctx }/job/workExp.jsp?nav=myResume';
 		}
 	}
 </script>
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	HrUserEduExperienceService service = (HrUserEduExperienceService)ctx.getBean("hrUserEduExperienceService");
	HrUserEduExperience basicInfo = null;
	List list = new ArrayList();
	if(hrUser!=null){
		list = service.getAllEduList(hrUser.getId());
	}
	pageContext.setAttribute("list",list);
	String eduId=request.getParameter("id");
	if(StringUtils.isNotEmpty(eduId))
		basicInfo = service.getBeanById(Long.parseLong(eduId));
	pageContext.setAttribute("basicInfo",basicInfo);
	
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	List universityList =	dictionaryService.getDictionaryByParentKeyCode("university");
	List specialtyList =	dictionaryService.getDictionaryByParentKeyCode("specialty");
%>
<body>

<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 简历投递系统</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/application_lmenu.jsp?nav1=edu" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>我的简历</h4></div>
<p class="inden25 lh30 cuxuxianb"><span class="red">填写提示：</span><span class="red">*</span>所指明的是必填内容（按照时间）由近到远的顺序填写</p>
<div class="clearfloat"></div>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30" width="70%"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">教育经历</strong></td>
    <td height="30"><input type="button" class="but01" onclick="showTable()" value="新 增" id="addbutton"/></td>
  </tr>
</table>
<table width="99%" border="0" align="center">  

	<c:forEach items="${list }" var="bean">
		<tr>
		    <td width="18%">【${bean.startDateYear }/${bean.startDateMonth }-${bean.endDateYear }/${bean.endDateMonth }】</td>
		    <td width="22%">${bean.school }/${bean.spename }</td>
		    <td width="20%">${bean.studystyle }/${bean.xueli }/${bean.degree }</td>
		    <td width="10%">${bean.classorder }</td>
		    <td>${bean.prover }/${bean.prorelation }/${bean.proverphone }</td>
		    <td width="5%" align="right">
		    	<input type="button" class="but01" value="修 改" onclick="window.location.href='${ctx }/job/educationExp.jsp?id=${bean.id }'"/>
		    	<input type="button" class="but01" value="删 除" onclick="deleteEduExp('${bean.id }')"/>
		    </td>
		  </tr>  
		  <tr>
    		<td height="15" colspan="6" class="cuxuxian"></td>
		</tr>
	</c:forEach>
  
</table>
<form action="${ctx }/hrUserAction.do?method=saveHrUserEdu&nav=<%=nav %>" method="post" 
		name="hrForm">
<input type="hidden" name="eduId" value="${basicInfo.id }"/>
<table width="97%" border="0" align="center" class="lh30" id="edutable" style='display:<%=null==basicInfo?"none":"block"%>'>
  <tr>
    <td width="15%" align="right"><span class="red">*</span>开始日期：</td>
    <td width="30%"><input type="hidden" name="startDateYear" value="${basicInfo.startDateYear }"/>
	    <select name="startDateYeart" id="startDateYeart" onchange="showStr(this,'startDateYearStr')">
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
    <td><input type="hidden" name="endDateYear" value="${basicInfo.endDateYear }"/>
	    <select name="endDateYeart" id="endDateYeart"  onchange="showStr(this,'endDateYearStr')">
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
    <td align="right"><span class="red">*</span>学校：</td>
    <td><input name="school" type="hidden" value="${basicInfo.school }"/>
    	<select name="schoolt" id="schoolt" class="required" onchange="showStr(this,'schoolStr')">
			<option value="">请选择...</option>
    	<%
    	String school = "";
    	if(null!=basicInfo){
    		school = basicInfo.getSchool();
	    	if(null==school){
	    		school = "";
	    	}
    	}
    	if(null!=universityList && universityList.size()>0){
    		for(int i=0;i<universityList.size();i++){
    			Dictionary dic = (Dictionary)universityList.get(i);%>
	      		<option value="<%=dic.getKeyName()%>" <%=school.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.school eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="schoolStr">
    		请填写相应的内容：<br/><input name="schoolStr" type="text" class="w123" value="${basicInfo.school }" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.schoolt.value==''){
	    			document.getElementById("schoolStr").style.display='block';
	    			document.hrForm.schoolt.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>专业名称：</td>
    <td colspan="2"><input name="spename" type="text" class="w123" id="spename" value="${basicInfo.spename }" maxlength="8"/>
    	<span class="font_73">请务必填写专业全称，若没有则写无</span>
    </td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>研究方向：</td>
    <td colspan="2"><input name="searchpos" type="text" class="w123" id="searchpos" value="${basicInfo.searchpos }" maxlength="50"/>
    	<span class="font_73">请务必填写研究方向全称，若没有则写无</span>
    </td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>学习方式：</td>
    <td><input name="studystyle" type="hidden" value="${basicInfo.studystyle }" maxlength="10"/>
    	<select name="studystylet" id="studystylet" class="w123" onchange="showStr(this,'studystyleStr')">
			<option value="">请选择...</option>
    	 <option value="全日制" <c:if test="${basicInfo.studystyle eq '全日制' }">selected</c:if>>全日制</option>
    	 <option value="非全日制" <c:if test="${basicInfo.studystyle eq '非全日制' }">selected</c:if>>非全日制</option>
    	 <option value="-1" <c:if test="${basicInfo.studystyle eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="studystyleStr">
    		请填写相应的内容：<br/><input name="studystyleStr" type="text" class="w123" value="${basicInfo.studystyle }" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.studystylet.value==''){
	    			document.getElementById("studystyleStr").style.display='block';
	    			document.hrForm.studystylet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>学历：</td>
    <td><input name="xueli" type="hidden" value="${basicInfo.xueli }" maxlength="10"/>
	    <select name="xuelit" id="xuelit" class="required" onchange="showStr(this,'xueliStr')">
			<option value="">请选择...</option>
		      <option value="无" <c:if test="${basicInfo.xueli eq '无' }">selected</c:if>>无</option>
		      <option value="高中" <c:if test="${basicInfo.xueli eq '高中' }">selected</c:if>>高中</option>
		      <option value="中专" <c:if test="${basicInfo.xueli eq '中专' }">selected</c:if>>中专</option>
		      <option value="大专" <c:if test="${basicInfo.xueli eq '大专' }">selected</c:if>>大专</option>
		      <option value="本科" <c:if test="${basicInfo.xueli eq '本科' }">selected</c:if>>本科</option>
		      <option value="研究生" <c:if test="${basicInfo.xueli eq '研究生' }">selected</c:if>>研究生</option>
		      <option value="-1" <c:if test="${basicInfo.xueli eq '-1' }">selected</c:if>>其他</option>
	    </select>
    	<span style="display:none" id="xueliStr">
    		请填写相应的内容：<br/><input name="xueliStr" type="text" class="w123" value="${basicInfo.xueli }" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.xuelit.value==''){
	    			document.getElementById("xueliStr").style.display='block';
	    			document.hrForm.xuelit.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>学位：</td>
    <td><input name="degree" type="hidden" value="${basicInfo.degree }" maxlength="10"/>
    	<select name="degreet" id="degreet" class="required" onchange="showStr(this,'degreeStr')">
			<option value="">请选择...</option>
      		<option value="无" <c:if test="${basicInfo.degree eq '无' }">selected</c:if>>无</option>
      		<option value="学士" <c:if test="${basicInfo.degree eq '学士' }">selected</c:if>>学士</option>
      		<option value="双学士" <c:if test="${basicInfo.degree eq '双学士' }">selected</c:if>>双学士</option>
      		<option value="硕士" <c:if test="${basicInfo.degree eq '硕士' }">selected</c:if>>硕士</option>
      		<option value="博士" <c:if test="${basicInfo.degree eq '博士' }">selected</c:if>>博士</option>
      		<option value="-1" <c:if test="${basicInfo.degree eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="degreeStr">
    		请填写相应的内容：<br/><input name="degreeStr" type="text" class="w123" value="${basicInfo.degree }" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.degreet.value==''){
	    			document.getElementById("degreeStr").style.display='block';
	    			document.hrForm.degreet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>班级排名：</td>
    <td><input name="classorder" type="hidden" value="${basicInfo.classorder }" maxlength="10"/>
    	<select name="classordert" id="classordert" class="required" onchange="showStr(this,'classorderStr')">
			<option value="">请选择...</option>
      		<option value="前5%" <c:if test="${basicInfo.classorder eq '前5%' }">selected</c:if>>前5%</option>
      		<option value="前5%-10%" <c:if test="${basicInfo.classorder eq '前5%-10%' }">selected</c:if>>前5%-10%</option>
      		<option value="前10%-20%" <c:if test="${basicInfo.classorder eq '前10%-20%' }">selected</c:if>>前10%-20%</option>
      		<option value="前20%-50%" <c:if test="${basicInfo.classorder eq '前20%-50%' }">selected</c:if>>前20%-50%</option>
      		<option value="前50%-80%" <c:if test="${basicInfo.classorder eq '前50%-80%' }">selected</c:if>>前50%-80%</option>
      		<option value="后20%" <c:if test="${basicInfo.classorder eq '后20%' }">selected</c:if>>后20%</option>
      		<option value="-1" <c:if test="${basicInfo.classorder eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="classorderStr">
    		请填写相应的内容：<br/><input name="classorderStr" type="text" class="w123" value="${basicInfo.classorder }" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.classordert.value==''){
	    			document.getElementById("classorderStr").style.display='block';
	    			document.hrForm.classordert.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>证明人：</td>
    <td>
    	<input name="prover" type="text" class="w123" id="prover" maxlength="8" value="${basicInfo.prover }"/>
    </td>
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
    <td colspan="2" align="center">
		<input name="button3" type="button" class="but01" id="button3" value="保 存" onclick="subToPage('basicNext');"/>
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
	    	<input name="button2" type="button" class="but08" value="返回上一步" onclick="window.location.href='${ctx }/job/personInfo.jsp?nav=myResume'" />
			&nbsp;&nbsp;
			<input name="button3" type="button" class="but08" value="下一步" onclick="gotonextpage();"/>
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