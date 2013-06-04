<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserBasicInfoService"/>
<jsp:directive.page import="com.cssweb.common.dictionary.service.DictionaryService"/>
<jsp:directive.page import="com.cssweb.common.dictionary.pojo.Dictionary"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserBasicInfo"/>
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.cssweb.hr.service.HrUserFamilyService"%>
<%@page import="com.cssweb.hr.pojo.HrUserFamily"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
		List universityList =	dictionaryService.getDictionaryByParentKeyCode("university");
		List specialtyList =	dictionaryService.getDictionaryByParentKeyCode("specialty");
		List hrProvinceList =	dictionaryService.getDictionaryByParentKeyCode("hrProvince");
%>
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
	<script type="text/javascript" src="${contextPath }/js/jquery-1.4.4.min.js"></script>
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
	HrUserBasicInfoService service = (HrUserBasicInfoService)ctx.getBean("hrUserBasicInfoService");
	HrUserFamilyService familyService = (HrUserFamilyService)ctx.getBean("hrUserFamilyService");
	HrUserBasicInfo basicInfo = new HrUserBasicInfo();
	List familyList = new ArrayList();
	if(hrUser!=null){
		if(null!=request.getAttribute("basicInfo")){
			basicInfo = (HrUserBasicInfo)request.getAttribute("basicInfo");
		}else{
			basicInfo = service.getBeanById(hrUser.getId());
		}
		if(null==basicInfo){
			%>
				<script>
					alert("简历资料的完整、准确和真实是简历审阅通过的基本前提，请您认真填写！");
				</script>
			<%
		}
	}
	pageContext.setAttribute("basicInfo",basicInfo);
	String _bornaddr = "";
	String _bornaddrcity = "";
	if(null!=basicInfo && null!=basicInfo.getBornaddr()){
    	_bornaddr = basicInfo.getBornaddr();
    	if(null==_bornaddr)
    		_bornaddr = "";
    }
	String _nowaddr = "";
	String _nowaddrcity = "";
	if(null!=basicInfo && null!=basicInfo.getNowaddr()){
    	_nowaddr = basicInfo.getNowaddr();
    	if(null==_nowaddr)
    		_nowaddr = "";
    }
	String _hopeaddr = "";
	if(null!=basicInfo && null!=basicInfo.getHopeworkaddr()){
    	_hopeaddr = basicInfo.getHopeworkaddr();
    	if(null==_hopeaddr)
    		_hopeaddr = "";
    }
   	String[] _addrs = _hopeaddr.split("/");
   	String _addr1 = "";
   	String _addr1city = "";
   	String _addr2 = "";
   	String _addr2city = "";
   	String _addr3 = "";
   	String _addr3city = "";
   	if(_addrs.length==1)
   		_addr1 = _addrs[0].trim();
   	if(_addrs.length==2){
   		_addr1 = _addrs[0].trim();
   		_addr2 = _addrs[1].trim();
   	}
   	if(_addrs.length==3){
   		_addr1 = _addrs[0].trim();
   		_addr2 = _addrs[1].trim();
   		_addr3 = _addrs[2].trim();
   	}
    	
    String procode = null;
    String citycode = null;
    List cityList =	null;
 %>
 
 <script language="javascript">
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
 	function showImg(obj)
	{
	    imgSrcPath = obj.value ;
	   if ( imgSrcPath != ""){
	    document.getElementById('disImage').innerHTML ='<img src="'+imgSrcPath+'"   width="85" height="115"/>';
	  }else{
	    document.getElementById('disImage').innerHTML ='<img src="/pic/job/photo.jpg"  />';
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
 	function showCount(obj,value1,value2)
	{
		if(obj.value.indexOf('分数')>=0){
	    	document.getElementById(value1).style.display ='block';
	    }else{
	    	document.getElementById(value1).style.display ='none';
	    }
	    document.getElementById(value2).value ='';
	}	    
	function showTzzxzgno(obj){
		if(1==obj){
			document.getElementById("tzzxzgnospan").style.display ='block';
		}else{
			document.getElementById("tzzxzgnospan").style.display ='none';
			document.getElementById("tzzxzgno").value ='';
		}
	}
	function getCity(provinceId,type){
	    sendRequest("${ctx}/hrUserAction.do?method=getCityList&provinceId="+provinceId,type); 
	}
	function createXMLHttpRequest(){
 		     if (window.XMLHttpRequest) { 
	　　 	XMLHttpReq = new XMLHttpRequest(); 
	　　 }else if (window.ActiveXObject) { 
	　　 	XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
	　　 } 
	}
	function sendRequest(url,type){
		createXMLHttpRequest();
		XMLHttpReq.open("GET",url,true);
		if(type==1){
			XMLHttpReq.onreadystatechange=completeCity1;
		}else if(type==2){
			XMLHttpReq.onreadystatechange=completeCity2;
		}else if(type==3){
			XMLHttpReq.onreadystatechange=completeCity3;
		}else if(type==4){
			XMLHttpReq.onreadystatechange=completeCity4;
		}else if(type==5){
			XMLHttpReq.onreadystatechange=completeCity5;
		}
		XMLHttpReq.send(null);
	
	}
		/**
		 * query XML
		 *
		 */
	function completeCity1(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var city = XMLHttpReq.responseXML.getElementsByTagName("city");
			　　 var cityIds = new Array();
				var cityNames = new Array();
			　　 for(var i = 0;i < city.length; i++){
					cityIds[i] = city[i].childNodes[0].firstChild.data;
					cityNames[i] = city[i].childNodes[1].firstChild.data;
			　　 }
			　　 buildSelect(cityIds, cityNames, document.getElementById("csdCity"));
		　　 }
	　　 }
	}
	function completeCity2(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var city = XMLHttpReq.responseXML.getElementsByTagName("city");
			　　 var cityIds = new Array();
				var cityNames = new Array();
			　　 for(var i = 0;i < city.length; i++){
					cityIds[i] = city[i].childNodes[0].firstChild.data;
					cityNames[i] = city[i].childNodes[1].firstChild.data;
			　　 }
			　　 buildSelect(cityIds, cityNames, document.getElementById("nowCity"));
		　　 }
	　　 }
	}
	function completeCity3(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var city = XMLHttpReq.responseXML.getElementsByTagName("city");
			　　 var cityIds = new Array();
				var cityNames = new Array();
			　　 for(var i = 0;i < city.length; i++){
					cityIds[i] = city[i].childNodes[0].firstChild.data;
					cityNames[i] = city[i].childNodes[1].firstChild.data;
			　　 }
			　　 buildSelect(cityIds, cityNames, document.getElementById("hopeCity1"));
		　　 }
	　　 }
	}
	function completeCity4(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var city = XMLHttpReq.responseXML.getElementsByTagName("city");
			　　 var cityIds = new Array();
				var cityNames = new Array();
			　　 for(var i = 0;i < city.length; i++){
					cityIds[i] = city[i].childNodes[0].firstChild.data;
					cityNames[i] = city[i].childNodes[1].firstChild.data;
			　　 }
			　　 buildSelect(cityIds, cityNames, document.getElementById("hopeCity2"));
		　　 }
	　　 }
	}
	function completeCity5(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
			　　 var city = XMLHttpReq.responseXML.getElementsByTagName("city");
			　　 var cityIds = new Array();
				var cityNames = new Array();
			　　 for(var i = 0;i < city.length; i++){
					cityIds[i] = city[i].childNodes[0].firstChild.data;
					cityNames[i] = city[i].childNodes[1].firstChild.data;
			　　 }
			　　 buildSelect(cityIds, cityNames, document.getElementById("hopeCity3"));
		　　 }
	　　 }
	}
		/**
		 * print select
		 *
		 */
	function buildSelect(cityIds, cityNames, select) {
	　　 select.options.length = 0;
		//select.options[0] = new Option("全部", "-1");
		if(cityNames.length>0){
		　　 select.options[select.options.length] = new Option('', '');
		　　 for(var i = 1;i <= cityNames.length; i++) {
		　　 	select.options[select.options.length] = new Option(cityNames[i-1], cityNames[i-1]);
			}
		　　 select.options[select.options.length] = new Option('其他', '-1');
		}
	}
	function onSub(action){
		var form = document.hrForm;
		form.action.value=action;
 		if(''==document.hrForm.userName.value){
 			alert("姓名不能为空！");
 			document.hrForm.userName.focus();
 			return false;
 		}
 		var inviteTypet = document.hrForm.inviteTypet.value;
 		if(inviteTypet==''){
			alert("应聘类型不能为空");
 			document.hrForm.inviteTypet.focus();
			return;
		}else if(inviteTypet=="-1"){
			if(''!=document.hrForm.inviteTypeStr.value){
				document.hrForm.inviteType.value=document.hrForm.inviteTypeStr.value;
			}else{
				alert("应聘类型不能为空");
 				document.hrForm.inviteTypet.focus();
				return;
			}
		}else{
			document.hrForm.inviteType.value=document.hrForm.inviteTypet.value;
		}
		if(''==document.hrForm.picId.value||document.hrForm.picId.value<=0){
 			alert("请必须上传相片！");
 			document.hrForm.birthdayStr.focus();
 			return false;
 		}
 		if(''==document.hrForm.sex.value){
 			alert("性别不能为空！");
 			document.hrForm.sex.focus();
 			return false;
 		}
 		if(''==document.hrForm.birthdayStr.value){
 			alert("出生日期不能为空！");
 			document.hrForm.birthdayStr.focus();
 			return false;
 		}
 		if(''==document.hrForm.stature.value){
 			alert("身高不能为空！");
 			document.hrForm.stature.focus();
 			return false;
 		}
 		if(''==document.hrForm.weight.value){
 			alert("体重不能为空！");
 			document.hrForm.weight.focus();
 			return false;
 		}
 		if(''==document.hrForm.minzu.value){
 			alert("民族不能为空！");
 			document.hrForm.minzu.focus();
 			return false;
 		}
 		var zzmmt = document.hrForm.zzmmt.value;
 		if(zzmmt==""){
			alert("政治面貌不能为空");
 			document.hrForm.zzmmt.focus();
			return;
		}else if(zzmmt=="-1"){
			if(''!=document.hrForm.zzmmStr.value){
				document.hrForm.zzmm.value=document.hrForm.zzmmStr.value;
			}else{
				alert("政治面貌不能为空");
 				document.hrForm.zzmmt.focus();
				return;
			}
		}else{
			document.hrForm.zzmm.value=document.hrForm.zzmmt.value;
		}
		//出生地
		var bornaddr = "";
		if(''==form.csdProvince.value){
			alert("出生地不能为空！");
 			document.hrForm.csdProvince.focus();
			return;
		}else if('-1'==form.csdProvince.value){
			bornaddr = form.csdProvinceStr.value;
		}else{
			bornaddr = form.csdProvince.options[form.csdProvince.selectedIndex].text;
		}
		if('-1'==form.csdCity.value){
			bornaddr = bornaddr + form.csdCityStr.value;
		}else if(''!=form.csdCity.value){
			bornaddr = bornaddr + form.csdCity.options[form.csdCity.selectedIndex].text;
		}
		form.bornaddr.value=bornaddr;
 		if(''==document.hrForm.idcard.value){
 			alert("身份证号不能为空！");
 			document.hrForm.idcard.focus();
 			return false;
 		}
 		if(''==document.hrForm.marrystate.value){
 			alert("婚姻状况不能为空！");
 			document.hrForm.marrystate.focus();
 			return false;
 		}
 		var worktimet = document.hrForm.worktimet.value;
 		if(worktimet==""){
				alert("工作年限不能为空");
 				document.hrForm.worktimet.focus();
				return;
		}else if(worktimet=="-1"){
			if(''!=document.hrForm.worktimeStr.value){
				document.hrForm.worktime.value=document.hrForm.worktimeStr.value;
			}else{
				alert("工作年限不能为空");
 				document.hrForm.worktimet.focus();
				return;
			}
		}else{
			document.hrForm.worktime.value=document.hrForm.worktimet.value;
		}
		//现在所在地
		var nowaddr = "";
		if(''==form.nowProvince.value){
			alert("现所在地不能为空！");
 				document.hrForm.nowProvince.focus();
			return;
		}else if('-1'==form.nowProvince.value){
			nowaddr = form.nowProvinceStr.value;
		}else{
			nowaddr = form.nowProvince.options[form.nowProvince.selectedIndex].text;
		}
		if('-1'==form.nowCity.value){
			nowaddr = nowaddr + form.nowCityStr.value;
		}else if(''!=form.nowCity.value){
			nowaddr = nowaddr + form.nowCity.options[form.nowCity.selectedIndex].text;
		}
		form.nowaddr.value=nowaddr;
 		var highdegreet = document.hrForm.highdegreet.value;
 		if(highdegreet==""){
				alert("最高学位不能为空");
 				document.hrForm.highdegreet.focus();
				return;
		}else if(highdegreet=="-1"){
			if(''!=document.hrForm.highdegreeStr.value){
				document.hrForm.highdegree.value=document.hrForm.highdegreeStr.value;
			}else{
				alert("最高学位不能为空");
 				document.hrForm.highdegreet.focus();
				return;
			}
		}else{
			document.hrForm.highdegree.value=document.hrForm.highdegreet.value;
		}
 		var highxlt = document.hrForm.highxlt.value;
 		if(highxlt==""){
				alert("最高学历不能为空");
 				document.hrForm.highxlt.focus();
				return;
		}else if(highxlt=="-1"){
			if(''!=document.hrForm.highxlStr.value){
				document.hrForm.highxl.value=document.hrForm.highxlStr.value;
			}else{
				alert("最高学历不能为空");
 				document.hrForm.highxlt.focus();
				return;
			}
		}else{
			document.hrForm.highxl.value=document.hrForm.highxlt.value;
		}
 		var specialtypet = document.hrForm.specialtypet.value;
 		if(specialtypet==""){
				alert("专业类别不能为空");
 				document.hrForm.specialtypet.focus();
				return;
		}else if(specialtypet=="-1"){
			if(''!=document.hrForm.specialtypeStr.value){
				document.hrForm.specialtype.value=document.hrForm.specialtypeStr.value;
			}else{
				alert("专业类别不能为空");
 				document.hrForm.specialtypet.focus();
				return;
			}
		}else{
			document.hrForm.specialtype.value=document.hrForm.specialtypet.value;
		}
 		var schoolt = document.hrForm.schoolt.value;
 		if(schoolt==""){
				alert("毕业院校不能为空");
 				document.hrForm.schoolt.focus();
				return;
		}else if(schoolt=="-1"){
			if(''!=document.hrForm.schoolStr.value){
				document.hrForm.school.value=document.hrForm.schoolStr.value;
			}else{
				alert("毕业院校不能为空");
 				document.hrForm.schoolt.focus();
				return;
			}
		}else{
			document.hrForm.school.value=document.hrForm.schoolt.value;
		}
 		var graduateyeart = document.hrForm.graduateyeart.value;
 		if(graduateyeart==""){
				alert("毕业时间年份不能为空");
 				document.hrForm.graduateyeart.focus();
				return;
		}else if(graduateyeart=="-1"){
			if(''!=document.hrForm.graduateyearStr.value){
				document.hrForm.graduateyear.value=document.hrForm.graduateyearStr.value;
			}else{
				alert("毕业时间年份不能为空");
 				document.hrForm.graduateyeart.focus();
				return;
			}
		}else{
			document.hrForm.graduateyear.value=document.hrForm.graduateyeart.value;
		}
 		if(''==document.hrForm.paywant.value){
 			alert("月薪要求不能为空！");
 			document.hrForm.paywant.focus();
 			return false;
 		}
 		if(''==document.hrForm.docuaddr.value){
 			alert("档案所在地不能为空！");
 			document.hrForm.docuaddr.focus();
 			return false;
 		}
 		if(''==document.hrForm.hukouaddr.value){
 			alert("户口所在地不能为空！");
 			document.hrForm.hukouaddr.focus();
 			return false;
 		}
		//希望工作地
		var hopeworkaddr = "";
		if(''!=form.hopeProvince1.value){
			if('-1'==form.hopeProvince1.value){
				hopeworkaddr = form.hopeProvinceStr1.value;
			}else{
				hopeworkaddr = form.hopeProvince1.options[form.hopeProvince1.selectedIndex].text;
			}
		}
		if('-1'==form.hopeCity1.value){
			hopeworkaddr = hopeworkaddr + form.hopeCityStr1.value;
		}else if(''!=form.hopeCity1.value){
			hopeworkaddr = hopeworkaddr + form.hopeCity1.options[form.hopeCity1.selectedIndex].text;
		}
		if(''!=form.hopeProvince2.value){
			if('-1'==form.hopeProvince2.value){
				hopeworkaddr = hopeworkaddr + ' / '+form.hopeProvinceStr2.value;
			}else{
				hopeworkaddr = hopeworkaddr + ' / '+form.hopeProvince2.options[form.hopeProvince2.selectedIndex].text;
			}
		}
		if('-1'==form.hopeCity2.value){
			hopeworkaddr = hopeworkaddr + form.hopeCityStr2.value;
		}else if(''!=form.hopeCity2.value){
			hopeworkaddr = hopeworkaddr + form.hopeCity2.options[form.hopeCity2.selectedIndex].text;
		}
		if(''!=form.hopeProvince3.value){
			if('-1'==form.hopeProvince3.value){
				hopeworkaddr = hopeworkaddr + ' / '+form.hopeProvinceStr3.value;
			}else{
				hopeworkaddr = hopeworkaddr + ' / '+form.hopeProvince3.options[form.hopeProvince3.selectedIndex].text;
			}
		}
		if('-1'==form.hopeCity3.value){
			hopeworkaddr = hopeworkaddr + form.hopeCityStr3.value;
		}else if(''!=form.hopeCity3.value){
			hopeworkaddr = hopeworkaddr + form.hopeCity3.options[form.hopeCity3.selectedIndex].text;
		}
		if(""==hopeworkaddr){
 			alert("希望工作地不能为空！");
 			return false;
		}
		form.hopeworkaddr.value=hopeworkaddr;
 		if(''==document.hrForm.mobil.value){
 			alert("移动电话不能为空！");
 			document.hrForm.mobil.focus();
 			return false;
 		}
 		if(''==document.hrForm.urgentphone.value){
 			alert("紧急联系电话不能为空！");
 			document.hrForm.urgentphone.focus();
 			return false;
 		}
 		if(''==document.hrForm.curentaddr.value){
 			alert("目前通信地址不能为空！");
 			document.hrForm.curentaddr.focus();
 			return false;
 		}
 		if(''==document.hrForm.post.value){
 			alert("邮编不能为空！");
 			document.hrForm.post.focus();
 			return false;
 		}
 		if(document.hrForm.strongskill.value.length>100){
 			alert("专业特长描述不能超过100个长度！");
 			document.strongskill.email.focus();
 			return false;
 		}
 		document.hrForm.strongskill.value=replaceword(document.hrForm.strongskill.value);
 		if(document.hrForm.course.value.length>100){
 			alert("所学课程及成绩描述不能超过100个长度！");
 			document.hrForm.course.focus();
 			return false;
 		}
 		
 		
 		//本科毕业学校
 		var undergraduateSchool = document.hrForm.unschoolt.value;
 		if(undergraduateSchool==""){
				alert("本科学校不能为空");
 				document.hrForm.unschoolt.focus();
				return;
		}else if(undergraduateSchool=="-1"){
			if(''!=document.hrForm.undergraduateSchoolStr.value){
				document.hrForm.undergraduateSchool.value=document.hrForm.undergraduateSchoolStr.value;
			}else{
				alert("本科学校不能为空");
 				document.hrForm.undergraduateSchool.focus();
				return;
			}
		}else{
			document.hrForm.undergraduateSchool.value=document.hrForm.unschoolt.value;
		}
 		
 		
 		//本科专业类别
 		var undergraduateSjType = document.hrForm.undergraduateSjTypet.value;
 		if(undergraduateSjType==""){
				alert("本科专业不能为空");
 				document.hrForm.undergraduateSjTypet.focus();
				return;
		}else if(undergraduateSjType=="-1"){
			if(''!=document.hrForm.undergraduateSjTypeStr.value){
				document.hrForm.undergraduateSjType.value=document.hrForm.undergraduateSjTypeStr.value;
			}else{
				alert("本科专业不能为空");
 				document.hrForm.undergraduateSjType.focus();
				return;
			}
		}else{
			document.hrForm.undergraduateSjType.value=document.hrForm.undergraduateSjTypet.value;
		}
 		
 		document.hrForm.course.value=replaceword(document.hrForm.course.value);
		form.submit();
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
	
	function showkjdiv(o){
		var obj = document.getElementById('kjdiv');
		if(o.checked){
			obj.style.display="block";
		} else {
			obj.style.display="none";
			for(var i = 1; i<=7; i++){
				document.getElementById("zckjs" + i).checked = false;
			}
		}
	}
 </script>
	
</head>

<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 简历投递系统</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="application_lmenu.jsp">
			<jsp:param value="basicinfo" name="nav1"/>
		</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>我的简历</h4></div>
<p class="inden25 lh30 cuxuxianb"><span class="red">填写提示：</span>为了您的简历能被正常检索，请按照流程尽量详细填写您的个人信息，<span class="red">*</span>所指明的是必填的内容</p>
<div class="clearfloat"></div>
<form action="${ctx }/hrUserAction.do?method=saveHrUserBasic&nav=<%=nav %>" class="required-validate" method="post" name="hrForm" >
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">基本信息</strong></td>
  </tr>
</table>
<table width="100%" border="0" align="center"  class="lh30">
  <tr>
    <td width="13%" align="right"><span class="red">*</span>姓名：</td>
    <td width="32%"><input name="userName" value="${basicInfo.userName }" type="text"  id="userName" class="validate-chinese max-length-15"/>
      <span class="font_73">(真实姓名)</span></td>
    <td width="13%">&nbsp;</td>
    <td rowspan="4" id="disImage"  align="left">
		<input type="hidden" name="picId" id="picId" value="${basicInfo.picId }"/>
		<iframe width="260" src="${contextPath}/job/uploadPhoto.jsp?picid=${basicInfo.picId}&userid=${basicInfo.userId}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="fundSort" name="fundSort" ></iframe>
    </td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>应聘类型：</td>
    <td><input type="hidden" name="inviteType" value="${basicInfo.inviteType}"/>
    	<select name="inviteTypet" id="inviteTypet" class="w123" onchange="showStr(this,'inviteTypeStr')">
			<option value="">请选择...</option>
    		<option value="在校生" <c:if test="${basicInfo.inviteType eq '在校生' }">selected</c:if> >在校生</option>
    		<option value="非在校生" <c:if test="${basicInfo.inviteType eq '非在校生' }">selected</c:if>>非在校生</option>
    		<option value="-1" <c:if test="${basicInfo.inviteType eq '-1' }">selected</c:if>>其他</option>
    	</select>
    </td>
    
  </tr>
  <tr style="display:none" id="inviteTypeStr">
    <td align="right">&nbsp;</td>
    <td colspan="2">请填写相应的内容：<input name="inviteTypeStr" type="text" class="w123" value="${basicInfo.inviteType}" maxlength="10"/><span class="red">(10字内)</span>
    <%
    if(null!=basicInfo){
    %>
    	<script language="javascript">
    		if(document.hrForm.inviteTypet.value==''){
    			document.getElementById("inviteTypeStr").style.display='block';
	    		document.hrForm.inviteTypet.value = '-1';
    		}
    	</script>
    <%}%>
    </td>
  </tr>
  <tr >
    <td align="right"><span class="red">*</span>免冠证件照：</td>
    <td colspan="2"  style="line-height:15px">
		上传近期免冠证件照，文件大小不超过200k，
		(请上传小写jpg,jpeg,gif,png格式的图像文件，且不要用汉字的文件名)
	</td>
   </tr>
   <tr >
   		<td align="right">&nbsp;</td>
   		<td colspan="2"  style="line-height:15px">
			&nbsp;
		</td>
	</tr>
  <tr>
    <td align="right"><span class="red">*</span>性别：</td>
    <td><select name="sex" id="sex" >
	  <option value="">请选择...</option>
      <option value="男" <c:if test="${basicInfo.sex eq '男' }">selected</c:if>>男</option>
      <option value="女" <c:if test="${basicInfo.sex eq '女' }">selected</c:if>>女</option>
    </select></td>
    
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">*</span>出生日期：<input name="birthdayStr" type="text" readonly="readonly" id="birthdayStr" class="w123"
    <c:if test="${basicInfo.birthday !=null }">
    	value="<bean:write name="basicInfo" property="birthday" format="yyyy-MM-dd"/>"
    </c:if>
    />
    <a href="javascript:void(0)" onclick="gfPop.fStartPop(document.hrForm.birthdayStr,0);return false;" HIDEFOCUS><img src="/pic/job/selectTime.gif" align="middle" /></a>
      </td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>民族：</td>
    <td>
    	<select name="minzu" id="minzu" class="w123" onchange="showStr(this,'minzuStr')">
			<option value="">请选择...</option>
    		<option value="汉族" <c:if test="${basicInfo.minzu eq '汉族' }">selected</c:if> >汉族</option>
    		<option value="回族" <c:if test="${basicInfo.minzu eq '回族' }">selected</c:if> >回族</option>
    		<option value="维吾尔族" <c:if test="${basicInfo.minzu eq '维吾尔族' }">selected</c:if> >维吾尔族</option>
    		<option value="彝族" <c:if test="${basicInfo.minzu eq '彝族' }">selected</c:if> >彝族</option>
    		<option value="布依族" <c:if test="${basicInfo.minzu eq '布依族' }">selected</c:if> >布依族</option>
    		<option value="满族" <c:if test="${basicInfo.minzu eq '满族' }">selected</c:if> >满族</option>
    		<option value="满族" <c:if test="${basicInfo.minzu eq '满族' }">selected</c:if> >满族</option>
    		<option value="土家族" <c:if test="${basicInfo.minzu eq '土家族' }">selected</c:if> >土家族</option>
    		<option value="哈萨克族" <c:if test="${basicInfo.minzu eq '哈萨克族' }">selected</c:if> >哈萨克族</option>
    		<option value="黎族" <c:if test="${basicInfo.minzu eq '黎族' }">selected</c:if> >黎族</option>
    		<option value="佤族" <c:if test="${basicInfo.minzu eq '佤族' }">selected</c:if> >佤族</option>
    		<option value="高山族" <c:if test="${basicInfo.minzu eq '高山族' }">selected</c:if> >高山族</option>
    		<option value="水族" <c:if test="${basicInfo.minzu eq '水族' }">selected</c:if> >水族</option>
    		<option value="纳西族" <c:if test="${basicInfo.minzu eq '纳西族' }">selected</c:if> >纳西族</option>
    		<option value="柯尔克孜族" <c:if test="${basicInfo.minzu eq '柯尔克孜族' }">selected</c:if> >柯尔克孜族</option>
    		<option value="达斡尔族" <c:if test="${basicInfo.minzu eq '达斡尔族' }">selected</c:if> >达斡尔族</option>
    		<option value="羌族" <c:if test="${basicInfo.minzu eq '羌族' }">selected</c:if> >羌族</option>
    		<option value="撒拉族" <c:if test="${basicInfo.minzu eq '撒拉族' }">selected</c:if> >撒拉族</option>
    		<option value="仡佬族" <c:if test="${basicInfo.minzu eq '仡佬族' }">selected</c:if> >仡佬族</option>
    		<option value="阿昌族" <c:if test="${basicInfo.minzu eq '阿昌族' }">selected</c:if> >阿昌族</option>
    		<option value="塔吉克族" <c:if test="${basicInfo.minzu eq '塔吉克族' }">selected</c:if> >塔吉克族</option>
    		<option value="乌孜别克族" <c:if test="${basicInfo.minzu eq '乌孜别克族' }">selected</c:if> >乌孜别克族</option>
    		<option value="鄂温克族" <c:if test="${basicInfo.minzu eq '鄂温克族' }">selected</c:if> >鄂温克族</option>
    		<option value="保安族" <c:if test="${basicInfo.minzu eq '保安族' }">selected</c:if> >保安族</option>
    		<option value="京族" <c:if test="${basicInfo.minzu eq '京族' }">selected</c:if> >京族</option>
    		<option value="独龙族" <c:if test="${basicInfo.minzu eq '独龙族' }">selected</c:if> >独龙族</option>
    		<option value="赫哲族" <c:if test="${basicInfo.minzu eq '赫哲族' }">selected</c:if> >赫哲族</option>
    		<option value="珞巴族" <c:if test="${basicInfo.minzu eq '珞巴族' }">selected</c:if> >珞巴族</option>
    		<option value="蒙古族" <c:if test="${basicInfo.minzu eq '蒙古族' }">selected</c:if> >蒙古族</option>
    		<option value="藏族" <c:if test="${basicInfo.minzu eq '藏族' }">selected</c:if> >藏族</option>
    		<option value="苗族" <c:if test="${basicInfo.minzu eq '苗族' }">selected</c:if> >苗族</option>
    		<option value="壮族" <c:if test="${basicInfo.minzu eq '壮族' }">selected</c:if> >壮族</option>
    		<option value="朝鲜族" <c:if test="${basicInfo.minzu eq '朝鲜族' }">selected</c:if> >朝鲜族</option>
    		<option value="侗族" <c:if test="${basicInfo.minzu eq '侗族' }">selected</c:if> >侗族</option>
    		<option value="白族" <c:if test="${basicInfo.minzu eq '白族' }">selected</c:if> >白族</option>
    		<option value="哈尼族" <c:if test="${basicInfo.minzu eq '哈尼族' }">selected</c:if> >哈尼族</option>
    		<option value="傣族" <c:if test="${basicInfo.minzu eq '傣族' }">selected</c:if> >傣族</option>
    		<option value="傈僳族" <c:if test="${basicInfo.minzu eq '傈僳族' }">selected</c:if> >傈僳族</option>
    		<option value="畲族" <c:if test="${basicInfo.minzu eq '畲族' }">selected</c:if> >畲族</option>
    		<option value="拉祜族" <c:if test="${basicInfo.minzu eq '拉祜族' }">selected</c:if> >拉祜族</option>
    		<option value="东乡族" <c:if test="${basicInfo.minzu eq '东乡族' }">selected</c:if> >东乡族</option>
    		<option value="景颇族" <c:if test="${basicInfo.minzu eq '景颇族' }">selected</c:if> >景颇族</option>
    		<option value="土族" <c:if test="${basicInfo.minzu eq '土族' }">selected</c:if> >土族</option>
    		<option value="仫佬族" <c:if test="${basicInfo.minzu eq '仫佬族' }">selected</c:if> >仫佬族</option>
    		<option value="布朗族" <c:if test="${basicInfo.minzu eq '布朗族' }">selected</c:if> >布朗族</option>
    		<option value="毛南族" <c:if test="${basicInfo.minzu eq '毛南族' }">selected</c:if> >毛南族</option>
    		<option value="锡伯族" <c:if test="${basicInfo.minzu eq '锡伯族' }">selected</c:if> >锡伯族</option>
    		<option value="普米族" <c:if test="${basicInfo.minzu eq '普米族' }">selected</c:if> >普米族</option>
    		<option value="怒族" <c:if test="${basicInfo.minzu eq '怒族' }">selected</c:if> >怒族</option>
    		<option value="俄罗斯族" <c:if test="${basicInfo.minzu eq '俄罗斯族' }">selected</c:if> >俄罗斯族</option>
    		<option value="德昂族" <c:if test="${basicInfo.minzu eq '德昂族' }">selected</c:if> >德昂族</option>
    		<option value="裕固族" <c:if test="${basicInfo.minzu eq '裕固族' }">selected</c:if> >裕固族</option>
    		<option value="塔塔尔族" <c:if test="${basicInfo.minzu eq '塔塔尔族' }">selected</c:if> >塔塔尔族</option>
    		<option value="鄂伦春族" <c:if test="${basicInfo.minzu eq '鄂伦春族' }">selected</c:if> >鄂伦春族</option>
    		<option value="门巴族" <c:if test="${basicInfo.minzu eq '门巴族' }">selected</c:if> >门巴族</option>
    		<option value="基诺族" <c:if test="${basicInfo.minzu eq '基诺族' }">selected</c:if> >基诺族</option>
    		
    		
    		<option value="-1" <c:if test="${basicInfo.minzu eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="minzuStr">
    		请填写相应的内容：<br/><input name="minzuStr" type="text" class="w123" value="${basicInfo.minzu}" maxlength="10"/><span class="red">请填写</span>
    	</span>
    </td>
    <td align="right"><span class="red">*</span>政治面貌：</td>
    <td><input type="hidden" name="zzmm" value="${basicInfo.zzmm}"/>
    	<select name="zzmmt" id="zzmmt" class="w123" onchange="showStr(this,'zzmmStr')">
			<option value="">请选择...</option>
    		<option value="群众" <c:if test="${basicInfo.zzmm eq '群众' }">selected</c:if> >群众</option>
    		<option value="共青团员" <c:if test="${basicInfo.zzmm eq '共青团员' }">selected</c:if>>共青团员</option>
    		<option value="中国共产党 " <c:if test="${basicInfo.zzmm eq '中国共产党' }">selected</c:if>>中国共产党</option>
    		<option value="中国农工民主党 " <c:if test="${basicInfo.zzmm eq '中国农工民主党' }">selected</c:if>>中国农工民主党</option>
    		<option value="中国国民党革命委员会 " <c:if test="${basicInfo.zzmm eq '中国国民党革命委员会' }">selected</c:if>>中国国民党革命委员会</option>
    		<option value="中国民主同盟 " <c:if test="${basicInfo.zzmm eq '中国民主同盟' }">selected</c:if>>中国民主同盟</option>
    		<option value="中国民主建国会 " <c:if test="${basicInfo.zzmm eq '民主党派' }">selected</c:if>>民主党派</option>
    		<option value="中国致公党 " <c:if test="${basicInfo.zzmm eq '中国致公党' }">selected</c:if>>中国致公党</option>
    		<option value="九三学社 " <c:if test="${basicInfo.zzmm eq '九三学社' }">selected</c:if>>九三学社</option>
    		<option value="台湾民主自治同盟 " <c:if test="${basicInfo.zzmm eq '台湾民主自治同盟' }">selected</c:if>>台湾民主自治同盟</option>
    		<option value="民主促进会 " <c:if test="${basicInfo.zzmm eq '民主促进会' }">selected</c:if>>民主促进会</option>
    		<option value="民主党派" <c:if test="${basicInfo.zzmm eq '民主党派' }">selected</c:if>>民主党派</option>
    		<option value="-1" <c:if test="${basicInfo.zzmm eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="zzmmStr">
    		<input name="zzmmStr" type="text" class="w123" value="${basicInfo.zzmm}" maxlength="10"/><span class="red">(请填10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.zzmmt.value==''){
	    			document.getElementById("zzmmStr").style.display='block';
	    			document.hrForm.zzmmt.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>出生地：</td>
    <td><input name="bornaddr" type="hidden" class="w123" value="${basicInfo.bornaddr}" maxlength="10"/>
    	<select name="csdProvince" id="csdProvince" class="w66" onchange="getCity(this.value,1),showStr(this,'csdProvinceStr')">
			<option value="">请选择...</option>
    	<%if(null!=hrProvinceList && hrProvinceList.size()>0){
    		for(int i=0;i<hrProvinceList.size();i++){
    			Dictionary dic = (Dictionary)hrProvinceList.get(i);
    			if(_bornaddr.indexOf(dic.getKeyName())>=0 && !_bornaddr.equals(dic.getKeyName())){
    				procode = dic.getKeyCode();
    				_bornaddrcity = _bornaddr.substring(dic.getKeyName().length());
    			}%>
	      		<option value="<%=dic.getKeyCode()%>" <%=_bornaddr.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.specialtype eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<select name="csdCity" id="csdCity" class="w66" onchange="showStr(this,'csdCityStr')">
			<option value="">请选择...</option>
    	<%
    		if(null!=procode)
    			cityList = dictionaryService.getDictionaryByParentKeyCode(procode);
    		if(null!=cityList && cityList.size()>0){
    			for(int i=0;i<cityList.size();i++){
    				Dictionary dic = (Dictionary)cityList.get(i);
    	%>
    			<option value="<%=dic.getKeyName()%>" <%=_bornaddr.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
    	<%		}
    	%>
    			<option value="-1">其他</option>
    	<%
    		}
    		procode = null;
    		cityList = null;
    	%>
    	</select>
    	<span style="display:none" id="csdProvinceStr">
    		<input name="csdProvinceStr" type="text" class="w123" value="${basicInfo.bornaddr}" maxlength="10"/><span class="red">(请填10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.csdProvince.value==''){
	    			document.getElementById("csdProvinceStr").style.display='block';
	    			document.hrForm.csdProvince.value = '-1';
	    		}
	    	</script>
	    <%}%>
    	<span style="display:none" id="csdCityStr">
    		请填写相应的内容：<br/><input name="csdCityStr" type="text" class="w123" value="<%=_bornaddrcity%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo && _bornaddrcity.length()>0){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.csdCity.value==''&& document.hrForm.csdProvince.value!=''&& document.hrForm.csdProvince.value!='-1'){
	    			document.getElementById("csdCityStr").style.display='block';
	    			document.hrForm.csdCity.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td align="right"><span class="red">*</span>身高体重：</td>
    <td><input name="stature" type="text" size="8" id="stature" value="${basicInfo.stature}"  maxlength="3" onkeyup="value=value.replace(/[^0-9]/g,'')"/>cm / 
	<input name="weight" type="text" size="8" id="weight" value="${basicInfo.weight}"  maxlength="3" onkeyup="value=value.replace(/[^0-9]/g,'')"/>kg</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>身份证号：</td>
    <td><input name="idcard" type="text" class="w123" id="idcard" value="${basicInfo.idcard}" maxlength="20"/></td>
    <td align="right"><span class="red">*</span>婚姻状况：</td>
    <td>
	    <select name="marrystate" id="marrystate" class="required">
			<option value="">请选择...</option>
	    	<option value="未婚" <c:if test="${basicInfo.marrystate eq '未婚' }">selected</c:if>>未婚</option>
	    	<option value="已婚未育" <c:if test="${basicInfo.marrystate eq '已婚未育' }">selected</c:if>>已婚未育</option>
	    	<option value="已婚已育" <c:if test="${basicInfo.marrystate eq '已婚已育' }">selected</c:if>>已婚已育</option>
	    </select>
    </td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>工作年限：</td>
    <td><input type="hidden" name="worktime" value="${basicInfo.worktime}" maxlength="8"/>
    	<select name="worktimet" id="worktimet" class="required" onchange="showStr(this,'worktimeStr')">
			<option value="">请选择...</option>
      		<option value="无" <c:if test="${basicInfo.worktime eq '无' }">selected</c:if>>无</option>
      		<option value="1年以内" <c:if test="${basicInfo.worktime eq '1年以内' }">selected</c:if>>1年以内</option>
      		<option value="1-2年" <c:if test="${basicInfo.worktime eq '1-2年' }">selected</c:if>>1-2年</option>
      		<option value="2-3年" <c:if test="${basicInfo.worktime eq '2-3年' }">selected</c:if>>2-3年</option>
      		<option value="3-4年" <c:if test="${basicInfo.worktime eq '3-4年' }">selected</c:if>>3-4年</option>
      		<option value="4-5年" <c:if test="${basicInfo.worktime eq '4-5年' }">selected</c:if>>4-5年</option>
      		<option value="5-8年" <c:if test="${basicInfo.worktime eq '5-8年' }">selected</c:if>>5-8年</option>
      		<option value="8-10年" <c:if test="${basicInfo.worktime eq '8-10年' }">selected</c:if>>8-10年</option>
      		<option value="10年以上" <c:if test="${basicInfo.worktime eq '10年以上' }">selected</c:if>>10年以上</option>
      		<option value="-1" <c:if test="${basicInfo.worktime eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="worktimeStr">
    		请填写相应的内容：<br/><input name="worktimeStr" type="text" class="w123" value="${basicInfo.worktime}" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.worktimet.value==''){
	    			document.getElementById("worktimeStr").style.display='block';
	    			document.hrForm.worktimet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td align="right"><span class="red">*</span>现所在地：</td>
    <td><input name="nowaddr" type="hidden" class="w123" id="nowaddr" value="${basicInfo.nowaddr}"/>
    	<select name="nowProvince" id="nowProvince" class="w66" onchange="getCity(this.value,2),showStr(this,'nowProvinceStr')">
			<option value="">请选择...</option>
    	<%if(null!=hrProvinceList && hrProvinceList.size()>0){
    		for(int i=0;i<hrProvinceList.size();i++){
    			Dictionary dic = (Dictionary)hrProvinceList.get(i);
    			if(_nowaddr.indexOf(dic.getKeyName())>=0 && !_nowaddr.equals(dic.getKeyName())){
    				procode = dic.getKeyCode();
    				_nowaddrcity = _nowaddr.substring(dic.getKeyName().length());
    			}%>
	      		<option value="<%=dic.getKeyCode()%>" <%=_nowaddr.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.specialtype eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<select name="nowCity" id="nowCity" class="w66" onchange="showStr(this,'nowCityStr')">
			<option value="">请选择...</option>
    	<%
    		if(null!=procode)
    			cityList = dictionaryService.getDictionaryByParentKeyCode(procode);
    		if(null!=cityList && cityList.size()>0){
    			for(int i=0;i<cityList.size();i++){
    				Dictionary dic = (Dictionary)cityList.get(i);
    	%>
    			<option value="<%=dic.getKeyName()%>" <%=_nowaddr.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
    	<%		}
    	%>
    			<option value="-1">其他</option>
    	<%
    		}
    		procode = null;
    		cityList = null;
    	%>
    	</select>
    	<span style="display:none" id="nowProvinceStr">
    		请填写相应的内容：<br/><input name="nowProvinceStr" type="text" class="w123" value="${basicInfo.nowaddr}" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.nowProvince.value==''){
	    			document.getElementById("nowProvinceStr").style.display='block';
	    			document.hrForm.nowProvince.value = '-1';
	    		}
	    	</script>
	    <%}%>
    	<span style="display:none" id="nowCityStr">
    		请填写相应的内容：<br/><input name="nowCityStr" type="text" class="w123" value="<%=_nowaddrcity%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo && _nowaddrcity.length()>0){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.nowCity.value==''&& document.hrForm.nowProvince.value!=''&& document.hrForm.nowProvince.value!='-1'){
	    			document.getElementById("nowCityStr").style.display='block';
	    			document.hrForm.nowCity.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
  </tr>
  <!-- 新加本科学校和本科毕业时间 -->
   <tr>
    <td align="right">
    	<span class="red">*</span>本科毕业学校：
    </td>
    <td>
    	<input type="hidden" name="undergraduateSchool" value="${basicInfo.undergraduateSchool}" maxlength="10"/>
    	<select name="unschoolt" id="unschoolt" class="required" onchange="showStr(this,'undergraduateSchoolStr')">
			<option value="">请选择...</option>
    	<%
    	String unschool = "";
    	if(null!=basicInfo){
    		unschool = basicInfo.getUndergraduateSchool();
	    	if(null==unschool){
	    		unschool = "";
	    	}
    	}
    	if(null!=universityList && universityList.size()>0){
    		for(int i=0;i<universityList.size();i++){
    			Dictionary dic = (Dictionary)universityList.get(i);%>
	      		<option value="<%=dic.getKeyName()%>" <%=unschool.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.undergraduateSchool eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="undergraduateSchoolStr">
    		<input name="undergraduateSchoolStr" type="text" class="w123" value="${basicInfo.undergraduateSchool}" maxlength="10"/><span class="red">(请填10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.unschoolt.value==''){
	    			document.getElementById("undergraduateSchoolStr").style.display='block';
	    			document.hrForm.unschoolt.value = '-1';
	    		}
	    	</script>
	    <%}%>
	    
	    
    </td>
    <td><span class="red" align="right">*</span>本科毕业时间：</td>
    <td ><input name="undergraduateTimeStr" type="text" readonly="readonly" id="undergraduateTimeStr" class="w123"
    <c:if test="${basicInfo.undergraduateTime !=null }">
    	value="<bean:write name="basicInfo" property="undergraduateTime" format="yyyy-MM-dd"/>"
    </c:if>
    />
    <a href="javascript:void(0)" onclick="gfPop.fStartPop(document.hrForm.undergraduateTimeStr,0);return false;" HIDEFOCUS><img src="/pic/job/selectTime.gif" align="middle" /></a>
      </td>
  </tr>
  
  <!-- 本科专业类别 -->
  <tr >
  	<td align="right">
    	<span class="red">*</span>本科专业类别：
    	<%--<input name="undergraduateSjType" value="${basicInfo.undergraduateSjType}" type="text"  id="undergraduateSjType" class="validate-chinese max-length-15"/>
    --%></td>
   <td><input type="hidden" name="undergraduateSjType" value="${basicInfo.undergraduateSjType}"/>
    	<select name="undergraduateSjTypet" id="undergraduateSjTypet" class="required" onchange="showStr(this,'undergraduateSjTypeStr')">
			<option value="">请选择...</option>
    	<%
    	String unSjtype = "";
    	if(null!=basicInfo){
    		unSjtype = basicInfo.getUndergraduateSjType();
	    	if(null==unSjtype){
	    		unSjtype = "";
	    	}
    	}
    	if(null!=specialtyList && specialtyList.size()>0){
    		for(int i=0;i<specialtyList.size();i++){
    			Dictionary dic = (Dictionary)specialtyList.get(i);%>
	      		<option value="<%=dic.getKeyName()%>" <%=unSjtype.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.undergraduateSjType eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="undergraduateSjTypeStr">
    		请填写相应的内容：<br/><input name="undergraduateSjTypeStr" type="text" class="w123" value="${basicInfo.undergraduateSjType}" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.undergraduateSjTypet.value==''){
	    			document.getElementById("undergraduateSjTypeStr").style.display='block';
	    			document.hrForm.undergraduateSjTypet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td>
    
    </td>
    <td>
    
    </td>
  </tr>
  
  <!-- /新加本科学校和本科毕业时间 -->
  <tr>
    <td align="right"><span class="red">*</span>最高学位：</td>
    <td colspan="3"><input type="hidden" name="highdegree" value="${basicInfo.highdegree}" maxlength="8"/>
    	<select name="highdegreet" id="highdegreet" class="required" onchange="showStr(this,'highdegreeStr')">
			<option value="">请选择...</option>
      		<option value="无" <c:if test="${basicInfo.highdegree eq '无' }">selected</c:if>>无</option>
      		<option value="学士" <c:if test="${basicInfo.highdegree eq '学士' }">selected</c:if>>学士</option>
      		<option value="双学士" <c:if test="${basicInfo.highdegree eq '双学士' }">selected</c:if>>双学士</option>
      		<option value="硕士" <c:if test="${basicInfo.highdegree eq '硕士' }">selected</c:if>>硕士</option>
      		<option value="博士" <c:if test="${basicInfo.highdegree eq '博士' }">selected</c:if>>博士</option>
      		<option value="-1" <c:if test="${basicInfo.highdegree eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span class="red">在校生请填即将获取的最高学位</span>
    	<span style="display:none" id="highdegreeStr">
    		<input name="highdegreeStr" type="text" class="w123" value="${basicInfo.highdegree}" maxlength="10"/><span class="red">(请填10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.highdegreet.value==''){
	    			document.getElementById("highdegreeStr").style.display='block';
	    			document.hrForm.highdegreet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
  </tr>
  <tr>
    <!-- 最高学历 -->
    <td align="right"><span class="red">*</span>最高学历：</td>
    <td colspan="3"><input type="hidden" name="highxl" value="${basicInfo.highxl}" maxlength="8"/>
    	<select name="highxlt" id="highxlt" class="required" onchange="showStr(this,'highxlStr')">
			<option value="">请选择...</option>
	      <option value="无" <c:if test="${basicInfo.highxl eq '无' }">selected</c:if>>无</option>
	      <option value="中专及同等学历 " <c:if test="${basicInfo.highxl eq '中专及同等学历' }">selected</c:if>>中专及同等学历</option>
	      <option value="大专及同等学历 " <c:if test="${basicInfo.highxl eq '大专及同等学历' }">selected</c:if>>大专及同等学历</option>
	      <option value="本科 " <c:if test="${basicInfo.highxl eq '本科' }">selected</c:if>>本科</option>
	      <option value="研究生 " <c:if test="${basicInfo.highxl eq '研究生' }">selected</c:if>>研究生</option>
	      <option value="高中 " <c:if test="${basicInfo.highxl eq '高中' }">selected</c:if>>高中</option>
	      <option value="-1" <c:if test="${basicInfo.highxl eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span class="red">在校生请填即将获取的最高学历</span>
    	<span style="display:none" id="highxlStr">
    		<input name="highxlStr" type="text" class="w123" value="${basicInfo.highxl}" maxlength="10"/><span class="red">(请填10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.highxlt.value==''){
	    			document.getElementById("highxlStr").style.display='block';
	    			document.hrForm.highxlt.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
  </tr>
  <tr>
  	<td align="right" ><span class="red" >*</span>最高学历毕业院校：</td>
    <td colspan="3"><input type="hidden" name="school" value="${basicInfo.school}" maxlength="10"/>
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
    		<input name="schoolStr" type="text" class="w123" value="${basicInfo.school}" maxlength="10"/><span class="red">(请填10字内)</span>
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
  </tr>
  <tr style="height: 15px">
    <td align="right" width="17%"><span class="red">*</span>最高学历专业类别：</td>
    <td colspan="3"><input type="hidden" name="specialtype" value="${basicInfo.specialtype}"/>
    	<select name="specialtypet" id="specialtypet" class="required" onchange="showStr(this,'specialtypeStr')">
			<option value="">请选择...</option>
    	<%
    	String specialtype = "";
    	if(null!=basicInfo){
    		specialtype = basicInfo.getSpecialtype();
	    	if(null==specialtype){
	    		specialtype = "";
	    	}
    	}
    	if(null!=specialtyList && specialtyList.size()>0){
    		for(int i=0;i<specialtyList.size();i++){
    			Dictionary dic = (Dictionary)specialtyList.get(i);%>
	      		<option value="<%=dic.getKeyName()%>" <%=specialtype.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.specialtype eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<span style="display:none" id="specialtypeStr">
    		<input name="specialtypeStr" type="text" class="w123" value="${basicInfo.specialtype}" maxlength="10"/><span class="red">(请添10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.specialtypet.value==''){
	    			document.getElementById("specialtypeStr").style.display='block';
	    			document.hrForm.specialtypet.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>最高学历毕业时间：</td>
    <td><input type="hidden" name="graduateyear" value="${basicInfo.graduateyear}" maxlength="10"/>
    	<select name="graduateyeart" id="graduateyeart" class="required" onchange="showStr(this,'graduateyearStr')">
			<option value="">请选择...</option>
    	 <%for(int i=1980;i<=2020;i++){ %>
    	 <option value="<%=i %>" <%if(basicInfo!=null && (i+"").equals(basicInfo.getGraduateyear())){out.println("selected");} %>><%=i %></option>
    	 <%} %>
    	 <option value="-1">其他</option>
      </select>年
      <select name="graduatemonth" id="graduatemonth" class="required">
			<option value="">请选择...</option>
       <%for(int i=1;i<=12;i++){ %>
    	 <option value="<%=i %>" <%if(basicInfo!=null && (i+"").equals(basicInfo.getGraduatemonth())){out.println("selected");} %>><%=i %></option>
    	 <%} %>
        </select>月
    	<span style="display:none" id="graduateyearStr">
    		请填写相应的内容：<br/><input name="graduateyearStr" type="text" class="w66" value="${basicInfo.graduateyear}" maxlength="4" onkeyup="value=value.replace(/[^0-9]/g,'')"/>年<span class="red">(4字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.graduateyeart.value==''){
	    			document.getElementById("graduateyearStr").style.display='block';
	    			document.hrForm.graduateyeart.value = '-1';
	    		}
	    	</script>
	    <%}%>
    </td>
    <td align="right"><span class="red">*</span>月薪要求(元)：</td>
    <td colspan="2">
    	<select name="paywant" id="paywant" class="required">
			<option value="">请选择...</option>
      		<option value="无" <c:if test="${basicInfo.paywant eq '无' }">selected</c:if>>无</option>
      		<option value="2000以下" <c:if test="${basicInfo.paywant eq '2000以下' }">selected</c:if>>2000以下</option>
      		<option value="2000-4000" <c:if test="${basicInfo.paywant eq '2000-4000' }">selected</c:if>>2000-4000</option>
      		<option value="4000-6000" <c:if test="${basicInfo.paywant eq '4000-6000' }">selected</c:if>>4000-6000</option>
      		<option value="6000-8000" <c:if test="${basicInfo.paywant eq '6000-8000' }">selected</c:if>>6000-8000</option>
      		<option value="8000-10000" <c:if test="${basicInfo.paywant eq '8000-10000' }">selected</c:if>>8000-10000</option>
      		<option value="10000-15000" <c:if test="${basicInfo.paywant eq '10000-15000' }">selected</c:if>>10000-15000</option>
      		<option value="15000-20000" <c:if test="${basicInfo.paywant eq '15000-20000' }">selected</c:if>>15000-20000</option>
      		<option value="20000-40000" <c:if test="${basicInfo.paywant eq '20000-40000' }">selected</c:if>>20000-40000</option>
      		<option value="40000-60000" <c:if test="${basicInfo.paywant eq '40000-60000' }">selected</c:if>>40000-60000</option>
      		<option value="60000-80000" <c:if test="${basicInfo.paywant eq '60000-80000' }">selected</c:if>>60000-80000</option>
      		<option value="80000-100000" <c:if test="${basicInfo.paywant eq '80000-100000' }">selected</c:if>>80000-100000</option>
      		<option value="100000以上" <c:if test="${basicInfo.paywant eq '100000以上' }">selected</c:if>>100000以上</option>
      		<option value="面议" <c:if test="${basicInfo.paywant eq '面议' }">selected</c:if>>面议</option>
    	</select>
      	<span class="red">指成为正式员工后薪资期望</span></td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>档案所在地：</td>
    <td><input name="docuaddr" type="text" class="w123" id="docuaddr" value="${basicInfo.docuaddr}" maxlength="20"/></td>
    <td align="right"><span class="red">*</span>户口所在地：</td>
    <td><input name="hukouaddr" type="text" class="w123" id="hukouaddr" value="${basicInfo.hukouaddr}" maxlength="20"/></td>
  </tr>
  <tr>
    <td align="right">可实习时间：</td>
    <td><input name="practisetime" type="text" class="w123" id="practisetime" value="${basicInfo.practisetime}" maxlength="10"/>
    <span class="red">在校生填写</span></td>
    <td align="right">可入职时间：</td>
    <td><input name="jointime" type="text" class="w123" id="jointime" value="${basicInfo.jointime}" maxlength="10"/>
      <span class="red">非在校生填写</span></td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>希望工作地：</td>
    <td colspan="3"><input name="hopeworkaddr" type="hidden" class="w123" id="hopeworkaddr" value="${basicInfo.hopeworkaddr}"/>
    	<select name="hopeProvince1" id="hopeProvince1" class="w66" onchange="getCity(this.value,3),showStr(this,'hopeProvinceStr1')">
			<option value="">请选择...</option>
    	<%
    	if(null!=hrProvinceList && hrProvinceList.size()>0){
    		for(int i=0;i<hrProvinceList.size();i++){
    			Dictionary dic = (Dictionary)hrProvinceList.get(i);
    			if(_addr1.indexOf(dic.getKeyName())>=0 && !_addr1.equals(dic.getKeyName())){
    				procode = dic.getKeyCode();
    				_addr1city = _addr1.substring(dic.getKeyName().length());
    			}%>
	      		<option value="<%=dic.getKeyCode()%>"  <%=(_addr1.indexOf(dic.getKeyName())>=0)?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.specialtype eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<select name="hopeCity1" id="hopeCity1" class="w66" onchange="showStr(this,'hopeCityStr1')">
			<option value="">请选择...</option>
    	<%
    		if(null!=procode)
    			cityList = dictionaryService.getDictionaryByParentKeyCode(procode);
    		if(null!=cityList){
    			for(int i=0;i<cityList.size();i++){
    				Dictionary dic = (Dictionary)cityList.get(i);
    	%>
    			<option value="<%=dic.getKeyName()%>" <%=_addr1.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
    	<%		}
    	%>
    			<option value="-1">其他</option>
    	<%
    		}
    		procode = null;
    		cityList = null;
    	%>
    	</select>
    	<span style="display:none" id="hopeProvinceStr1">
    		请填写相应的内容：<br/><input name="hopeProvinceStr1" type="text" class="w123" value="<%=_addr1%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.hopeProvince1.value==''){
	    			if(document.hrForm.hopeProvinceStr1.value!=''){
		    			document.getElementById("hopeProvinceStr1").style.display='block';
		    			document.hrForm.hopeProvince1.value = '-1';
	    			}
	    		}else if(document.hrForm.hopeProvince1.value=='-1'){
	    			document.getElementById("hopeProvinceStr1").style.display='block';
	    		}
	    	</script>
	    <%}%>
    	<span style="display:none" id="hopeCityStr1">
    		请填写相应的内容：<br/><input name="hopeCityStr1" type="text" class="w123" value="<%=_addr1city%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span> / 
    	<%
	    if(null!=basicInfo && _addr1city.length()>0){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.hopeCity1.value==''&& document.hrForm.hopeProvince1.value!=''&& document.hrForm.hopeProvince1.value!='-1'){
	    			document.getElementById("hopeCityStr1").style.display='block';
	    			document.hrForm.hopeCity1.value = '-1';
	    		}
	    	</script>
	    <%}%>
    	
    	<select name="hopeProvince2" id="hopeProvince2" class="w66" onchange="getCity(this.value,4),showStr(this,'hopeProvinceStr2')">
			<option value="">请选择...</option>
    	<%if(null!=hrProvinceList && hrProvinceList.size()>0){
    		for(int i=0;i<hrProvinceList.size();i++){
    			Dictionary dic = (Dictionary)hrProvinceList.get(i);
    			if(_addr2.indexOf(dic.getKeyName())>=0 && !_addr2.equals(dic.getKeyName())){
    				procode = dic.getKeyCode();
    				_addr2city = _addr2.substring(dic.getKeyName().length());
    			}%>
	      		<option value="<%=dic.getKeyCode()%>" <%=_addr2.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.specialtype eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<select name="hopeCity2" id="hopeCity2" class="w66" onchange="showStr(this,'hopeCityStr2')">
			<option value="">请选择...</option>
    	<%
    		if(null!=procode)
    			cityList = dictionaryService.getDictionaryByParentKeyCode(procode);
    		if(null!=cityList){
    			for(int i=0;i<cityList.size();i++){
    				Dictionary dic = (Dictionary)cityList.get(i);
    	%>
    			<option value="<%=dic.getKeyName()%>" <%=_addr2.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
    	<%		}
    	%>
    			<option value="-1">其他</option>
    	<%
    		}
    		procode = null;
    		cityList = null;
    	%>
    	</select>
    	<span style="display:none" id="hopeProvinceStr2">
    		请填写相应的内容：<br/><input name="hopeProvinceStr2" type="text" class="w123" value="<%=_addr2%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.hopeProvince2.value==''){
	    			if(document.hrForm.hopeProvinceStr2.value!=''){
		    			document.getElementById("hopeProvinceStr2").style.display='block';
		    			document.hrForm.hopeProvince2.value = '-1';
	    			}
	    		}else if(document.hrForm.hopeProvince2.value=='-1'){
	    			document.getElementById("hopeProvinceStr2").style.display='block';
	    		}
	    	</script>
	    <%}%>
    	<span style="display:none" id="hopeCityStr2">
    		请填写相应的内容：<br/><input name="hopeCityStr2" type="text" class="w123" value="<%=_addr2city%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span> / 
    	<%
	    if(null!=basicInfo && _addr2city.length()>0){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.hopeCity2.value==''&& document.hrForm.hopeProvince2.value!=''&& document.hrForm.hopeProvince2.value!='-1'){
	    			document.getElementById("hopeCityStr2").style.display='block';
	    			document.hrForm.hopeCity2.value = '-1';
	    		}
	    	</script>
	    <%}%>
    	<select name="hopeProvince3" id="hopeProvince3" class="w66" onchange="getCity(this.value,5),showStr(this,'hopeProvinceStr3')">
			<option value="">请选择...</option>
    	<%if(null!=hrProvinceList && hrProvinceList.size()>0){
    		for(int i=0;i<hrProvinceList.size();i++){
    			Dictionary dic = (Dictionary)hrProvinceList.get(i);
    			if(_addr3.indexOf(dic.getKeyName())>=0 && !_addr3.equals(dic.getKeyName())){
    				procode = dic.getKeyCode();
    				_addr3city = _addr3.substring(dic.getKeyName().length());
    			}%>
	      		<option value="<%=dic.getKeyCode()%>" <%=_addr3.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
	    <%	}
	    } %>
	      <option value="-1" <c:if test="${basicInfo.specialtype eq '-1' }">selected</c:if>>其他</option>
    	</select>
    	<select name="hopeCity3" id="hopeCity3" class="w66" onchange="showStr(this,'hopeCityStr3')">
			<option value="">请选择...</option>
    	<%
    		if(null!=procode)
    			cityList = dictionaryService.getDictionaryByParentKeyCode(procode);
    		if(null!=cityList){
    			for(int i=0;i<cityList.size();i++){
    				Dictionary dic = (Dictionary)cityList.get(i);
    	%>
    			<option value="<%=dic.getKeyName()%>" <%=_addr3.indexOf(dic.getKeyName())>=0?"selected":""%>><%=dic.getKeyName()%></option>
    	<%		}
    	%>
    			<option value="-1">其他</option>
    	<%
    		}
    		procode = null;
    		cityList = null;
    	%>
    	</select>
    	<span style="display:none" id="hopeProvinceStr3">
    		请填写相应的内容：<br/><input name="hopeProvinceStr3" type="text" class="w123" value="<%=_addr3%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.hopeProvince3.value==''){
	    			if(document.hrForm.hopeProvinceStr3.value!=''){
	    				document.getElementById("hopeProvinceStr3").style.display='block';
	    				document.hrForm.hopeProvince3.value = '-1';
	    			}
	    		}else if(document.hrForm.hopeProvince3.value=='-1'){
	    			document.getElementById("hopeProvinceStr3").style.display='block';
	    		}
	    	</script>
	    <%}%>
    	<span style="display:none" id="hopeCityStr3">
    		请填写相应的内容：<br/><input name="hopeCityStr3" type="text" class="w123" value="<%=_addr3city%>" maxlength="10"/><span class="red">(10字内)</span>
    	</span>
    	<%
	    if(null!=basicInfo && _addr3city.length()>0){
	    %>
	    	<script language="javascript">
	    		if(document.hrForm.hopeCity3.value==''&& document.hrForm.hopeProvince3.value!=''&& document.hrForm.hopeProvince3.value!='-1'){
	    			document.getElementById("hopeCityStr3").style.display='block';
	    			document.hrForm.hopeCity3.value = '-1';
	    		}
	    	</script>
	    <%}%>
	   
    </td>
  </tr>
  <tr>
    <td align="left" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; <span class="red">*</span>是否服从工作地的调剂：
   
    <select name="ifworkaddr" id="ifworkaddr" class="required">
      <option value="是" <c:if test="${basicInfo.ifworkaddr eq '是' }">selected</c:if>>是</option>
      <option value="否" <c:if test="${basicInfo.ifworkaddr eq '否' }">selected</c:if>>否</option>
    </select>
   <span>&nbsp;&nbsp;&nbsp;&nbsp; 我们将根据您选择的工作地来安排相关岗位的面试 </span>
    </td>
  </tr>
  <tr>
    <td align="right">现工作单位：</td>
    <td colspan="3"><input name="nowcompany" type="text" class="w123" id="nowcompany" value="${basicInfo.nowcompany}" maxlength="40"/>
    </td>
  </tr>
  <tr>
    <td height="15" colspan="4" class="cuxuxian"></td>
    </tr>
</table>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">联系信息</strong></td>
  </tr>
</table>
<table width="97%" border="0" align="center" class="lh30">
  <tr>
    <td width="13%" align="right"><span class="red">*</span>移动电话：</td>
    <td width="32%"><input name="mobil" type="text" class="w123" id="mobil" value="${basicInfo.mobil}" maxlength="16"/></td>
    <td width="13%" align="right"><span class="red">*</span>紧急联系电话：</td>
    <td width="32%"><input name="urgentphone" type="text" class="w123" id="urgentphone" value="${basicInfo.urgentphone}" maxlength="16"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>目前通信地址：</td>
    <td><input name="curentaddr" type="text" class="w123" id="curentaddr" value="${basicInfo.curentaddr}" maxlength="50"/></td>
    <td align="right"><span class="red">*</span>邮编：</td>
    <td><input name="post" type="text" class="w123" id="post" maxlength="16" value="${basicInfo.post}"/></td>
    <td>&nbsp;</td>
  </tr>
  <!-- tr>
    <td align="right"><span class="red">*</span>电子邮箱：</td>
    <td colspan="3"><input name="email" type="text" class="w123 validate-email" maxlength="20" id="email" value="${basicInfo.email}"/></td>
    <td>&nbsp;</td>
  </tr-->
  <tr>
    <td height="15" colspan="5" class="cuxuxian"></td>
  </tr>
</table>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">资格证书及专业水平</strong></td>
  </tr>
</table>
<table width="97%" border="0" align="center" class="lh30">
  <tr>
    <td width="33%" align="right">英语水平及所获得证书：</td>
    <td width="32%">
    	<select name="engletter" id="engletter"  onchange="showCount(this,'englettercountspan','englettercount')">
			<option value="">请选择...</option>
     		<option value="CET6优秀" <c:if test="${basicInfo.engletter eq 'CET6优秀' }">selected</c:if>>CET6优秀</option>
      		<option value="CET6通过" <c:if test="${basicInfo.engletter eq 'CET6通过' }">selected</c:if>>CET6通过</option>
      		<option value="CET6分数" <c:if test="${basicInfo.engletter eq 'CET6分数' }">selected</c:if>>CET6分数</option>
      		<option value="CET4优秀" <c:if test="${basicInfo.engletter eq 'CET4优秀' }">selected</c:if>>CET4优秀</option>
      		<option value="CET4通过" <c:if test="${basicInfo.engletter eq 'CET4通过' }">selected</c:if>>CET4通过</option>
      		<option value="CET4分数" <c:if test="${basicInfo.engletter eq 'CET4分数' }">selected</c:if>>CET4分数</option>
    	</select>
    	<%
    		String display = "none";
    		String englettercount = "";
    		if(null!=basicInfo && null!=basicInfo.getEnglettercount() && basicInfo.getEnglettercount().length()>0){
    			englettercount = basicInfo.getEnglettercount();
    			display = "block";
    		}
    	%>
    	<span style="display:<%=display %>" id="englettercountspan">
    		请在此输入分数：<input name="englettercount" id="englettercount" type="text" class="w66" value="<%=englettercount %>" maxlength="3" onkeyup="value=value.replace(/[^0-9]/g,'')"/><span class="red">(3字内)</span>
    	</span>
    </td>
    <td width="20%" align="right">其他英语水平证书：</td>
    <td><input name="otherengletter" type="text" class="w66" id="otherengletter" value="${basicInfo.otherengletter }" maxlength="8"/></td>
    </tr>
  <tr>
    <td align="right">计算机水平及获得证书：</td>
    <td><input name="computerletter" type="text" class="w123" id="computerletter"  value="${basicInfo.computerletter }" maxlength="40"/></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="right">是否通过国家司法考试：</td>
    <td><label>
      <input type="radio" name="gjsfks" id="gjsfks1" value="1" <c:if test="${basicInfo.gjsfks eq '1' }">checked="checked"</c:if>/>
    </label>
      是
      <input type="radio" name="gjsfks" id="gjsfks2" value="0" <c:if test="${basicInfo.gjsfks eq '0' }">checked="checked"</c:if>/>
      否</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <!-- 2011-09-26 -->
  <tr>
    <td align="right">是否通过保荐代表人考试：</td>
    <td><label>
      <input type="radio" name="isInsuranceAgents" id="isInsuranceAgents1" value="1" <c:if test="${basicInfo.isInsuranceAgents eq '1' }">checked="checked"</c:if>/>
    </label>
      是
      <input type="radio" name="isInsuranceAgents" id="isInsuranceAgents2" value="0" <c:if test="${basicInfo.isInsuranceAgents eq '0' }">checked="checked"</c:if>/>
      否</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <!-- /2011-09-26 -->
  <%
  //因为basicInfo.getZckjs()获取的字符串已经很长，所以有很多重复的字符，需要将其变为数组来处理
  	String [] zckjss=null;
  	List zckjsList=null;
	  if(basicInfo!=null&&basicInfo.getZckjs()!=null){
		  zckjss=basicInfo.getZckjs().split(",");
		  zckjsList=Arrays.asList(zckjss);
	  }
  %>
  <script language="javascript">
  //用于判断会计考试多选框的选择逻辑
  	function selectedZckjs(o){
  		var objs= document.getElementsByName('zckjs');
  		
  		
  		if(o.id=='zckjs8'||o.id=='zckjs9'||o.id=='zckjs10'||o.id=='zckjs11'){
  			for(var i=0;i<objs.length;i++){
  				objs[i].checked=false;
  			}
  		
  			o.checked=true;
  			if(o.id=='zckjs11'&&o.checked){
	  			document.getElementById('kjdiv').style.display='block';
  			}else{
  				document.getElementById('kjdiv').style.display='none';
  			}
  		}
  		
  		if(o.id=='zckjs1'||o.id=='zckjs2'||o.id=='zckjs3'||o.id=='zckjs4'||o.id=='zckjs5'||o.id=='zckjs6'||o.id=='zckjs7'){
  			document.getElementById('zckjs8').checked=false;;
  			document.getElementById('zckjs9').checked=false;;
  			document.getElementById('zckjs10').checked=false;;
  		}
  		
  		
  		
  	}
  </script>
  
  <tr>
    <td align="right">注册会计师考试情况：</td>
    <td colspan="3">
    	<input type="checkbox" name="zckjs" id="zckjs8" value="8" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("8")!=-1){out.println("checked='checked'");} %> />
      		注册会计师执业会员
        <input type="checkbox" name="zckjs" id="zckjs9" value="9" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("9")!=-1){out.println("checked='checked'");} %>/>
        	注册会计师非执业会员
        
        <input type="checkbox" name="zckjs" id="zckjs11" value="11" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("11")!=-1){out.println("checked='checked'");} %>/>
        	通过部分科目考试
        	<br />
        <input type="checkbox" name="zckjs" id="zckjs10" value="10" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("10")!=-1){out.println("checked='checked'");} %>/>
        	未通过任何科目考试
        <br/>
        
    	<div id="kjdiv"  <%if(zckjsList!=null && (zckjsList.indexOf("11")!=-1
    											||zckjsList.indexOf("1")!=-1
    											||zckjsList.indexOf("2")!=-1
    											||zckjsList.indexOf("3")!=-1
    											||zckjsList.indexOf("4")!=-1
    											||zckjsList.indexOf("5")!=-1
    											||zckjsList.indexOf("6")!=-1
    											||zckjsList.indexOf("7")!=-1
    											 )
    							){out.println("style='display: block;'");}else{out.println("style='display: none;'");} %>>
    							
    	<input type="checkbox" name="zckjs" id="zckjs1" value="1" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("1")!=-1){out.println("checked='checked'");} %> />
      		会计
        <input type="checkbox" name="zckjs" id="zckjs2" value="2" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("2")!=-1){out.println("checked='checked'");} %>/>
        	审计
        <input type="checkbox" name="zckjs" id="zckjs3" value="3" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("3")!=-1){out.println("checked='checked'");} %>/>
        	财务成本管理
        <input type="checkbox" name="zckjs" id="zckjs4" value="4" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("4")!=-1){out.println("checked='checked'");} %>/>
        	经济法
        <input type="checkbox" name="zckjs" id="zckjs5" value="5" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("5")!=-1){out.println("checked='checked'");} %>/>
        	税法
		<br />
        <input type="checkbox" name="zckjs" id="zckjs6" value="6" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("6")!=-1){out.println("checked='checked'");} %>/>
        	公司战略与风险管理
        <input type="checkbox" name="zckjs" id="zckjs7" value="7" onclick="selectedZckjs(this)"  <%if(zckjsList!=null && zckjsList.indexOf("7")!=-1){out.println("checked='checked'");} %>/>
        	综合测试
        	<br />&nbsp;&nbsp;<span class="red">请选择通过的科目</span>
        </div>
        </td>
    </tr>
  <tr>
    <td align="right" valign="top">证券从业资格考试情况：</td>
    <td colspan="3">
    	<input type="checkbox" name="zqcyzgks" id="zqcyzgks1" value="1" <%if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("1")){out.println("checked='checked'");} %>/>
			证券市场基础知识
  		<input type="checkbox" name="zqcyzgks" id="zqcyzgks2" value="2" <%if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("2")){out.println("checked='checked'");} %>/>
			证券投资基金
		<input type="checkbox" name="zqcyzgks" id="zqcyzgks3" value="3" <%if(basicInfo!=null &&basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("3")){out.println("checked='checked'");} %>/>
			证券发行与承销
		<input type="checkbox" name="zqcyzgks" id="zqcyzgks4" value="4" <%if(basicInfo!=null &&basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("4")){out.println("checked='checked'");} %>/>
			证券交易
		<br />
		<input type="checkbox" name="zqcyzgks" id="zqcyzgks5" value="5" <%if(basicInfo!=null && basicInfo.getZqcyzgks()!=null &&basicInfo.getZqcyzgks().contains("5")){out.println("checked='checked'");} %>/>
			证券投资分析
		&nbsp;&nbsp;<span class="red">请选择通过的科目</span></td>
    </tr>
  <tr>
    <td align="right">是否具有证券投资咨询执业资格：</td>
    <td><label>
      <input type="radio" name="tzzxzg" id="tzzxzg1" value="1" <c:if test="${basicInfo.tzzxzg eq '1' }">checked="checked"</c:if> onclick="showTzzxzgno(1)"/>
    </label>
      是
      <input type="radio" name="tzzxzg" id="tzzxzg2" value="0" <c:if test="${basicInfo.tzzxzg eq '0' }">checked="checked"</c:if> onclick="showTzzxzgno(0)"/>
      否</td>
    <td colspan="2" align="left">
    	<span id="tzzxzgnospan" name="tzzxzgnospan" style="display:<c:if test="${basicInfo.tzzxzg eq '0' }">none</c:if>">执业证书编号：
    		<c:choose>
    			<c:when test="${fn:indexOf(basicInfo.tzzxzgno,'S') ==0}">
    				<input type="text" id="tzzxzgno" name="tzzxzgno" class="w123" value="${basicInfo.tzzxzgno}"/>
    			</c:when>
    			<c:otherwise>
    				<input type="text" id="tzzxzgno" name="tzzxzgno" class="w123" value="${basicInfo.tzzxzgno}"/>
    			</c:otherwise>
    		</c:choose>
    			
    		
    	</span>
    </td>
  </tr>
  <tr>
    <td align="right">具有的技术职称：</td>
    <td><input name="haveposition" type="text" class="w123" id="haveposition"  value="${basicInfo.haveposition }" maxlength="20"/></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">具有的其他技能/资格证书：</td>
    <td><input name="otherposition" type="text" class="w123" id="otherposition"  value="${basicInfo.otherposition }" maxlength="20"/></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right" valign="top">专业特长描述：</td>
    <td colspan="3"><textarea name="strongskill" id="strongskill" cols="50" rows="4" onKeyDown="MaxLen(this,100)">${basicInfo.strongskill }</textarea><span class="red">(100字以内)</span></td>
    </tr>
  <tr>
    <td align="right" valign="top">所学课程及成绩描述：</td>
    <td colspan="3"><textarea name="course" id="course" cols="50" rows="4" onKeyDown="MaxLen(this,100)">${basicInfo.course }</textarea>
      <span class="red">(100字以内,在校生必填)</span></td>
    </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td colspan="3">格式说明：课程名称和成绩用顿号隔开，例如：金融工程78、投资银行学80、西方经济学98</td>
    </tr>
  <tr>
    <td height="15" colspan="4" class="cuxuxian"></td>
  </tr>
  <tr>
    <td align="right">&nbsp;<input type="hidden" name="action" value=""/></td>
    <td colspan="3">
      &nbsp;&nbsp;
      <input name="button3" type="button" class="bu08" id="button3" value="保 存" onclick="onSub('applyJobSuc')"/>
      &nbsp;&nbsp;
      <input name="button3" type="button" class="bu08" id="button3" value="下一步" onclick="onSub('basicNext')"/></td>
  </tr>

</table>
</form>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</iframe>
</body>
</html>