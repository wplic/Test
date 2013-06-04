<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.util.List"%>
<%@page import="com.cssweb.complaints.pojo.FinanceMessage"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.util.StringUtils"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
<%
	List financeMsgList = null ;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (request.getAttribute("list") != null )
	{
	financeMsgList = (List)request.getAttribute("list");
	}	
 %>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	
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
<body>
<jsp:include page="/gyjj/index_top.jsp?nav=gtbz" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_gtbz.jpg" /></h3>
      <ul class="navleftList">
      <li class="this"><a href="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=4">留言板</a></li>
      <li><a href="${contextPath }/gyjj/questions.jsp">常见问题</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>留言板</h3><span><b>首页</b>><b>沟通帮助 </b>><strong>留言板</strong></span></div>
     
      <div class="columnMain help"> 
        <form action="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=4" name="msgForm" method="post">
        <%
       			if (financeMsgList != null && financeMsgList.size() >0 )
       			{
       					for (int i = 0 ; i < financeMsgList.size() ; i ++ )
       					{
       						FinanceMessage financeMessage =	(FinanceMessage)financeMsgList.get(i);
       						%>
       						
       					
       	<dl class="messageList"><dt>
       	 <%=(financeMessage.getName()==null ?"":financeMessage.getName()) %>:
       	 <a href="#" title="<%=(financeMessage.getMsgConnect() == null ?"":financeMessage.getMsgConnect()) %>">
       	 <%=(financeMessage.getMsgConnect() == null ?"": financeMessage.getMsgConnect().length()>20?financeMessage.getMsgConnect().substring(0,20)+"...":financeMessage.getMsgConnect()) %></a>
        <span>
        <%= (financeMessage.getMsgTime() == null ?"":sdf.format(financeMessage.getMsgTime())) %>
        </span>
        </dt>
       
       <dd>
       <a href="#" title="<%=financeMessage.getAnswerConnect() == null ?"":financeMessage.getAnswerConnect()  %>">
       <%= financeMessage.getAnswerConnect() == null ?"":(financeMessage.getAnswerConnect().length()>20?financeMessage.getAnswerConnect().substring(0,20)+"...":financeMessage.getAnswerConnect()) %>
       </dd>
      </dl>
       						<%
       					}
       			}
       			
       			
       	 %>
        <div align="center">
        <%=PageUtil.pagination("window.msgForm",totleCount, currentPage, pagesize)%>
        </div>
        </form>
        <div class="liuyanBox">
        <form action="${contextPath }/financeMsgAction.do?method=saveFinanceMsg&ext3=4" name="financeForm" id="financeForm" method="post" > 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="liuyandate">
          <tr>
            <th width="26%">您的姓名：</th>
            <td width="74%">
            <input class="entrytext" type="text" name="name" id="name" maxlength="5"/>
           </td>
          </tr>
          <tr>
            <th>您的邮箱：</th>
            <td>
            <input class="entrytext" type="text" name="email" id="email" maxlength="20"/>
            </td>
          </tr>
          <tr>
            <th>您的电话：</th>
            <td>
            <input class="entrytext"  type="text" name="telephone" id="telephone" maxlength="11"/>
            </td>
          </tr>
          <tr>
            <th valign="top">您的建议：</th>
            <td>
            <textarea class="moretext" name="msgConnect" id="msgConnect" cols="45" rows="5"></textarea>
            </td>
          </tr>
          <tr>
            <th>验&nbsp;&nbsp;证&nbsp;&nbsp;码：</th>
            <td>
            
            <input class="codetext" size="4" id="verifyCode" type="text" name="verifyCode" maxlength="4" style=" width:40px">
            
            <span>
            <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="60" height="28" align="absmiddle" border="0">
             <a href="javascript:refreshCaptcha();" >看不清？换一张</a>
            </span>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="btn" >
              <input type="button" name="button" id="button" class="submitbtn" onclick="return checkFinanceMsg();"/>
              <input type="button" name="button" id="button"  class="resetbtn" /></td>
            </tr>
        </table>
        </form>
        </div>
      </div>
       
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    </td>
    </tr>
</table>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
<script language="javascript">
			function checkFinanceMsg()
			{
					var msgConnect =	document.getElementById('msgConnect').value;
					var name = document.getElementById('name').value;
					var telephone = document.getElementById('telephone').value;
					var email = document.getElementById('email').value;
					//var address = document.getElementById('address').value;
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
            var url="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=4";
            if(msg!="")
			   {
			    url=url+"&msgConnect="+encodeURI(msg);
			   }
			 document.location.href=url;  
            } 
</script>
</html>
