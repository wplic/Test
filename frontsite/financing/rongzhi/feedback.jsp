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
<link href="${contextPath }/css/financing/rongzhi/rongzhi.css" rel="stylesheet" type="text/css" />
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
	var content = document.getElementById("adviceContent").value;
	var verifyCode = document.getElementById("verifyCode").value;
	
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
<div class="wrap_2right" style="width:920px;">
  <!--左侧sied开始-->
  <div class="fleft" style="width:920px;">
  		<div class="comtit1"><h4 style="">留言反馈</h4></div>
   	<div class=" bg_f5 p10 lh25 mt2">尊敬的客户您好：<br />
非常感谢您参与本次“融智杯”融资融券仿真交易竞赛。为了能更好地了解您的操作需要，我们在这里为您设置了留言板，欢迎您对我们的仿真竞赛软件提出宝贵意见和优化建议，谢谢。
</div>
		
		   <div class=" bg_f5 mt2">
   
   
    
    <form style="width:72%;" action="${contextPath}/adviceAction.do?method=addAdviceRzrq" name="adviceForm" method="post" onsubmit="return checkData();">
        <table width="72%" align="center" class="feedback">
       
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
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>