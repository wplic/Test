<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
<c:if test="${message !=null}">
<script>
	alert('${message}');
</script>

</c:if>

<script>


String.prototype.trim = function() {   
    return this.replace(/^\s+/g,"").replace(/\s+$/g,"");   
} 

function isEmail( str ){  
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/; 
	if(myReg.test(str)){ 
		return true;
	}else{
		return false;
	}
}

function fucCheckNUM( str ){  
	var myReg = /^[0-9]*[1-9][0-9]*$/; 
	if(myReg.test(str)){ 
		return true;
	}else{
		return false;
	}
}
function checkData(){
	var name = document.getElementById("adviceUserName").value;
	var email = document.getElementById("adviceUserEmail").value;
	var phone = document.getElementById("adviceUserPhone").value;
	var content = document.getElementById("adviceContent").value;
	var verifyCode = document.getElementById("verifyCode").value;
	if(name.trim()==''){
		alert('姓名不能为空');
		return false;
	}
	if(email.trim()=='' || !isEmail(email)){
		alert('邮箱不能为空或者格式不对');
		return false;
	}
	if(phone.trim()=='' || !fucCheckNUM(phone)){
		alert('电话号码不能为空且需数字类型');
		return false;
	}
	if(content.trim()==''){
		alert('意见和建议不能为空');
		return false;
	}
	if(verifyCode.trim()==''){
		alert('验证码不能为空');
		return false;
	}
}
</script>
</head>
<%
		String category = "tzyh_thgg";
 %>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - 留言反馈</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>留言反馈</h4></div>
   	<div class=" bg_f5 p10 lh25 mt2">尊敬的客户您好：<br />
为了更好地给您提供优质服务，我们在这里设置了留言板，如果您对我们的工作有任何意见和建议，欢迎您随时告诉我们，我们希望通过您的意见和建议改进工作和提高效率，感谢您的意见与帮助！</div>
		<div class="blank5"></div>
        
        <div class="tit706 bold">
          <table width="200" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="31" align="center"><img src="${contextPath}/pic/commons/list_01.gif" align="absmiddle" /></td>
              <td width="169">留言板</td>
            </tr>
          </table>
        </div>
        <div class=" bg_f5 mt2">
    <div class="blank10"></div>
   
    
    <form action="${contextPath}/advice.do?method=addAdvice" name="adviceForm" method="post" onsubmit="return checkData();">
        <table width="86%" align="center" class="lh24">
          <tr>
            <td width="3%"><img src="${contextPath}/pic/commons/list_02.gif" /></td>
            <td width="11%">您的姓名：</td>
            <td width="86%"><label>
              <input type="text" name="adviceUserName" id="adviceUserName" />
            </label></td>
          </tr>
          <tr>
            <td><img src="${contextPath}/pic/commons/list_02.gif" /></td>
            <td>您的邮箱：</td>
            <td><input type="text" name="adviceUserEmail" id="adviceUserEmail" /></td>
          </tr>
          <tr>
            <td><img src="${contextPath}/pic/commons/list_02.gif" /></td>
            <td>您的电话：</td>
            <td><input type="text" name="adviceUserPhone" id="adviceUserPhone" /></td>
          </tr>
          <tr>
            <td valign="top"><img class="pt7" src="${contextPath}/pic/commons/list_02.gif" /></td>
            <td colspan="2" valign="top">您的意见和建议：</td>
          </tr>
          <tr>
            <td colspan="3"><textarea name="adviceContent" id="adviceContent" cols="75" rows="5"></textarea></td>
          </tr>
          <tr>
            <td colspan="3">验证码：
            <input tabindex="3" type="text" id="verifyCode" name="verifyCode" size="5"  maxlength="4" dataType="Custom" regexp="[0-9]{4,4}$" msg="校验码只能数字组成，长度4位">
          	<img border=0 id="codeImage" src="${contextPath }/investmentBank/image.jsp"  style="margin-bottom:-5px;">
            </td>
          </tr>
        </table>
        
        <div class="blank10"></div>
        <p align="center">
        <input name="submit" type="submit" value="提交" class="but02 mr5" /><input name="" type="reset" value="重置" class="but02" /></p>
        <div class="blank10"></div>
        </div>
        </form>
  </div>
  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
		<div class="rtit1">发行公告</div>
        <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="200">
          <paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
	          <table width="93%" align="center" class="lh20 fcenter">
		          <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <tr>
		              <td width="13" valign="top"><img src="/pic/stockResearch/dot-hjt.gif" /></td>
		              <td><a href="${contextPath }/commons/infoList.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,60)%></a></td>
		            </tr>
		          </paging:pageRow>
	          </table>
          </paging:page>
          </marquee>
        </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>