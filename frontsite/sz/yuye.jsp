<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:include page="${contextPath }/commons/taglibs.jsp"></jsp:include>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券分公司</title>
<link href="${contextPath }/css/branchcomp/index.css" rel="stylesheet" type="text/css" />

<script src="${contextPath }/js/branchcomp/wpCalendar.js" type="text/javascript"></script>
<script  src="${contextPath }/js/branchcomp/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<c:set var="chekdiv" value="none"></c:set>
<c:if test="${inspectno==1}" >
<c:set var="chekdiv" value=""></c:set>
</c:if>




<script language="javascript">

function reloadcode(){
var verify=document.getElementById('captchaImage');
verify.setAttribute('src','${ctx}/share/verifyCodeImage.jsp?'+Math.random());
//这里必须加入随机数不然地址相同我发重新加载
}

function checkIsValid()
	{
		var accountname=document.getElementById("name").value;
		var mobile=document.getElementById("mobile").value;
		var applydate=document.getElementById("applydate").value;
		var inspect=document.getElementById("inspect").value;	
		if(accountname==""||accountname.length == 0)
		{
			
	   document.getElementById("namecheck").style.display="";
	  //document.getElementById("name").focus();
		return false;
		}else{
			 document.getElementById("namecheck").style.display="none";
		}
		if(mobile==""||mobile.length == 0)
		{
		document.getElementById("mobilecheck").style.display="";
	   //document.getElementById("mobile").focus();
		return false;
		}else{
			 document.getElementById("mobilecheck").style.display="none";
		}
		
		if(applydate==""||applydate.length == 0)
		{
		document.getElementById("applydatecheck").style.display="";
	   //document.getElementById("applydate").focus();
		return false;
		}else{
			if(applydate!=""){
			var re=/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
			if (!re.test(applydate))           
			{
			document.getElementById("applydatecheck").style.display=""; 
			  return false;
 			 } else{
			document.getElementById("applydatecheck").style.display="none";
			}
			}
			 
			 
		}
		if(inspect==""||inspect.length == 0)
		{
		document.getElementById("inspectcheck").style.display="";
	   //document.getElementById("inspect").focus();
		return false;
		}else{
			 document.getElementById("inspectcheck").style.display="none";
		}
		return true;
			
	}
	  function rest() {
	  document.getElementById("name").value="";
	  document.getElementById("inspect").value="";
	  document.getElementById("applydate").value="";
	  document.getElementById("mobile").value="";
	  document.getElementById("name").focus();
	  
  } 
  	function submitapply(){
		
		if(checkIsValid()){
			 document.getElementById("accountapplyForm").submit();
			}
		}
</script>

</head>

<body>
<!-- 访问departmentAction 用于加载相关信息 -->
<jsp:include page="${contextPath }/sz/departmentAction.do?op=getAllDepartment"></jsp:include>
<div id="top">
			<div class="logo_box">
				<div class="lit_logo">
					<img src="${ctx}/images/branchcomp/lit_logo.jpg" width="104"
						height="33" />
				</div>
				<a href="http://www.gf.com.cn"><img src="${ctx}/images/branchcomp/big_logo.jpg"
						width="165" height="44" />
				</a>
			</div>
		</div>

		<div id="dh_box">
			<div class="dh_lt"></div>
			<div class="dh_mid">
				<div class="dh_unone" id="index" onmouseover="className='dh_one'" onmouseout="className='dh_unone'" >
					<a href="${ctx}/sz/index.html">首页</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_unone" id="yingye" onmouseover="className='dh_one'"
					onmouseout="className='dh_unone'" >
					<a href="${ctx}/sz/yingye.jsp">营业部信息</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_one" id="yuye">
					<a href="${ctx}/sz/yuye.jsp">预约开户</a>
				</div>

			</div>
			<div class="dh_rt"></div>

		</div>
<html:form styleId="accountapplyForm" action="${ctx}/sz/accountApplyAction.do?op=addAccountApply">
<div id="neiye_box">
  
  <div class="neiye_left">
  <div class="mnr_jiao">
	 <div style="background:url(${contextPath }/images/branchcomp/jl_img1.jpg) no-repeat;height:83px;width:208px;">
		<div id="BDBridgeFixedWrap"></div>				
	</div>
  
  </div>
   <jsp:include page="${contextPath }/sz/dmangers.jsp"></jsp:include>
   
  </div>
  
  <div  class="neiye_right">
    <div class="nyr_titbox">
      <div class="nyr_yellowtit1"></div>
        <div class="nyr_tit2"><strong>在线预约开户</strong></div>
        <div class="nyr_tit3"></div>
    </div>
     <c:choose><c:when test="${inspectno==2}">
        <div id="rto" style="height:450px; font-size:12px"  align="center" >
       <br/>
         <br/>
           <br/>
             <br/>
               <br/>
               <br/>
               <br/>
       <h4> 您的信息已经成功提交，欢迎届时前往营业部办理业务，我们将给您最好的接待与服务！如有疑问，请联系客户经理！</h4>
       
      </div>
     </c:when>
     
     <c:otherwise>
     
   
  
     <div class="yuye_conbox">
       <center><table width="390" border="0" cellpadding="0" cellspacing="0" style="color:#0088d5; font-size:14px; font-family:Arial, Helvetica, sans-serif;">
    <tr>
      <td width="140" height="40" align="right">开户地区：</td>
      <td width="250" height="40" align="left">
        <select name="select" id="select_area" style="width:176px;">
          <option>深圳</option>
          </select></td>
    </tr>
    <tr>
      <td height="40" align="right">拟开营业部：</td>
      <td height="40" align="left">
<html:select styleId="select_department" property="accountapply.branchno" style="width:176px;" >
<html:optionsCollection name="departments" label="deptName" value="id"/>
</html:select>
        </td>
    </tr>
  </table></center>
    </div>
    
    <div class="yuye_2td">
    
  <center>

<table width="570" border="0" cellpadding="0" cellspacing="0" style="color:#0088d5; font-size:14px; font-family:Arial, Helvetica, sans-serif;">
    <tr>
      <td width="231" height="40" align="right"><span class="yuye_red">*</span>您的姓名：</td>
      <td width="184" height="40" align="left">
      <html:hidden property="accountapply.ip" value="${pageContext.request.remoteAddr }"/>
     
        <input name="op1" type="hidden" value="ss"/>
     <html:text  property="accountapply.name" styleId="name" styleClass="yuye_input" onblur="checkIsValid()" />
         </td>
      <td width="155" align="left"> <div name="namecheck"  id="namecheck" style="display:none; color:#F00; font-size:12px">姓名不可以为空！</div></td>
    </tr>
    <tr>
      <td height="40" align="right"><span class="yuye_red">*</span> 手机号码：</td>
      <td height="40" align="left">
      <html:text onkeyup="this.value=this.value.replace(/\D/g,'')" onkeydown="this.value=this.value.replace(/\D/g,'')"  property="accountapply.mobile" styleId="mobile" styleClass="yuye_input" onblur="checkIsValid()" />
      </td>
      <td height="40" align="left"><div name="mobilecheck"  id="mobilecheck" style="display:none; color:#F00; font-size:12px">请输入手机号！</div></td>
    </tr>
    <tr>
      <td height="40" align="right"><span class="yuye_red">*</span> 预约办理日期：</td>
      <td height="40" align="left">
      <html:text onfocus="WdatePicker()" property="accountapply.startDate" styleId="applydate" style="width:153px;border-right:none; float:left;height:21px;" styleClass="yuye_input" onblur="checkIsValid()" />
        <img onclick="WdatePicker({el:$dp.$('applydate')})" src="${contextPath }/images/branchcomp/time_btn.jpg"  align="absmiddle" style="float:left;" /></td>
      <td height="40" align="left"><div name="applydatecheck"  id="applydatecheck" style="display:none; color:#F00; font-size:12px">请正确输入办理日期！</div></td>
    </tr>
    <tr>
      <td height="40" align="right"><span class="yuye_red">*</span> 验证码：</td>
      <td height="40" align="left">
       <html:text onkeyup="this.value=this.value.replace(/\D/g,'')" onkeydown="this.value=this.value.replace(/\D/g,'')"  property="comminspect" styleId="inspect" styleClass="yuye_input" onblur="checkIsValid()" />
        </td>
      <td height="40" align="left" >
      <img id="captchaImage" onclick="reloadcode()" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
      <a href="javascript:reloadcode();"  ><u>看不清</u></a>
      </td>
    </tr>
    <tr>
    <td  ></td>
     <td height="20" align="left">
      <div name="inspectcheck"  id="inspectcheck" style="display:${chekdiv}; color:#F00; font-size:12px">请正确输入验证码！</div></td>
     <td ></td>
    </tr>
  
    <tr>
      <td height="60" colspan="3" align="center"><img src="${contextPath }/images/branchcomp/sumbit.jpg" width="100" height="30"  onclick="submitapply()"/>　　<img src="${contextPath }/images/branchcomp/deset.jpg" width="100" height="30" onclick=" rest()" /></td>
      </tr>
    <tr>
      <td height="50" colspan="3" align="center" valign="bottom" style="color:#1b1a1a;font-size:16px; font-weight:bold; FONT-FAMILY: Microsoft YaHei, SimHei, Hei;"><font color="#ff4e00">温馨提示：</font>周末与午休时间均接受业务办理</td>
    </tr>
    <tr>
      <td height="50" colspan="3" align="center" style="color:#1b1a1a;font-size:16px; font-weight:bold; FONT-FAMILY: Microsoft YaHei, SimHei, Hei;">&nbsp;</td>
    </tr>
    </table>
    </center>
    </div>
 
    </c:otherwise>
     
     </c:choose> 
  </div>
    
</div>
</html:form>
<div id="bottom_bg">
   <div class="bottomfont">[ICP 备案登记证编号：粤ICP备11070729号] 　广发证券股份有限公司版权所有 Copyright © 2000-2012 All Rights Reserved.</div>
   <div class="btm_web"><img src="${contextPath }/images/branchcomp/depend_wet.jpg" width="128" height="47" style="float:right;" /><img src="${contextPath }/images/branchcomp/police.jpg" width="39" height="47" /></div>
</div>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F82dc9bf3206b62ad7a8e0de3597a5409' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>