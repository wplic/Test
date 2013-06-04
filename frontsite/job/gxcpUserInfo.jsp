<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserBasicInfoService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserBasicInfo"/>
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
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	HrUserBasicInfoService service = (HrUserBasicInfoService)ctx.getBean("hrUserBasicInfoService");
	HrUser hrUser = (HrUser)request.getSession().getAttribute("hrUser");
	if(hrUser==null){
%>
	<script>
		alert("登陆超时,请重新登陆");
		window.location="${ctx }/job/index.jsp";
	</script>
<%
	}
	HrUserBasicInfo basicInfo = service.getBeanById(hrUser.getId());
 %>
 
 <script>
 
 	function subToPage(){
 		var name = document.hrForm.name.value;
 		var idcard = document.hrForm.idcard.value;
 		var sexc = document.hrForm.sexc;
 		var marriagec = document.hrForm.marriagec;
 		var agec = document.hrForm.agec;
 		var educationc = document.hrForm.educationc;
 		var work_expc = document.hrForm.work_expc;
 		var stationc = document.hrForm.stationc;
 		if(''==name){
 			alert("姓名不能为空！");
 			document.hrForm.name.focus();
 			return;
 		}else if(name.length>10){
 			alert("姓名长度不能超过10！");
 			document.hrForm.name.focus();
 			return;
 		}
 		if(idcard==''){
				alert("身份证号不能为空！");
 				document.hrForm.idcard.focus();
				return;
 		}
 		if(idcard.length<15||idcard.length>18){
				alert("身份证号应在15到18个长度之间！");
 				document.hrForm.idcard.focus();
				return;
 		}
 		for(var i=0,j=0;i<sexc.length;i++){
	 		if(sexc[i].checked==true){
	 			document.hrForm.sex.value=sexc[i].value;
	 		}else{
	 			j++;
	 		}
	 		if(j==sexc.length){
	 			alert("请选择性别！");
	 			return;
	 		}
 		}
 		for(var i=0,j=0;i<marriagec.length;i++){
	 		if(marriagec[i].checked==true){
	 			document.hrForm.marriage.value=marriagec[i].value;
	 		}else{
	 			j++;
	 		}
	 		if(j==marriagec.length){
	 			alert("请选择婚姻状况！");
	 			return;
	 		}
 		}
 		for(var i=0,j=0;i<agec.length;i++){
	 		if(agec[i].checked==true){
	 			document.hrForm.age.value=agec[i].value;
	 		}else{
	 			j++;
	 		}
	 		if(j==agec.length){
	 			alert("请选择年龄！");
	 			return;
	 		}
 		}
 		for(var i=0,j=0;i<educationc.length;i++){
	 		if(educationc[i].checked==true){
	 			document.hrForm.education.value=educationc[i].value;
	 		}else{
	 			j++;
	 		}
	 		if(j==educationc.length){
	 			alert("请选择文化程度！");
	 			return;
	 		}
 		}
 		for(var i=0,j=0;i<work_expc.length;i++){
	 		if(work_expc[i].checked==true){
	 			document.hrForm.work_exp.value=work_expc[i].value;
	 		}else{
	 			j++;
	 		}
	 		if(j==work_expc.length){
	 			alert("请选择全日制工作经验！");
	 			return;
	 		}
 		}
 		for(var i=0,j=0;i<stationc.length;i++){
	 		if(stationc[i].checked==true){
	 			document.hrForm.station.value=stationc[i].value;
	 		}else{
	 			j++;
	 		}
	 		if(j==stationc.length){
	 			alert("请选择应聘岗位类别！");
	 			return;
	 		}
 		}
 		document.hrForm.submit();
 	}
 </script>
</head>
<body>

<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 个性测评</div>
</div>

<div class="warp">
  <div class="bg_f5">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="4" align="center"></td>
	</tr>
	<tr>
		<td>
			<form  method="post" name="hrForm" action="${contextPath }/gxcpAction.do?method=saveOrUpdate">
              	
  
				<table align="center" border="1" width="800" cellpadding="2" cellspacing="0" class="lh30" bgcolor="#fafafa" bordercolor="#cccccc">
                 
			      <tr> 
                       <td align="right" valign="top" width="20%" class="bold"> 姓名： </td>
                       <td width="25%" align="left">
                       	<input name="name" type="text" id="name" size="20" maxlength="30" value="<%=null==basicInfo?"":basicInfo.getUserName() %>"/>
					  </td>
					<td align="right" width="25%" class="bold"> 身份证号： </td>
					<td   width="25%" align="left">
						<input name="idcard" type="text" id="idcard" size="25" maxlength="25" value="<%=null==basicInfo?"":basicInfo.getIdcard()%>"/>
                    </td>
				  </tr>
	              <tr>
	                <td align="right" valign="top" class="bold"> 性别：</td>
	                
	                <td colspan="3" align="left">
	                	<input type="hidden" name="sex" value=""/>
						<span style="height:20pt">
						男 
	                    <input type="radio" name="sexc" value="1" <%=null==basicInfo?"":"男".equals(basicInfo.getSex())?"checked":""%>/> 
	                    </span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="height:20pt">
						女 
	                    <input type="radio" name="sexc" value="2" <%=null==basicInfo?"":"女".equals(basicInfo.getSex())?"checked":""%>/>
						</span>
					</td>
                  </tr>
	              				  
                   <tr> 
                       <td align="right" valign="top" width="20%" class="bold"> 婚姻状况： </td>
                       <td colspan="3" align="left"> 
	                		<input type="hidden" name="marriage" value=""/>
							<span style="height:20pt">
							未婚 
		                         <input type="radio" name="marriagec" value="1" <%=null==basicInfo?"":"未婚".equals(basicInfo.getMarrystate())?"checked":""%>/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
							已婚 
		                       <input type="radio" name="marriagec" value="2" <%=null==basicInfo?"":"已婚".equals(basicInfo.getMarrystate())?"checked":""%>/>
							</span>
                       </td>
                     </tr>

                     <tr> 
                       <td align="right" valign="middle" width="20%" class="bold"> 年龄： </td>
                       <td  colspan="3" align="left">
	                		<input type="hidden" name="age" value=""/>
							<span style="height:20pt">
							25 岁以下 
		                       <input type="radio" name="agec" value="1"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       25 － 30 岁 
		                       <input type="radio" name="agec" value="2"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       31 － 35 岁 
		                       <input type="radio" name="agec" value="3"/>
							 </span>
		
		                       <br/>
							<span style="height:20pt">
		                       36－40 岁 
		                       <input type="radio" name="agec" value="4"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       41 － 45 岁 
		                       <input type="radio" name="agec" value="5"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		
		                       45 岁 以 上 
		                       <input type="radio" name="agec" value="6"/>			
							</span> 
						</td>                      
					</tr>
				  	<tr> 
                       <td align="right" valign="top" width="20%" class="bold"> 文化程度： </td>
                       <td  colspan="3" align="left" > 
	                		<input type="hidden" name="education" value=""/>
							<span style="height:20pt">
							本科以下 &nbsp;
		                       <input type="radio" name="educationc" value="1"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
							
		                       	本 &nbsp;&nbsp;科 
		                       <input type="radio" name="educationc" value="2"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       	硕士研究生 
		                       <input type="radio" name="educationc" value="3"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       	博士研究生 
		                       <input type="radio" name="educationc" value="4"/>						
							 </span>						
					 	</td>
                     </tr>
	
	              				  
                     					    
                     <tr> 
                       <td align="right" valign="top" width="20%" class="bold"> 全日制工作经验： </td>
                       <td  colspan="3" align="left"> 
	                		<input type="hidden" name="work_exp" value=""/>
							<span style="height:20pt">
							1 年及以下 
		                       <input type="radio" name="work_expc" value="1"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       2 － 5 年 
		                       <input type="radio" name="work_expc" value="2"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                       5 年以上 
		                       <input type="radio" name="work_expc" value="3"/> 
							 </span>
                     </td>
                     </tr>

                     <tr> 
                       <td align="right" valign="middle" width="20%" class="bold"> 应聘岗位类别： </td>
                       <td  colspan="3"  align="left">
	                		<input type="hidden" name="station" value=""/>
							<span style="height:20pt">
							   经纪业务类 
							   <input type="radio" name="stationc" value="1"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
							   投资银行类 
							   <input type="radio" name="stationc" value="2"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
							   研 究 类 
							   <input type="radio" name="stationc" value="3"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                          财务审计类 
							   <input type="radio" name="stationc" value="4"/>
							</span>   
							   <br/>
							<span style="height:20pt">
							   行政管理类 
							   <input type="radio" name="stationc" value="5"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
							   营 销  类  &nbsp;  
							   <input type="radio" name="stationc" value="6"/>
							 </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="height:20pt">
		                          其 他 类 
							   <input type="radio" name="stationc" value="7"/>
							 </span>  
					 </td>
                     </tr>
				  	<tr align="center"> 
                       <td colspan="4" valign="top"> （请检查以上信息填写的完整性和正确性，然后按提交键） </td>
                     </tr>
				  	
                     <tr> 
                       <td colspan="15" align="center" >												
					  	<input name="Submit" type="button" class="bu08" value=" 提 交 " onclick="subToPage()"/>					   
				   		 </td>
                     </tr>
                </table>
		   
	</form>
 </td>
 </tr>
</table> 
</div>
<div class="blank5"></div>
</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>