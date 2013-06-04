<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券分公司</title>

<link href="${contextPath }/css/branchcomp/index.css" rel="stylesheet" type="text/css" />

<c:if test="${param.departmentId!=null}">
<script language="javascript">
var checkout=${param.indexp};
</script>
</c:if>
 <c:if test="${param.departmentId==null}">
<script language="javascript">
var checkout=0;
</script>
</c:if>

<script language="javascript">
function mmoveout(id){
 if(checkout==id){
document.getElementById('dep'+id).className="ny_yytit";
}else{
 document.getElementById('dep'+id).className="ny_unyytit";

}

}

function changeValue(index,total,id){
document.getElementById('dpName').innerHTML= "深圳分公司-"+document.getElementById('deptName'+id).value;
document.getElementById('deptName').innerHTML=document.getElementById('deptName'+id).value;
document.getElementById('deptPhone').innerHTML=document.getElementById('deptPhone'+id).value;
document.getElementById('deptFax').innerHTML=document.getElementById('deptFax'+id).value;
document.getElementById('deptSeat').innerHTML=document.getElementById('deptSeat'+id).value;
document.getElementById('deptAddress').innerHTML=document.getElementById('deptAddress'+id).value;
document.getElementById('deptIntro').innerHTML=document.getElementById('deptIntro'+id).value;

for(var i=0;i<total;i++){
if(i==index){
checkout=i;
document.getElementById('dep'+i).className="ny_yytit";
}else{
document.getElementById('dep'+i).className="ny_unyytit";
}
}

}
</script>
</head>

<body  <c:if test="${!param.departmentId}"> onload="changeValue(${param.departmentId})" </c:if>>
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
				<div class="dh_one" id="yingye">
					<a href="${ctx}/sz/yingye.jsp">营业部信息</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_unone" id="yuye" onmouseover="className='dh_one'"
					onmouseout="className='dh_unone'">
					<a href="${ctx}/sz/yuye.jsp">预约开户</a>
				</div>

			</div>
			<div class="dh_rt"></div>

		</div>

<div id="neiye_box">
  <div class="neiye_left">
    <div class="mnr_jiao">
    <div style="background:url(${contextPath }/images/branchcomp/jl_img1.jpg) no-repeat;height:83px;width:208px;">
		<div id="BDBridgeFixedWrap"></div>				
	</div>
    <a href="${ctx}/sz/yuye.jsp"><img src="${contextPath }/images/branchcomp/yuyo_img.jpg" width="208" height="83" /></a></div>
    <bean:size id="count" name="departments"/>
    <c:forEach items="${departments}" var="department" varStatus="status">
     	 
    <div 
    id="dep${status.index}"
    <c:if test="${param.departmentId!=null}">
    
    <c:choose><c:when test="${param.departmentId==department.id}"> 
    <c:set var="statusindex" value="${status.index}" scope="page"></c:set>
    <c:set var="departmentIntro" value="${department}" scope="page"></c:set>	class="ny_yytit" </c:when><c:otherwise>class="ny_unyytit" </c:otherwise></c:choose> 
    </c:if>
    <c:if test="${param.departmentId==null}">
    <c:choose><c:when test="${status.index==0}">
     <c:set var="departmentIntro" value="${department}" scope="page"></c:set>	class="ny_yytit"</c:when><c:otherwise>class="ny_unyytit" </c:otherwise></c:choose> 
    </c:if>
      onmouseover="className='ny_yytit'" onmouseout="mmoveout(${status.index })"
   onclick="changeValue(${status.index },${count },${department.id})" >${department.deptName}</div>
    
   <input id="deptAddress${department.id}" type="hidden" value="${department.deptAddress}" />
   <input id="deptSeat${department.id}" type="hidden" value="${department.deptSeat}" />
   <input id="deptFax${department.id}" type="hidden" value="${department.deptFax}" />
   <input id="deptPhone${department.id}" type="hidden" value="${department.deptPhone}" />
    <input id="deptName${department.id}" type="hidden" value="${department.deptName}" />
    <input id="deptIntro${department.id}" type="hidden" value="${department.deptIntro}" />
    </c:forEach>
 </div>
  
  <div class="neiye_right">
    <div class="nyr_titbox">
        <div class="nyr_tit1"></div>
        <div class="nyr_tit2"><strong id="dpName"> 深圳分公司-${departmentIntro.deptName}</strong></div>
        <div class="nyr_tit3"></div>
     </div>
     
     <div class="nyr_thing">
       <table width="618" border="1" cellpadding="0" cellspacing="0" bordercolor="#e2e2e2" style="background:#f4f4f4; border-collapse:collapse;font-size:14px;color:#000000;">
         <tr>
           <td width="174" height="35" class="padright">营业部名称：</td>
           <td width="438" height="35" class="padrt2"><strong id="deptName">${departmentIntro.deptName}</strong></td>
         </tr>
         <tr>
           <td height="35" class="padright">营业部咨询电话：</td>
           <td height="35" class="padrt2" id="deptPhone">${departmentIntro.deptPhone}</td>
         </tr>
         <tr>
           <td height="35" class="padright">传真：</td>
           <td height="35" class="padrt2" id="deptFax">${departmentIntro.deptFax}</td>
         </tr>
         <tr>
           <td height="35" class="padright">深圳席位号：</td>
           <td height="35" class="padrt2" id="deptSeat">${departmentIntro.deptSeat}</td>
         </tr>
         <tr>
           <td height="35" class="padright">营业部地址：</td>
           <td height="35" class="padrt2" id="deptAddress">${departmentIntro.deptAddress}</td>
         </tr>
       </table>
       <Br />
		<code id="deptIntro" style="font-size:12px;color:#000;margin:0;padding-top:0px;font-family:'微软雅黑'; font-size:12px;">${departmentIntro.deptIntro}</code>
		
		<Br />
		<Br />
     <center><a href="${ctx}/sz/init_sz.do?method=initInfoCenter"><img src="${contextPath }/images/branchcomp/beback.jpg" width="134" height="30" /></a></center></div>
     
  </div>
    
</div>

<div id="bottom_bg">
   <div class="bottomfont">[ICP 备案登记证编号：粤ICP备11070729号] 　广发证券股份有限公司版权所有 Copyright © 2000-2012 All Rights Reserved.</div>
   <div class="btm_web"><img src="${contextPath }/images/branchcomp/depend_wet.jpg" width="128" height="47" style="float:right;" /><img src="${ctx}/images/branchcomp/police.jpg" width="39" height="47" /></div>
</div>


<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F82dc9bf3206b62ad7a8e0de3597a5409' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>
