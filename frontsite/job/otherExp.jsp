<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserBearwardService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserBearward"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserPubpaperService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserFamilyService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserApplyItemService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserApplyItem"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserPubpaper"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserFamily"/>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value="myResume"/>
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
 	String.prototype.trim = function() {   
		    return this.replace(/^\s+/g,"").replace(/\s+$/g,"");   
	}  
 	function showStr(obj,value)
	{
		if(obj.value=='-1'){
	    	document.getElementById(value).style.display ='block';
	    }else{
	    	document.getElementById(value).style.display ='none';
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
	
	function pdResults(lowStr){
	    if(lowStr.toLowerCase().indexOf("alert")>-1 || lowStr.toLowerCase().indexOf("create")>-1 || lowStr.toLowerCase().indexOf("truncate")>-1
							|| lowStr.toLowerCase().indexOf("drop")>-1|| lowStr.toLowerCase().indexOf("lock table")>-1|| lowStr.toLowerCase().indexOf("insert")>-1
							|| lowStr.toLowerCase().indexOf("update")>-1 || lowStr.toLowerCase().indexOf("delete")>-1|| lowStr.toLowerCase().indexOf("select")>-1
							|| lowStr.toLowerCase().indexOf("grant")>-1||lowStr.toLowerCase().indexOf("<script")>-1
							||lowStr.toLowerCase().indexOf("script/>")>-1||lowStr.toLowerCase().indexOf("alert(")>-1||lowStr.toLowerCase().indexOf("alert)")>-1 ){
					        return true;
					}
		return false;
	}
</script>
 
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	HrUserBearwardService service = (HrUserBearwardService)ctx.getBean("hrUserBearwardService");
	HrUserPubpaperService paperService = (HrUserPubpaperService)ctx.getBean("hrUserPubpaperService");
	HrUserFamilyService familyService = (HrUserFamilyService)ctx.getBean("hrUserFamilyService");
	HrUserApplyItemService applyItemService = (HrUserApplyItemService)ctx.getBean("hrUserApplyItemService");
	LobService lobService=(LobService)ctx.getBean("lobService");
	List list = new ArrayList();
	List paperList = new ArrayList();
	List familyList = new ArrayList();
	HrUserApplyItem applyItem = new HrUserApplyItem();
	if(hrUser!=null){
		list = service.getAllBearwardList(hrUser.getId());
		paperList = paperService.getAllPubpaperList(hrUser.getId());
		familyList = familyService.getAllFamilyList(hrUser.getId());
		applyItem = applyItemService.getBeanById(hrUser.getId());
	}
	pageContext.setAttribute("applyItem",applyItem);
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
			<jsp:param value="other" name="nav1"/>
		</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>我的简历</h4></div>
<p class="inden25 lh30 cuxuxianb"><span class="red">填写提示：</span><span class="red">*</span>所指明的是必填内容（按照时间）由近到远的顺序填写</p>
<div class="clearfloat"></div>
<form action="${ctx }/hrUserAction.do?method=saveHrUserOther&nav=<%=nav %>" method="post" enctype="multipart/form-data"
		name="hrForm">
	<input type="hidden" name="action" value=""/>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">获奖情况</strong>（按照获奖时间由近到远顺序填写）</td>
  </tr>
</table>
<table width="97%" border="0" align="center" class="lh30">
	<%if(list!=null && list.size()>0){
		for(int j=0;j<list.size();j++){
			HrUserBearward bean = (HrUserBearward)list.get(j);
	 %>
		<tr>
			<td width="10%" align="right">获奖日期：</td>
		    <td width="23%"><input type="hidden" name="startTimeYear<%=j %>" id="startTimeYear<%=j %>" value="<%=bean.getStartTimeYear()%>"/>
		      	<select name="tstartTimeYear<%=j %>" id="tstartTimeYear<%=j %>" onchange="showStr(this,'startTimeYear<%=j %>StrSpan')" >
					<option value="">请选择</option>
      			<%for(int i=1980;i<=2020;i++){ %>
    	 			<option value="<%=i %>" <%=(i+"").equals(bean.getStartTimeYear())?"selected":"" %>><%=i %></option>
    	 		<%} %>
	    	 		<option value="-1">其他</option>
		      	</select>年
	  			<select name="startTimeMonth<%=j %>" id="startTimeMonth<%=j %>" >
					<option value="">请选择</option>
	  			<%for(int i=1;i<=12;i++){ %>
	    	 		<option value="<%=i %>" <%=(i+"").equals(bean.getStartTimeMonth())?"selected":"" %>><%=i %></option>
	    	 	<%} %>
				</select>月
		    	<span style="display:none" id="startTimeYear<%=j %>StrSpan">
		    		请填写内容：<br/><input name="startTimeYear<%=j %>Str" id="startTimeYear<%=j %>Str" type="text" class="w66" value="<%=bean.getStartTimeYear()%>" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
		    	</span>
		    	<script language="javascript">
		    		if(document.hrForm.tstartTimeYear<%=j%>.value==''){
		    			document.getElementById("startTimeYear<%=j%>StrSpan").style.display='block';
		    			document.hrForm.tstartTimeYear<%=j%>.value = '-1';
		    		}
		    	</script>
			</td>
		    <td width="10%" align="right">奖励名称：</td>
		    <td width="12%"><input name="awardName<%=j%>" type="text" class="w66" maxlength="40" id="awardName<%=j %>" value="<%=bean.getAwardName()==null?"":bean.getAwardName() %>"/></td>
		    <td width="10%" align="right">奖励机构：</td>
		    <td width="12%"><input name="awardOrg<%=j%>" type="text" class="w66" maxlength="40" id="awardOrg<%=j %>" value="<%=bean.getAwardOrg()==null?"":bean.getAwardOrg() %>"/></td>
		    <td width="10%" align="right">奖励级别：</td>
		    <td><input type="hidden" name="awardLever<%=j %>" id="awardLever<%=j %>" value="<%=bean.getAwardLever()%>"/>
		    	<select name="tawardLever<%=j%>" id="tawardLever<%=j%>" class="w66"  onchange="showStr(this,'awardLever<%=j%>StrSpan')">
					<option value="">请选择</option>
		      		<option value="系级" <%="系级".equals(bean.getAwardLever())?"selected":"" %>>系级</option>
		      		<option value="院级" <%="院级".equals(bean.getAwardLever())?"selected":"" %>>院级</option>
		      		<option value="校级" <%="校级".equals(bean.getAwardLever())?"selected":"" %>>校级</option>
		      		<option value="公司级" <%="公司级".equals(bean.getAwardLever())?"selected":"" %>>公司级</option>
		      		<option value="区级" <%="区级".equals(bean.getAwardLever())?"selected":"" %>>区级</option>
		      		<option value="市级" <%="市级".equals(bean.getAwardLever())?"selected":"" %>>市级</option>
		      		<option value="省级" <%="省级".equals(bean.getAwardLever())?"selected":"" %>>省级</option>
		      		<option value="国家级" <%="国家级".equals(bean.getAwardLever())?"selected":"" %>>国家级</option>
		      		<option value="-1" <%="-1".equals(bean.getAwardLever())?"selected":"" %>>其他</option>
		    	</select>
		    	<span style="display:none" id="awardLever<%=j%>StrSpan">
		    		请填写内容：<br/><input name="awardLever<%=j%>Str" id="awardLever<%=j%>Str" type="text" class="w66" value="<%=bean.getAwardLever()%>" maxlength="20"/><span class="red">(20字内)</span>
		    	</span>
		    	<script language="javascript">
		    		if(document.hrForm.tawardLever<%=j%>.value==''){
		    			document.getElementById("awardLever<%=j%>StrSpan").style.display='block';
		    			document.hrForm.tawardLever<%=j%>.value = '-1';
		    		}
		    	</script>
		    </td>
		  </tr>
	
	<%}}
		for(int j=list.size();j<5;j++){
	%>	
			<tr>
		    <td width="10%" align="right">获奖日期：</td>
		    <td width="23%"><input type="hidden" name="startTimeYear<%=j %>" id="startTimeYear<%=j %>" value=""/>
		      	<select name="tstartTimeYear<%=j %>" id="tstartTimeYear<%=j %>" onchange="showStr(this,'startTimeYear<%=j %>StrSpan')" >
					<option value="">请选择</option>
      			<%for(int i=1980;i<=2020;i++){ %>
    	 			<option value="<%=i %>"><%=i %></option>
    	 		<%} %>
	    	 		<option value="-1">其他</option>
		      	</select>年
	  			<select name="startTimeMonth<%=j %>" id="startTimeMonth<%=j %>" >
					<option value="">请选择</option>
	  			<%for(int i=1;i<=12;i++){ %>
	    	 		<option value="<%=i %>" ><%=i %></option>
	    	 	<%} %>
				</select>月
		    	<span style="display:none" id="startTimeYear<%=j %>StrSpan">
		    		请填写内容：<br/><input name="startTimeYear<%=j %>Str" id="startTimeYear<%=j %>Str" type="text" class="w66" value="" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
		    	</span>
			</td>
		    <td width="10%" align="right">奖励名称：</td>
		    <td width="12%"><input name="awardName<%=j %>" type="text" class="w66" maxlength="40" id="awardName<%=j %>""/></td>
		    <td width="10%" align="right">奖励机构：</td>
		    <td width="12%"><input name="awardOrg<%=j %>" type="text" class="w66" maxlength="40" id="awardOrg<%=j %>" /></td>
		    <td width="10%" align="right">奖励级别：</td>
		    <td><input type="hidden" name="awardLever<%=j %>" id="awardLever<%=j %>" value=""/>
		    	<select name="tawardLever<%=j %>" id="tawardLever<%=j %>" class="w66"  onchange="showStr(this,'awardLever<%=j%>StrSpan')">
					<option value="">请选择</option>
		      		<option value="系级">系级</option>
		      		<option value="院级">院级</option>
		      		<option value="校级">校级</option>
		      		<option value="公司级">公司级</option>
		      		<option value="区级">区级</option>
		      		<option value="市级">市级</option>
		      		<option value="省级">省级</option>
		      		<option value="国家级">国家级</option>
		      		<option value="-1">其他</option>
		    	</select>
		    	<span style="display:none" id="awardLever<%=j%>StrSpan">
		    		请填写内容：<br/><input name="awardLever<%=j%>Str" id="awardLever<%=j%>Str" type="text" class="w66" value="" maxlength="20"/><span class="red">(20字内)</span>
		    	</span>
		    </td>
		  </tr>
	<%
	}
	%>
  
  <tr>
    <td height="15" colspan="8" class="cuxuxian"></td>
  </tr>
</table>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">发表论文著作情况</strong>（按照论文/著作发表时间由近到远顺序填写）</td>
  </tr>
</table>
<table width="99%" border="0" align="center" class="lh30">
<%if(paperList!=null && paperList.size()>0){
		for(int j=0;j<paperList.size();j++){
			HrUserPubpaper bean = (HrUserPubpaper)paperList.get(j);
	 %>
  <tr>
    <td width="10%" align="right">发表时间：</td>
    <td width="23%"><input type="hidden" name="pstartTimeYear<%=j %>" id="pstartTimeYear<%=j %>" value="<%=bean.getStartTimeYear()%>"/>
    	<select name="tpstartTimeYear<%=j %>" id="tpstartTimeYear<%=j %>" onchange="showStr(this,'pstartTimeYear<%=j %>StrSpan')" >
			<option value="">请选择</option>
       	<%for(int i=1980;i<=2020;i++){ %>
    	 	<option value="<%=i %>" <%=(i+"").equals(bean.getStartTimeYear())?"selected":"" %>><%=i %></option>
    	<%} %>
	    	<option value="-1">其他</option>
    	</select>年
      	<select name="pstartTimeMonth<%=j %>" id="pstartTimeMonth<%=j %>" >
			<option value="">请选择</option>
        <%for(int i=1;i<=12;i++){ %>
	    	<option value="<%=i %>" <%=(i+"").equals(bean.getStartTimeMonth())?"selected":"" %>><%=i %></option>
	    <%} %>
      	</select>月
    	<span style="display:none" id="pstartTimeYear<%=j %>StrSpan">
    		请填写内容：<br/><input name="pstartTimeYear<%=j %>Str" id="pstartTimeYear<%=j %>Str" type="text" class="w66" value="<%=bean.getStartTimeYear()%>" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
    	</span>
    	<script language="javascript">
    		if(document.hrForm.tpstartTimeYear<%=j%>.value==''){
    			document.getElementById("pstartTimeYear<%=j %>StrSpan").style.display='block';
    			document.hrForm.tpstartTimeYear<%=j%>.value = '-1';
    		}
    	</script>
    </td>
    <td width="14%" align="right"><strong>论文/著作题目</strong>：</td>
    <td width="12%"><input name="paperName<%=j %>" type="text" class="w66" maxlength="40" id="paperName<%=j %>" value="<%=bean.getPaperName()==null?"":bean.getPaperName() %>"/></td>
    <td width="10%" align="right">出版机构：</td>
    <td width="12%"><input name="publicationName<%=j %>" type="text" class="w66" maxlength="40" id="publicationName<%=j %>" value="<%=bean.getPublicationName()==null?"":bean.getPublicationName() %>"/></td>
    <td width="10%" align="right">作者顺序：</td>
    <td><input type="hidden" name="anthorOrder<%=j %>" id="anthorOrder<%=j %>" value="<%=bean.getAnthorOrder()%>"/>
    	<select name="tanthorOrder<%=j %>" id="tanthorOrder<%=j %>" class="w66" onchange="showStr(this,'anthorOrder<%=j %>StrSpan')" >
			<option value="">请选择</option>
    		<option value="第一作者" <%="第一作者".equals(bean.getAnthorOrder())?"selected":"" %>>第一作者</option>
	    	<option value="第二作者" <%="第二作者".equals(bean.getAnthorOrder())?"selected":"" %>>第二作者</option>
	    	<option value="第三作者" <%="第三作者".equals(bean.getAnthorOrder())?"selected":"" %>>第三作者</option>
	    	<option value="第四作者" <%="第四作者".equals(bean.getAnthorOrder())?"selected":"" %>>第四作者</option>
	    	<option value="-1" <%="-1".equals(bean.getAnthorOrder())?"selected":"" %>>其他</option>
		</select>
		<span style="display:none" id="anthorOrder<%=j %>StrSpan">
			请填写内容：<br/>
			<input name="anthorOrder<%=j%>Str" id="anthorOrder<%=j%>Str" type="text" class="w66" value="<%=bean.getAnthorOrder()%>" maxlength="20"/>
			<span class="red">(20字内)</span>
		</span>
    	<script language="javascript">
    		if(document.hrForm.tanthorOrder<%=j%>.value==''){
    			document.getElementById("anthorOrder<%=j %>StrSpan").style.display='block';
    			document.hrForm.tanthorOrder<%=j%>.value = '-1';
    		}
    	</script>
	</td>
  </tr>
  <%}} 
		for(int j=paperList.size();j<5;j++){
	%>	
			<tr>
		    <td width="10%" align="right">发表时间：</td>
		    <td width="23%"><input type="hidden" name="pstartTimeYear<%=j %>" id="pstartTimeYear<%=j %>" value=""/>
		    	<select name="tpstartTimeYear<%=j %>" id="tpstartTimeYear<%=j %>" onchange="showStr(this,'pstartTimeYear<%=j %>StrSpan')" >
					<option value="">请选择</option>
		       	<%for(int i=1980;i<=2020;i++){ %>
		    	 	<option value="<%=i %>" ><%=i %></option>
		    	<%} %>
	    	 		<option value="-1">其他</option>
		    	</select>年
		      	<select name="pstartTimeMonth<%=j %>" id="pstartTimeMonth<%=j %>" >
					<option value="">请选择</option>
		        <%for(int i=1;i<=12;i++){ %>
			    	 <option value="<%=i %>" ><%=i %></option>
			    <%} %>
		      	</select>月
    			<span style="display:none" id="pstartTimeYear<%=j %>StrSpan">
    				请填写内容：<br/><input name="pstartTimeYear<%=j %>Str" id="pstartTimeYear<%=j %>Str" type="text" class="w66" value="" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(2字内)</span>
    			</span>
		    </td>
		    <td width="14%" align="right"><strong>论文/著作题目</strong>：</td>
		    <td width="12%"><input name="paperName<%=j %>" type="text" class="w66" maxlength="40" id="paperName<%=j %>"/></td>
		    <td width="10%" align="right">出版机构：</td>
		    <td width="12%"><input name="publicationName<%=j %>" type="text" class="w66" maxlength="40" id="publicationName<%=j %>" /></td>
		    <td width="10%" align="right">作者顺序：</td>
		    <td><input type="hidden" name="anthorOrder<%=j %>" id="anthorOrder<%=j %>" value=""/>
		    	<select name="tanthorOrder<%=j %>" id="tanthorOrder<%=j %>" class="w66" onchange="showStr(this,'anthorOrder<%=j %>StrSpan')" >
					<option value="">请选择</option>
		    		<option value="第一作者">第一作者</option>
		    		<option value="第二作者">第二作者</option>
		    		<option value="第三作者">第三作者</option>
		    		<option value="第四作者">第四作者</option>
	    	 		<option value="-1">其他</option>
				</select>
    			<span style="display:none" id="anthorOrder<%=j %>StrSpan">
    				请填写内容：<br/><input name="anthorOrder<%=j %>Str"  id="anthorOrder<%=j %>Str" type="text" class="w66" value="" maxlength="20"/><span class="red">(20字内)</span>
    			</span>
			</td>
		  </tr>
	<%
	}
	%>
  <tr>
    <td height="15" colspan="8" class="cuxuxian"></td>
  </tr>
</table>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">家庭情况</strong>（直系亲属;必填包含父母、子女、直系兄弟姐妹）</td>
  </tr>
</table>
<table width="97%" border="0" align="center" class="lh30">
<%if(familyList!=null && familyList.size()>0){
	for(int j=0;j<familyList.size();j++){
			HrUserFamily bean = (HrUserFamily)familyList.get(j);
%>
	<tr>
    	<td align="right">与本人关系：</td>
    	<td><input name="relationship<%=j %>" type="text" class="w66" maxlength="8" id="relationship<%=j %>" value="<%=bean.getRelationship()==null?"":bean.getRelationship() %>"/></td>
    	<td align="right">姓名：</td>
    	<td><input name="name<%=j %>" type="text" class="w66" maxlength="8" id="name<%=j %>" value="<%=bean.getName()==null?"":bean.getName()%>"/></td>
    	<td align="right">工作单位：</td>
    	<td><input name="jobUnit<%=j %>" type="text" class="w66" maxlength="40" id="jobUnit<%=j %>" value="<%=bean.getJobUnit()==null?"":bean.getJobUnit() %>"/></td>
    	<td align="right">职务：</td>
    	<td><input name="position<%=j %>" type="text" class="w66" maxlength="40" id="position<%=j %>" value="<%=bean.getPosition()==null?"":bean.getPosition() %>"/></td>
    	<td align="right">联系方式：</td>
    	<td><input name="contactMode<%=j %>" type="text" class="w66" maxlength="40" id="contactMode<%=j %>" value="<%=bean.getContactMode()==null?"":bean.getContactMode() %>"/></td>
  	</tr>
 <%}
	for(int j=familyList.size();j<5;j++){
%>	
	<tr>
	    <td align="right">与本人关系：</td>
	    <td><input name="relationship<%=j %>" type="text" class="w66" maxlength="8" id="relationship<%=j %>"/></td>
	    <td align="right">姓名：</td>
	    <td><input name="name<%=j %>" type="text" class="w66" maxlength="8" id="name<%=j %>" /></td>
	    <td align="right">工作单位：</td>
	    <td><input name="jobUnit<%=j %>" type="text" class="w66" maxlength="40" id="jobUnit<%=j %>" /></td>
	    <td align="right">职务：</td>
	    <td><input name="position<%=j %>" type="text" class="w66" maxlength="40" id="position<%=j %>" /></td>
	    <td align="right">联系方式：</td>
	    <td><input name="contactMode<%=j %>" type="text" class="w66" maxlength="40" id="contactMode<%=j %>"/></td>
	</tr>
	<%
	}
}else{
%>
	<tr>
	   <td align="right"><span class="red">*</span>与本人关系：</td>
	   <td><input name="relationship0" type="text" class="w66" maxlength="8" id="relationship0" value="父亲" readonly/></td>
	   <td align="right">姓名：</td>
	   <td><input name="name0" type="text" class="w66" maxlength="8" id="name0" /></td>
	   <td align="right">工作单位：</td>
	   <td><input name="jobUnit0" type="text" class="w66" maxlength="40" id="jobUnit0" /></td>
	   <td align="right">职务：</td>
	   <td><input name="position0" type="text" class="w66" maxlength="40" id="position0" /></td>
	   <td align="right">联系方式：</td>
	   <td><input name="contactMode0" type="text" class="w66" maxlength="40" id="contactMode0"/></td>
	 </tr>
	<tr>
	   <td align="right"><span class="red">*</span>与本人关系：</td>
	   <td><input name="relationship1" type="text" class="w66" maxlength="8" id="relationship1" value="母亲" readonly/></td>
	   <td align="right">姓名：</td>
	   <td><input name="name1" type="text" class="w66" maxlength="8" id="name1" /></td>
	   <td align="right">工作单位：</td>
	   <td><input name="jobUnit1" type="text" class="w66" maxlength="40" id="jobUnit1" /></td>
	   <td align="right">职务：</td>
	   <td><input name="position1" type="text" class="w66" maxlength="40" id="position1" /></td>
	   <td align="right">联系方式：</td>
	   <td><input name="contactMode1" type="text" class="w66" maxlength="40" id="contactMode1"/></td>
	 </tr>
	<tr>
	    <td align="right">${(marrystate eq '已婚未育' || marrystate eq '已婚已育') ? '<span class=red>*</span>' : '' }与本人关系：</td>
	    <td><input name="relationship2" ${(marrystate eq '已婚未育' || marrystate eq '已婚已育') ? 'value=配偶 readonly' : '' } type="text" class="w66" maxlength="8" id="relationship2"/></td>
	    <td align="right">姓名：</td>
	    <td><input name="name2" type="text" class="w66" maxlength="8" id="name2" /></td>
	    <td align="right">工作单位：</td>
	    <td><input name="jobUnit2" type="text" class="w66" maxlength="40" id="jobUnit2" /></td>
	    <td align="right">职务：</td>
	    <td><input name="position2" type="text" class="w66" maxlength="40" id="position2" /></td>
	    <td align="right">联系方式：</td>
	    <td><input name="contactMode2" type="text" class="w66" maxlength="40" id="contactMode2"/></td>
	</tr>
	<tr>
	    <td align="right">${marrystate eq '已婚已育' ? '<span class=red>*</span>' : '' }与本人关系：</td>
	    <td><input name="relationship3" ${marrystate eq '已婚已育' ? 'value=子女' : '' } type="text" class="w66" maxlength="8" id="relationship3"/></td>
	    <td align="right">姓名：</td>
	    <td><input name="name3" type="text" class="w66" maxlength="8" id="name3" /></td>
	    <td align="right">工作单位：</td>
	    <td><input name="jobUnit3" type="text" class="w66" maxlength="40" id="jobUnit3" /></td>
	    <td align="right">职务：</td>
	    <td><input name="position3" type="text" class="w66" maxlength="40" id="position3" /></td>
	    <td align="right">联系方式：</td>
	    <td><input name="contactMode3" type="text" class="w66" maxlength="40" id="contactMode3"/></td>
	</tr>
	<tr>
	   <td align="right">与本人关系：</td>
	   <td><input name="relationship4" type="text" class="w66" maxlength="8" id="relationship4"/></td>
	   <td align="right">姓名：</td>
	   <td><input name="name4" type="text" class="w66" maxlength="8" id="name4" /></td>
	   <td align="right">工作单位：</td>
	   <td><input name="jobUnit4" type="text" class="w66" maxlength="40" id="jobUnit4" /></td>
	   <td align="right">职务：</td>
	   <td><input name="position4" type="text" class="w66" maxlength="40" id="position4" /></td>
	   <td align="right">联系方式：</td>
	   <td><input name="contactMode4" type="text" class="w66" maxlength="40" id="contactMode4"/></td>
	 </tr>
<%	 
}%>
  <tr>
    <td height="15" colspan="10" class="cuxuxian"></td>
  </tr>
</table>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">个人申报事项</strong></td>
  </tr>
</table>


<table width="97%" border="0" align="center" class="lh30">
  <tr>
    <td width="42%" align="right"><span class="red">*</span>有无刑事处罚记录：</td>
    <td width="20%" align="center"><input type="radio" name="xscf" id="xscf1" value="1" <c:if test="${applyItem.xscf eq '1' }">checked='checked'</c:if>/>有
      <input type="radio" name="xscf" id="xscf2" value="0" <c:if test="${applyItem.xscf eq '0' }">checked='checked'</c:if>/>无</td>
    <td width="15%">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
 
    <td align="right"><span class="red">*</span>有无被证券市场禁入记录：</td>
    <td align="center"><input type="radio" name="zqscjr" id="zqscjr" value="1" <c:if test="${applyItem.zqscjr eq '1' }">checked='checked'</c:if>/>有
      <input type="radio" name="zqscjr" id="zqscjr" value="0" <c:if test="${applyItem.zqscjr eq '0' }">checked='checked'</c:if>/>无</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>有无因违法或违纪行为被证券相关机构开除的记录：</td>
    <td align="center"><input type="radio" name="zqsckc" id="zqsckc" value="1" <c:if test="${applyItem.zqsckc eq '1' }">checked='checked'</c:if>/>有
      <input type="radio" name="zqsckc" id="zqsckc" value="0" <c:if test="${applyItem.zqsckc eq '0' }">checked='checked'</c:if>/>无</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>有无违反国家计划生育政策：</td>
    <td align="center"><input type="radio" name="wfgjjhsy" id="wfgjjhsy" value="1" <c:if test="${applyItem.wfgjjhsy eq '1' }">checked='checked'</c:if>/>有
      <input type="radio" name="wfgjjhsy" id="wfgjjhsy" value="0" <c:if test="${applyItem.wfgjjhsy eq '0' }">checked='checked'</c:if>/>无</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="right"><span class="red">*</span>有无参加“法轮功”等邪教组织：</td>
    <td align="center"><input type="radio" name="cjflg" id="cjflg" value="1" <c:if test="${applyItem.cjflg eq '1' }">checked='checked'</c:if>/>有
      <input type="radio" name="cjflg" id="cjflg" value="0" <c:if test="${applyItem.cjflg eq '0' }">checked='checked'</c:if>/>无</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>若离开原单位是否涉及未了手续或经济补偿：</td>
    <td align="center"><input type="radio" name="sjsxjjbc" id="sjsxjjbc" value="1" <c:if test="${applyItem.sjsxjjbc eq '1' }">checked='checked'</c:if>/>是
      <input type="radio" name="sjsxjjbc" id="sjsxjjbc" value="0" <c:if test="${applyItem.sjsxjjbc eq '0' }">checked='checked'</c:if>/>否</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>目前是否与企业/单位存在劳动关系：</td>
    <td align="center"><input type="radio" name="czldgx" id="czldgx" value="1" <c:if test="${applyItem.czldgx eq '1' }">checked='checked'</c:if>/>是
  <input type="radio" name="czldgx" id="czldgx" value="0" <c:if test="${applyItem.czldgx eq '0' }">checked='checked'</c:if>/>否</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>本人是否有无股票投资帐户：</td>
    <td align="center"><input type="radio" name="gptzzh" id="gptzzh" value="1" <c:if test="${applyItem.gptzzh eq '1' }">checked='checked'</c:if>/>是
  <input type="radio" name="gptzzh" id="gptzzh" value="0" <c:if test="${applyItem.gptzzh eq '0' }">checked='checked'</c:if>/>否</td>
    <td align="right"><input name="gdkh" type="text" class="w112" maxlength="20" id="gdkh" value="${applyItem.gdkh }" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
    <td class="red">若是，请填写股东卡号</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>是否可在入司后30天内将档案转入：</td>
    <td align="center"><input type="radio" name="jdazr" id="jdazr" value="1" <c:if test="${applyItem.jdazr eq '1' }">checked='checked'</c:if>/>是
  <input type="radio" name="jdazr" id="jdazr" value="0" <c:if test="${applyItem.jdazr eq '0' }">checked='checked'</c:if>/>否</td>
    <td align="right"><input name="reason" type="text" class="w112" maxlength="40" id="reason" value="${applyItem.reason}"/></td>
    <td class="red">若否，请写明原因</td>
  </tr>
  <tr>
    <td height="15" colspan="4" class="cuxuxian"></td>
  </tr>
</table>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">其他</strong></td>
  </tr>
</table>
<table width="97%" border="0" align="center" class="lh30">
  <tr>
    <td width="42%" align="right" valign="top">业余爱好描述：</td>
    <td colspan="2"><textarea name="avocation" rows="5" class="w279" id="avocation" onKeyDown="MaxLen(this,100)">${applyItem.avocation}</textarea>
      <span class="red">(100字以内)</span></td>
  </tr>
  <tr>
    <td align="right" valign="top"><span class="red">*</span>请描写本人性格特点&nbsp;&nbsp;优势：</td>
    <td colspan="2"><textarea name="advantage" rows="3" class="w279" id="advantage" onKeyDown="MaxLen(this,50)">${applyItem.advantage}</textarea>
      <span class="red">(50字以内)</span></td>
  </tr>
  <tr>
    <td align="right" valign="top"><span class="red">*</span>劣势：</td>
    <td colspan="2"><textarea name="feebleness" rows="3" class="w279" id="feebleness" onKeyDown="MaxLen(this,50)">${applyItem.feebleness}</textarea>
      <span class="red">(50字以内)</span></td>
  </tr>
  <tr>
    <td align="right"><strong><span class="red">*</span>是否与公司的员工是否具有亲属关系？</strong></td>
    <td width="13%"><input type="radio" name="jyqsgx" id="jyqsgx1" value="1" <c:if test="${applyItem.jyqsgx eq '1' }">checked='checked'</c:if>/>有
  <input type="radio" name="jyqsgx" id="jyqsgx2" value="0" <c:if test="${applyItem.jyqsgx eq '0' }">checked='checked'</c:if>/>无</td>
    <td width="45%" align="right"><span class="font_73">若有，请说明姓名、所在部门以及工作岗位</span>      <input name="aboutqs" type="text" class="w66" maxlength="60" id="aboutqs" value="${applyItem.aboutqs}"/></td>
  </tr>
  <!-- tr>
    <td colspan="3" class="font_73">（注：“亲属关系”包括：（一）夫妻关系；（二）直系血亲关系，包括祖父母、外祖父母、父母、子女、孙子女、外孙子女；（三）三代以内旁系血亲关系，包括伯叔姑舅姨、兄弟姐妹、堂兄弟姐妹、表兄弟姐妹、侄子女、甥子女；（四）近姻亲关系，包括配偶的父母、配偶的兄弟姐妹及其配偶、子女的配偶及子女配偶的父母、三代以内旁系血亲的配偶） </td>
  </tr-->
  <tr>
    <td align="right" valign="top"><span class="red">*</span>您从哪个渠道了解到广发证券的此次招聘：</td>
    <td colspan="2"><input type="hidden" name="channel" id="channel" value="${applyItem.channel}"/>
    	<select name="channelt" id="channelt" class="w279"  onchange="showStr(this,'channelStr')">
			<option value="">请选择</option>
    		<option value="广发证券网站" <c:if test="${applyItem.channel eq '广发证券网站' }">selected</c:if>>广发证券网站</option>
    		<option value="宣讲会" <c:if test="${applyItem.channel eq '宣讲会' }">selected</c:if>>宣讲会</option>
    		<option value="学校BBS" <c:if test="${applyItem.channel eq '学校BBS' }">selected</c:if>>学校BBS</option>
    		<option value="学校就业指导中心网站" <c:if test="${applyItem.channel eq '学校就业指导中心网站' }">selected</c:if>>学校就业指导中心网站</option>
    		<option value="同学" <c:if test="${applyItem.channel eq '同学' }">selected</c:if>>同学</option>
    		<option value="老师" <c:if test="${applyItem.channel eq '老师' }">selected</c:if>>老师</option>
    		<option value="朋友" <c:if test="${applyItem.channel eq '朋友' }">selected</c:if>>朋友</option>
    		<option value="亲戚" <c:if test="${applyItem.channel eq '亲戚' }">selected</c:if>>亲戚</option>
    		<option value="中华英才网" <c:if test="${applyItem.channel eq '中华英才网' }">selected</c:if>>中华英才网</option>
    		<option value="智联招聘网" <c:if test="${applyItem.channel eq '智联招聘网' }">selected</c:if>>智联招聘网</option>
    		<option value="前程无忧网" <c:if test="${applyItem.channel eq '前程无忧网' }">selected</c:if>>前程无忧网</option>
    		<option value="应届生求职网" <c:if test="${applyItem.channel eq '应届生求职网' }">selected</c:if>>应届生求职网</option>
    		<option value="-1">其他</option>
      	</select>
		<span style="display:none" id="channelStr">
			请填写相应的内容：<br/><input name="channelStr" type="text" class="w279" value="${applyItem.channel}" maxlength="20"/><span class="red">(20字内)</span>
		</span>
    	<script language="javascript">
    		if(document.hrForm.channelt.value==''){
    			document.getElementById("channelStr").style.display='block';
    			document.hrForm.channelt.value = '-1';
    		}
    	</script>
    </td>
  </tr>
  <tr>
    <td align="right" valign="top"><span class="red">*</span>请说明申请到广发证券实习或工作的目的和理由：</td>
    <td colspan="2"><textarea name="workreason" rows="5" class="w279" id="workreason" onKeyDown="MaxLen(this,100)">${applyItem.workreason}</textarea>
      <span class="red">(100字以内)</span></td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong>其他情况说明：</strong></td>
    <td colspan="2"><textarea name="otherthing" rows="5" class="w279" id="otherthing" onKeyDown="MaxLen(this,100)">${applyItem.otherthing}</textarea>
      <span class="red">(100字以内)</span></td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong>上传简历附件：</strong></td>
    <td colspan="2"><input type="file" name="picFile" id="picFile" /><span class="red">(1M内)</span></td>
  </tr>
  <%
  		 String fileName="";
  		if (applyItem != null && applyItem.getBlogId() > 0)
  		{
  			fileName = lobService.getFileNameById(applyItem.getBlogId());
  			%>
  				<tr>
  				 <td align="right" valign="top"><strong>附件：</strong></td>
  				<td colspan="2"><a href="${contextPath }/commons/showDocumentFile.jsp?id=<%=applyItem.getBlogId()%>"><%=fileName %></a></td>
  				</tr>
  			<%
  		}
   %>
  <tr>
    <td align="right" valign="top"><strong>上传论文代表作：</strong></td>
    <td colspan="2"><input type="file" name="paperFile" id="paperFile" /><span class="red">(3M内)</span></td>
  </tr>
  <%
  		 String paperName="";
  		if (applyItem != null && applyItem.getPaperId() > 0)
  		{
  			paperName = lobService.getFileNameById(applyItem.getPaperId());
  			%>
  				<tr>
  				 <td align="right" valign="top"><strong>论文代表作：</strong></td>
  				<td colspan="2"><a href="${contextPath }/commons/showDocumentFile.jsp?id=<%=applyItem.getPaperId()%>"><%=paperName %></a></td>
  				</tr>
  			<%
  		}
   %>
  <tr>
  <tr>
    <td align="right" valign="top"><strong>欢迎上传个人简介/自我展示微视频：</strong></td>
    <td colspan="2"><input type="file" name="videoFile" id="videoFile" /><span class="red">（视频长度1分钟，15M内）</span>  
    </td>    
  </tr>
  <tr>
  <td colspan="3"><span class="red" style="padding-left: 40px;">提示：您可通过电脑摄像头等录制1分钟个人简介或自我展示微视频，一段出色的微视频将为您的简历增光添彩！</span></td>
  </tr>
  <%
  		 String videoName="";
  		if (applyItem != null && applyItem.getVideoid() > 0)
  		{
  			videoName = lobService.getFileNameById(applyItem.getVideoid());
  			%>
  				<tr>
  				 <td align="right" valign="top"><strong>自我展示微视频：</strong></td>
  				<td colspan="2"><a href="${contextPath }/commons/showDocumentFile.jsp?id=<%=applyItem.getVideoid()%>"><%=videoName %></a></td>
  				</tr>
  			<%
  		}
   %>
    <td height="15" colspan="3" class="cuxuxian"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td align="center">
    	<input name="button2" type="button" onclick="window.location.href='${ctx }/job/workExp.jsp?nav=myResume'" class="bu08" id="button2" value="返回上一步" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="button3" type="button" class="bu08" id="button3" onclick="subForm('workNext');" value="保 存" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="button3" type="button" class="bu08" id="button3" onclick="subForm('otherWorkNext');" value="下一步" /></td>
  </tr>
</table>
</form>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>
<script>
	function checkdata(name){
	    var q=document.getElementsByName(name);
	    var len=q.length;
	    var flag=false;
	    for(var i=0;i<len;i++){
	      if(q[i].checked==true){
	        flag=true;
	        break;
	       }
	    }
	    return flag;
	}
	function getcheckdata(name){
	    var q=document.getElementsByName(name);
	    var len=q.length;
	    var flag='';
	    for(var i=0;i<len;i++){
	      if(q[i].checked==true){
	        flag=q[i].value;
	        break;
	       }
	    }
	    return flag;
	}
	
	function subForm(val){
		for(var i=0;i<5;i++){
			var tstartTimeYear = document.getElementById('tstartTimeYear'+i).value.trim();
			if('-1'==tstartTimeYear){
				if(''==document.getElementById('startTimeYear'+i+'Str').value){
					alert("第"+(i+1)+"个获奖情况请填写开始时间年份！");
					return;
				}else{
					document.getElementById('startTimeYear'+i).value = document.getElementById('startTimeYear'+i+'Str').value;
				}
			}else{
				document.getElementById('startTimeYear'+i).value = tstartTimeYear;
			}
			var tawardLever = document.getElementById('tawardLever'+i).value.trim();
			if(pdResults(tawardLever)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			if('-1'==tawardLever){
				if(''==document.getElementById('awardLever'+i+'Str').value){
					alert("第"+(i+1)+"个获奖情况请填写奖励级别！");
					return;
				}else{
					document.getElementById('awardLever'+i).value = document.getElementById('awardLever'+i+'Str').value;
				}
			}else{
				document.getElementById('awardLever'+i).value = tawardLever;
			}
		}
		for(var i=0;i<5;i++){
			var tpstartTimeYear = document.getElementById('tpstartTimeYear'+i).value.trim();
			if('-1'==tpstartTimeYear){
				if(''==document.getElementById('pstartTimeYear'+i+'Str').value){
					alert("第"+(i+1)+"个发表论文著作情况请填写发表时间年份！");
					return;
				}else{
					document.getElementById('pstartTimeYear'+i).value = document.getElementById('pstartTimeYear'+i+'Str').value;
				}
			}else{
				document.getElementById('pstartTimeYear'+i).value = tpstartTimeYear;
			}
			var tanthorOrder = document.getElementById('tanthorOrder'+i).value.trim();
			if('-1'==tanthorOrder){
				if(''==document.getElementById('anthorOrder'+i+'Str').value){
					alert("第"+(i+1)+"个获奖情况请填写奖励级别！");
					return;
				}else{
					document.getElementById('anthorOrder'+i).value = document.getElementById('anthorOrder'+i+'Str').value;
				}
			}else{
				document.getElementById('anthorOrder'+i).value = tanthorOrder;
			}
		}
		var name0 = document.hrForm.name0.value;
		if(pdResults(name0)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var jobUnit0 = document.hrForm.jobUnit0.value;
		if(pdResults(jobUnit0)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var position0 = document.hrForm.position0.value;
		if(pdResults(position0)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var contactMode0 = document.hrForm.contactMode0.value;
		if(pdResults(contactMode0)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		if(''==name0){
			alert("父亲姓名不能为空！");
			document.hrForm.name0.focus();
			return;
		}
		if(''==jobUnit0){
			alert("父亲工作单位不能为空！");
			document.hrForm.jobUnit0.focus();
			return;
		}
		if(''==position0){
			alert("父亲职务不能为空！");
			document.hrForm.position0.focus();
			return;
		}
		if(''==contactMode0){
			alert("父亲联系方式不能为空！");
			document.hrForm.contactMode0.focus();
			return;
		}
		
		var name1 = document.hrForm.name1.value;
		if(pdResults(name1)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var jobUnit1 = document.hrForm.jobUnit1.value;
		if(pdResults(jobUnit1)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var position1 = document.hrForm.position1.value;
		if(pdResults(position1)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var contactMode1 = document.hrForm.contactMode1.value;
		if(pdResults(contactMode1)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		if(''==name1){
			alert("母亲姓名不能为空！");
			document.hrForm.name1.focus();
			return;
		}
		if(''==jobUnit1){
			alert("母亲工作单位不能为空！");
			document.hrForm.jobUnit1.focus();
			return;
		}
		if(''==position1){
			alert("母亲职务不能为空！");
			document.hrForm.position1.focus();
			return;
		}
		if(''==contactMode1){
			alert("母亲联系方式不能为空！");
			document.hrForm.contactMode1.focus();
			return;
		}
		
		//李伟鹏 2012-09-26 简历系统优化
		var relationship2 = document.hrForm.relationship2.value;
		if(''!=relationship2){
			var name2 = document.hrForm.name2.value;
			if(pdResults(name2)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			var jobUnit2 = document.hrForm.jobUnit2.value;
			if(pdResults(jobUnit2)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			var position2 = document.hrForm.position2.value;
			if(pdResults(position2)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			var contactMode2 = document.hrForm.contactMode2.value;
			if(pdResults(contactMode2)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			if(''==name2){
				alert("配偶姓名不能为空！");
				document.hrForm.name2.focus();
				return;
			}
			if(''==jobUnit2){
				alert("配偶工作单位不能为空！");
				document.hrForm.jobUnit2.focus();
				return;
			}
			if(''==position2){
				alert("配偶职务不能为空！");
				document.hrForm.position2.focus();
				return;
			}
			if(''==contactMode2){
				alert("配偶联系方式不能为空！");
				document.hrForm.contactMode2.focus();
				return;
			}
		}
		var relationship3 = document.hrForm.relationship3.value;
		if(''!=relationship3){
			var name3 = document.hrForm.name3.value;
			if(pdResults(name3)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			var jobUnit3 = document.hrForm.jobUnit3.value;
			if(pdResults(jobUnit3)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			var position3 = document.hrForm.position3.value;
			if(pdResults(position3)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			var contactMode3 = document.hrForm.contactMode3.value;
			if(pdResults(contactMode3)){
			window.location.href="${ctx }/commons/error2.jsp";
			return;
			}
			if(''==name3){
				alert("子女姓名不能为空！");
				document.hrForm.name3.focus();
				return;
			}
			if(''==jobUnit3){
				alert("子女工作单位不能为空！");
				document.hrForm.jobUnit3.focus();
				return;
			}
			if(''==position3){
				alert("子女职务不能为空！");
				document.hrForm.position3.focus();
				return;
			}
			if(''==contactMode3){
				alert("子女联系方式不能为空！");
				document.hrForm.contactMode3.focus();
				return;
			}
		}
		//简历优化End	
		
		if(!checkdata("xscf")){
			alert("有无刑事处罚记录不能为空");
			return;
		}
		if(!checkdata("zqscjr")){
			alert("有无被证券市场禁入记录不能为空");
			return;
		}
		if(!checkdata("zqsckc")){
			alert("有无因违法或违纪行为被证券相关机构开除的记录不能为空");
			return;
		}
		if(!checkdata("wfgjjhsy")){
			alert("有无违反国家计划生育政策不能为空");
			return;
		}
		if(!checkdata("cjflg")){
			alert("有无参加“法轮功”等邪教组织不能为空");
			return;
		}
		if(!checkdata("sjsxjjbc")){
			alert("若离开原单位是否涉及未了手续或经济补偿不能为空");
			return;
		}
		if(!checkdata("czldgx")){
			alert("目前是否与其他单位存在劳动关系不能为空");
			return;
		}
		if(!checkdata("gptzzh")){
			alert("本人是否有无股票投资帐户不能为空");
			return;
		}
		if('1'==getcheckdata("gptzzh") && ''==document.hrForm.gdkh.value){
			alert("若有股票投资帐户，则其股东卡号不能为空！");
			return;
		}
		if(!checkdata("jdazr")){
			alert("是否可在入司后30天内将档案转入不能为空");
			return;
		}
		if('0'==getcheckdata("jdazr") && ''==document.hrForm.reason.value){
			alert("若不可在入司后30天内将档案转入，则其原因不能为空！");
			return;
		}
		
		var avocation  = document.getElementById("avocation").value.trim();
		if(pdResults(avocation)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var advantage  = document.getElementById("advantage").value.trim();
		if(pdResults(advantage)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var feebleness = document.getElementById("feebleness").value.trim();
		if(pdResults(feebleness)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var workreason = document.getElementById("workreason").value.trim();
		if(pdResults(workreason)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var otherthing = document.getElementById("otherthing").value.trim();
		if(pdResults(otherthing)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		var channelt = document.getElementById("channelt").value.trim();
		if(pdResults(channelt)){
		window.location.href="${ctx }/commons/error2.jsp";
		return;
		}
		if(avocation.length>100){
			alert("业余爱好描述字数不超过100个长度");
			document.hrForm.avocation.focus();
			return;
		}
		document.hrForm.avocation.value=replaceword(document.hrForm.avocation.value);
		if(advantage==""){
			alert("本人性格特点优势不能为空");
			document.hrForm.advantage.focus();
			return;
		}
		if(advantage.length>50){
			alert("本人性格特点优势字数不超过50个长度");
			document.hrForm.advantage.focus();
			return;
		}
		document.hrForm.advantage.value=replaceword(document.hrForm.advantage.value);
		if(feebleness==""){
			alert("本人性格特点劣势不能为空");
			document.hrForm.feebleness.focus();
			return;
		}
		if(feebleness.length>50){
			alert("本人性格特点劣势字数不超过50个长度");
			document.hrForm.feebleness.focus();
			return;
		}
		document.hrForm.feebleness.value=replaceword(document.hrForm.feebleness.value);
		if(!checkdata("jyqsgx")){
			alert("是否与公司的员工是否具有亲属关系不能为空");
			return;
		}
		if('1'==getcheckdata("jyqsgx") && ''==document.hrForm.aboutqs.value){
			alert("若与公司的员工具有亲属关系，则其姓名、所在部门以及工作岗位不能为空！");
			document.hrForm.aboutqs.focus();
			return;
		}
 		if(channelt==''){
			alert("您从哪个渠道了解到广发证券的此次招聘不能为空");
 			document.hrForm.channelt.focus();
			return;
		}else if(channelt=="-1"){
			if(''!=document.hrForm.channelStr.value){
				document.hrForm.channel.value=document.hrForm.channelStr.value;
			}else{
				alert("您从哪个渠道了解到广发证券的此次招聘不能为空");
 				document.hrForm.channelt.focus();
				return;
			}
		}else{
			document.hrForm.channel.value=document.hrForm.channelt.value;
		}
		
		if(workreason==""){
			alert("请说明申请到广发证券实习或工作的目的和理由不能为空");
 			document.hrForm.workreason.focus();
			return;
		}
		if(workreason.length>100){
			alert("请说明申请到广发证券实习或工作的目的和理由不超过100个长度");
 			document.hrForm.workreason.focus();
			return;
		}
		document.hrForm.workreason.value=replaceword(document.hrForm.workreason.value);
		if(otherthing.length>100){
			alert("其他情况说明字数不超过50个长度");
 			document.hrForm.otherthing.focus();
			return;
		}
		document.hrForm.otherthing.value=replaceword(document.hrForm.otherthing.value);
		document.hrForm.action.value=val;
		document.hrForm.submit();
	}
	
	
</script>