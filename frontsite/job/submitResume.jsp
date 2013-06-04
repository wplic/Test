<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserSubmitService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserSubmit"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
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
	String.prototype.trim = function() {   
		    return this.replace(/^\s+/g,"").replace(/\s+$/g,"");   
		}  

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
	
	function subForm(action){
		if(!checkdata("ifcheck")){
			alert("是否可进行核实不能为空");
			return;
		}
		if('0'==getcheckdata("ifcheck") && ''==document.hrForm.notCheckReason.value.trim()){
			alert("不同意进行核实时，理由不能为空！");
			document.hrForm.notCheckReason.focus();
			return;
		}
		if(!checkdata("ifreadDocument")){
			alert("是否可进行调阅不能为空");
			return;
		}
		if('0'==getcheckdata("ifreadDocument") && ''==document.hrForm.notReadReason.value.trim()){
			alert("不同意进行调阅时，理由不能为空！");
			document.hrForm.notReadReason.focus();
			return;
		}
		
		var name = document.getElementById("name").value.trim();
		var promisesTime= document.getElementById("promisesTime").value.trim();
		if(name==""){
			alert("承诺人不能为空");
			document.hrForm.name.focus();
			return;
		}
		if(promisesTime==""){
			alert("承诺时间不能为空");
			return;
		}
		if('1'==action){
			document.hrForm.action='${ctx }/hrUserAction.do?method=saveHrUserSubmit';
			document.hrForm.submit();
		}else if('2'==action){
			document.hrForm.action='${ctx }/hrUserAction.do?method=saveResume';
			//if(confirm("简历提交后不可以修改，请您确认所填写的信息准确无误！")){
			if(confirm("您可通过“简历预览”功能检查所填信息的真实、完整性，确认无误后方可提交！")){
				document.hrForm.submit();
			}
		}
	}
	function gotocp(){
		window.open('${ctx }/job/gxcpUserInfo.jsp?nav=myResume','');
	}
</script>
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	HrUserSubmitService service = (HrUserSubmitService)ctx.getBean("hrUserSubmitService");
	HrUserSubmit userSubmit = new HrUserSubmit(); 
	if(hrUser!=null){
		userSubmit = service.getBeanById(hrUser.getId());
	}
	pageContext.setAttribute("userSubmit",userSubmit);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 简历投递系统</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/application_lmenu.jsp?nav1=sub" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>我的简历</h4></div>
<p class="inden25 lh30 cuxuxianb"><span class="red">填写提示：</span><span class="red">*</span>所指明的是必填内容</p>
<div class="clearfloat"></div>
<table width="97%" border="0" align="center">
  <tr>
    <td height="30"><img src="/pic/job/dot-hd.gif" align="absmiddle" />&nbsp;&nbsp;<strong class="bold red">提交简历</strong></td>
  </tr>
</table>
<form action="${ctx }/hrUserAction.do?method=saveHrUserSubmit" method="post" 
		name="hrForm">
<table width="97%" border="0" align="center" class="lh30">
  <tr>
    <td colspan="2">特别说明：您是否同意我司对此简历中所提供的信息在认为必要时进行核实</td>
    </tr>
  <tr>
    <td width="50%" align="center"><span class="red">*</span>
<label>
  <input type="radio" name="ifcheck" id="ifcheck1" value="1" <c:if test="${userSubmit.ifcheck eq '1' }">checked='checked'</c:if>/>
</label>
      同意
      <input type="radio" name="ifcheck" id="ifcheck2" value="0" <c:if test="${userSubmit.ifcheck eq '0' }">checked='checked'</c:if>/>
      不同意</td>
    <td><input name="notCheckReason" type="text" class="w123" maxlength="60" id="notCheckReason" value="${userSubmit.notCheckReason }"/>
      若不同意请说明理由</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">您是否同意我司在必要时对您的档案进行调阅</td>
  </tr>
  <tr>
    <td align="center"><span class="red">*</span>
      <label>
        <input type="radio" name="ifreadDocument" id="ifreadDocument1" value="1" <c:if test="${userSubmit.ifreadDocument eq '1' }">checked='checked'</c:if>/>
      </label>
      同意
      <input type="radio" name="ifreadDocument" id="ifreadDocument2" value="0" <c:if test="${userSubmit.ifreadDocument eq '0' }">checked='checked'</c:if>/>
      不同意</td>
    <td><input name="notReadReason" type="text" class="w123" maxlength="60" id="notReadReason" value="${userSubmit.notReadReason }" />
      若不同意请说明理由</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="2"><span class="red">承诺：</span>如果您已经完成填写您个人的简历信息，并且愿意所提供的信息负责，并确保其真实、准确，请在下面的文本框中输入您的姓名和当前日期，来签署确认。如果您不同意所提供的信息负责，请单击“上一步”按钮重新填写。
    <br/>
    <span class="red bold">请务必确认您简历信息的真实、准确性，我司将在正式录用前开展背景调查，若发现有不属实的信息，将由您本人承担由此导致的一切责任。</span>
    </td>
    </tr>
  <tr>
    <td align="right"><span class="red">*</span>
      <label> </label>
      承诺人：</td>
    <td><input name="name" type="text" class="w123" id="name" value="${userSubmit.name }"/></td>
  </tr>
  <tr>
    <td align="right"><span class="red">*</span>
      <label> </label>
      承诺时间：</td>
    <td><input name="promisesTime" type="text" class="w123" id="promisesTime" value="<%=sdf.format(new Date()) %>" readonly/>
   </tr>
  <tr>
    <td height="15" colspan="2" class="cuxuxian"></td>
    </tr>
  <tr>
    <td height="30" colspan="2" align="center"><input name="button2" type="button" onclick="window.location.href='${ctx }/job/otherExp.jsp?nav=myResume'" class="bu08" id="button2" value="返回上一步" />
&nbsp;&nbsp;

<input name="button3" type="button" class="bu08" onclick="subForm(1);" id="button3" value="保 存" />
&nbsp;&nbsp;
<input name="button3" type="button" class="bu08" onclick="subForm(2);" id="button3" value="提交简历" /></td>
    </tr>
  <tr>
    <td colspan="2"><span class="red">提示：</span>如果系统报错，无法提交您的简历，请致电95575，我们将尽快解决，谢谢您的支持与合作。</td>
    </tr>
  <tr>
    <td height="15" colspan="2" class="cuxuxian"></td>
    </tr>
  <!-- 2013-3-21 取消个性倾向测评 <tr>
    <td height="30" colspan="2" align="center"><input name="input2" type="button" class="bu08" value="进行个性倾向测评" onclick="gotocp()"/></td>
    </tr> -->
 </table>
</form>
<div class="blank10"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>