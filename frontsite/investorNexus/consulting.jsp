<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.complaints.pojo.FinanceMessage"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.util.StringUtils"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
	List financeMsgList = null ;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (request.getAttribute("list") != null )
	{
	financeMsgList = (List)request.getAttribute("list");
	}	
 %>
<script>
var hotCount =<%=financeMsgList.size() %>;
var lastOperatedHotPool = -1;

function showPoolHotContent(showPoolId, questionId){
	if(hotCount != -1){
		if(lastOperatedHotPool != showPoolId){
			for(var i=0; i<hotCount; i++){
				document.getElementById("poolHotContent"+i).style.display="none";
			}
			document.getElementById("poolHotContent"+showPoolId).style.display="";
			lastOperatedHotPool = showPoolId;
		}else{
			document.getElementById("poolHotContent"+showPoolId).style.display="none";
			lastOperatedHotPool = -1;
		}
	}
}
</script>
 <%
	
	String loginErrorMessage = null;
	if(request.getParameter("loginErrorMessage")!=null){
		loginErrorMessage =(String) request.getParameter("loginErrorMessage");
	}
	if(loginErrorMessage!=null){
%>
	<script type="text/javascript">
		alert('验证码输入不符！');
	</script>
<% 
	}
	String msg=null;
	if(request.getAttribute("loginErrorMessage22")!=null){
		msg =(String) request.getAttribute("loginErrorMessage22");
	}
	if(msg!=null){
%>
	<script type="text/javascript">
		alert('<%=msg%>');
	</script>
<% 
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
</head>

<body>
 <jsp:include page="/commons/mstop.jsp" />
  <div class="main">
    <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investorNexus/index.html">投资者关系</a> - 公众评议平台</div>
</div>
<form action="${contextPath }/financeMsgAction.do?method=saveFinanceMsg&ext3=2" name="financeForm" id="financeForm" method="post" >
<div id="light" class="white_content">

    	<div class="top"><span><a href="#" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';"><img src="../pic/mobile/zxpop4.gif" /></a></span>我要提问</div>
        <div class="con">
       	  <div style=" width:440px; margin:0 auto">
       	  <p style=" height:20px"><font color="red">*</font>请输入您的意见：</p>
                <textarea style="width:440px" name="msgConnect" id="msgConnect" cols="50" rows="8"></textarea>
            </div>
            <div class="blank10"></div><br />
            <div class="poptab1">
              <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="boxcen">
                <tr>
                  <td><font color="red">*</font> &nbsp;姓名： </td>
                  <td><label>
                    <input style="width:85px" type="text" name="name" id="name" maxlength="5"/>
                  </label></td>
                  <td><font color="red">*</font> &nbsp;手机号码：</td>
                  <td height="30"><input style="width:85px" type="text" name="telephone" id="telephone" maxlength="11"/></td>
                </tr>
                
                <tr>
                  <td><font color="red">*</font>&nbsp;Email：</td>
                  <td><input style="width:85px" type="text" name="email" id="email" maxlength="20"/></td>
                <td colspan="2"><font color="red">(* 为必填项)</font></td>
                </tr>
              <tr>
              <td style="width:85px">验证码：</td>
              <td>
              <input style="width:85px" size="4" id="verifyCode" type="text" name="verifyCode" maxlength="4" style=" width:40px">
              </td>
              <td><img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="60" height="28" align="absmiddle" border="0"></td>
              <td><a href="javascript:refreshCaptcha();" >看不清？换一张</a></td>
            </tr>
            
                <tr>
                  <td>地址：</td>
                  <td colspan="3"><input style="width:380px" type="text" name="address" id="address" maxlength="200"/></td>
                </tr>
              </table>
            </div>
        </div>
        <div class="bottom">
            <input type="button" class="btn_pop1" name="button" id="button" value="提交"  onclick="return checkFinanceMsg();"/>
        </div>
  </div>
  </form>
  <!--  <div id="fade" class="black_overlay"></div>-->
<div id="fade" ></div>
<div class="mobox">

  
  <div class="moleft">
  		<jsp:include page="/investorNexus/index_lmenu.jsp?nav=gzpjpf" />
  </div>
  
<form action="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=2" name="msgForm" method="post">
<div class="moright">
        <div class="blank10"></div>
		<div class="rtit2">公众评议平台</div>
		<div class="zx_search">
		  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		      <td width="22%"><label>
		        <input type="text" name="msgConnect" id="msgConnect1" value="${msgConnect }" />
	          </label></td>
		      
		      <td width="47%"><a href="javascript:checkFinanceMsgFrom2();"><img src="${contextPath}/pic/mobile/btn_sear.jpg" /></a></td>
		      <td width="13%"><a href="#" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block';"><img src="${contextPath}/pic/mobile/btn_que.jpg"/></a></td>
	        </tr>
	      </table>
		</div>
		<table width="99%" border="1" bordercolor="#cfcfcf" class="lh28 faqtab1">
  <tr>
    <th width="8%">序号</th>
    <th width="69%">问题</th>
    <th width="23%">时间</th>
    </tr>
       	<%
       			if (financeMsgList != null && financeMsgList.size() >0 )
       			{
       					for (int i = 0 ; i < financeMsgList.size() ; i ++ )
       					{
       						FinanceMessage financeMessage =	(FinanceMessage)financeMsgList.get(i);
       						%>
       						
       						
       						 <tr>
        <td><%=i+1 %></td>
        <td align="left" class="pl10" onclick="showPoolHotContent('<%=i %>','<%=financeMessage.getId() %>')">
        <a href="#" title="<%=(financeMessage.getMsgConnect() == null ?"":financeMessage.getMsgConnect()) %>">
        <%=(financeMessage.getMsgConnect() == null ?"": financeMessage.getMsgConnect()) %></a>
        </td>
        <td><%= (financeMessage.getMsgTime() == null ?"":sdf.format(financeMessage.getMsgTime())) %></td>
      </tr>
      <tr class="bg_f5" style="display: none" id="poolHotContent<%=i %>">
        <td>答：</td>
        <td colspan="2" align="left" class="p10">
       <%= financeMessage.getAnswerConnect() == null ?"":financeMessage.getAnswerConnect() %></td>
      </tr>
       						<%
       					}
       			}
       			
       			
       	 %>
	
        </table>
        <div class="blank10"></div><br />
        <div align="right"><%=PageUtil.pagination("window.msgForm",totleCount, currentPage, pagesize)%></div>
        <div class="blank10"></div>	
	
</div>
</form>
<div class="blank0"></div>
<br />
</div>
<jsp:include page="/commons/msbottom.jsp" />
<script src="/js/setTab.js" type="text/javascript"></script>
</body>
<script language="javascript">
			function checkFinanceMsg()
			{
					var msgConnect =	document.getElementById('msgConnect').value;
					var name = document.getElementById('name').value;
					var telephone = document.getElementById('telephone').value;
					var email = document.getElementById('email').value;
					var address = document.getElementById('address').value;
					if (msgConnect == null || msgConnect == '')
					{
						alert('请输入您要提问的内容!!');
						document.getElementById('msgConnect').focus(); 
						return false;
					}
					if (name == null || name == '')
					{
						alert('请输入您的姓名!!');
						document.getElementById('name').focus(); 
						return false;
					}
					if (email == null || email == '')
					{
						alert('请输入您的email地址!!');
						document.getElementById('email').focus(); 
						return false;
					}
					if (telephone == null || telephone=='' )
					{
						alert('请输入您的手机号码!!');
						return false;
					}
					var emailPat=/^(.+)@(.+)$/;
					var matchArray=email.match(emailPat);
					if (matchArray==null) {
					 alert("电子邮件地址格式不正确")
					 return false;
					}
					
					var verifyCode=document.getElementById("verifyCode").value; 
					if(verifyCode=="")
					   {
					     alert("验证码不能为空！");
					     document.getElementById("verifyCode").value="";
					     document.getElementById("verifyCode").focus();
					     return false;
					   }
					    if(verifyCode.length!=4)
					   {
					     alert("验证码应该是4位！");
					     document.getElementById("verifyCode").value="";
					     document.getElementById("verifyCode").focus();
					     return false;
					   }
					  document.getElementById("financeForm").submit();
			}
	function refreshCaptcha(){
	                     document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
                 }
            function checkFinanceMsgFrom2 ()
            {
            var msg=document.getElementById("msgConnect1").value;
            var url="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=2";
            if(msg!="")
			   {
			    url=url+"&msgConnect="+encodeURI(msg);
			   }
			 document.location.href=url;  
            } 
</script>
</html>