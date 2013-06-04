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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
	if (request.getAttribute("list") != null )
	{
			financeMsgList = (List)request.getAttribute("list");
	}	
 %>
 
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
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <jsp:include page="${contextPath}/share/top.jsp?nav=wsyyt&nav1=gfydjyt" />
  <div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> 
   <jsp:include page="/mobile/pmdList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="2"/>
				    	</jsp:include>
  </div>
  <div class="blank5"></div>
</div>
<form action="${contextPath }/financeMsgAction.do?method=saveFinanceMsg" name="financeForm" id="financeForm" method="post" onsubmit="return checkFinanceMsg();" >
<div id="lightsjzq" class="white_content">

    	<div class="top"><span><a href="#" onclick = "document.getElementById('lightsjzq').style.display='none';document.getElementById('fade').style.display='none';"><img src="../pic/mobile/zxpop4.gif" /></a></span>我要提问</div>
        <div class="con">
       	  <div style=" width:440px; margin:0 auto">
       	  <p style=" height:20px"><font color="red">*</font>请输入您的问题：</p>
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
                  
                  <td><font color="red">*</font> &nbsp;手机型号：</td>
                  <td height="30"><input style="width:85px" type="text" name="ext1" id="ext1" maxlength="10"/></td>
                </tr>
                
                 <tr>
                  <td style="width:85px">所属营业部：</td>
                  <td><input style="width:85px" type="text" name="ext2" id="ext2" maxlength="20"/></td>
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
            <input type="submit" class="btn_pop1" name="button" id="button" value="提交"  />
        </div>
  </div>
  </form>
  <!--  <div id="fade" class="black_overlay"></div>-->
<div id="fade" ></div>
<div class="mobox">

  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp?leftnav=management4&leftnav2=null"/>
  </div>
  
<form action="${contextPath }/financeMsgAction.do?method=getFinanceMessageList" name="msgForm" method="post">
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
		<div class="rtit2">客户咨询</div>
		<br /><br />
		<div class="zx_search">
		  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		      <td width="22%"><label>
		        <input type="text" name="msgConnect" id="msgConnect" value="${msgConnect }" />
	          </label></td>
		      
		      <td width="47%"><a href="javascript:document.msgForm.submit()"><img src="${contextPath}/pic/mobile/btn_sear.jpg" /></a></td>
		      <td width="13%"><a href="#" onclick = "document.getElementById('lightsjzq').style.display='block';document.getElementById('fade').style.display='block';"><img src="${contextPath}/pic/mobile/btn_que.jpg"/></a></td>
	        </tr>
	      </table>
		</div>
       	<%
       			if (financeMsgList != null && financeMsgList.size() >0 )
       			{
       					for (int i = 0 ; i < financeMsgList.size() ; i ++ )
       					{
       						FinanceMessage financeMessage =	(FinanceMessage)financeMsgList.get(i);
       						%>
       							<dl class="faqlist">
						        		<dt>  
						        		
						        		<table>
						        		 <tr>
						        		  <td> <a title="<%=(financeMessage.getMsgConnect() == null ?"":financeMessage.getMsgConnect()) %>"><%=(financeMessage.getMsgConnect() == null ?"": financeMessage.getMsgConnect()) %></a></td>
						        		  <td width="3%"></td>
						        		  <td width="17%"><%= (financeMessage.getMsgTime() == null ?"":sdf.format(financeMessage.getMsgTime())) %></td>
						        		 </tr>
						        		</table>
						        		
						        		
						        		</dt>
						                <dd><%= financeMessage.getAnswerConnect() == null ?"":financeMessage.getAnswerConnect() %></dd>
						        </dl>
       						<%
       					}
       			}
       			
       			
       	 %>
	
        
        <div class="blank10"></div><br />
        <div align="right"><%=PageUtil.pagination("window.msgForm",totleCount, currentPage, pagesize)%></div>
        <div class="blank10"></div>	
	
</div>
</form>
<div class="blank0"></div>
<br />
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />
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
					var ext1 = document.getElementById('ext1').value;
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
					if (ext1 == null || ext1 == '')
					{
						alert('请输入您的手机型号!!');
						document.getElementById('ext1').focus(); 
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
					  
			}
	function refreshCaptcha(){
	                     document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
                 }
</script>
</html>