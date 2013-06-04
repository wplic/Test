<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<jsp:directive.page import="com.css.system.Configuration" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
</head>
<script type="text/javascript">
	function check(){
		var serviceName=document.getElementById("serviceName").value;
        if(serviceName=="")
        { 
            alert("服务名不能为空！");
	        document.getElementById("serviceName").focus();
	        return false;
        }
        if(serviceName.length>18)
        { 
            alert("服务名太长！");
	        document.getElementById("serviceName").focus();
	        return false;
        }
		//密码为 6-12 位字母或数字/^([A-Z]|[a-z]|[\d])*$/
		
		var old_passWord = document.getElementById("old_passWord").value;
		if(/^([A-Z]|[a-z]|[\d])*$/.test(old_passWord)==false||old_passWord.length<6||old_passWord.length>12){
			alert("密码为 6-12 位字母或数字");
			document.getElementById("old_passWord").value="";
			document.getElementById("old_passWord").focus();
			return false;
		}
		
		var password=document.getElementById("password").value;
		if(/^([A-Z]|[a-z]|[\d])*$/.test(password)==false||password.length<6||password.length>12){
			alert("密码为 6-12 位字母或数字");
			document.getElementById("password").value="";
			document.getElementById("password").focus();
			return false;
		}
		//新密码和旧密码是否相同
		var password_1=document.getElementById("password_1").value;
		if(password!=password_1){
			alert("两次输入密码不相同");
			document.getElementById("password_1").value="";
			document.getElementById("password_1").focus();
			return false;
		}
		document.getElementById("editLoginFrom").submit();
	}
</script>
<%
	String message="";
	if(request.getAttribute("message")!=null){
  		message=(String)request.getAttribute("message");
	}
    String serviceName="";
    TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser!=null) {
	  	serviceName= tsystemWebuser.getServiceName();
	}else{
	%>
		<script type="text/javascript">	
		      alert("请求异常！");
		      window.opener=null;
			  window.open('','_self');
			  window.close() ;
		  </script>
	<%}
	
	 if(!message.equals("")){
	    %>
		<script type="text/javascript">	
		      alert('<%=message %>');
		  </script>
	 	<%
	}
	   
	if(request.getParameter("col")!=null&&!request.getParameter("col").equals("")&&request.getParameter("col").equals("col"))
	{
	 %>
		<script type="text/javascript">	
		      window.opener=null;
			  window.open('','_self');
			  window.close() ;
		  </script>
	<%
	}
%>

<body class="body_bg">
<div>
  <div></div>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr><td></td></tr>
        <tr>
          <td valign="top">
            <table width="100%" border="1" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
            <tr>
              <td width="94%" class="wdzx_th indent10 bold"> 设置个人信息</td>
            </tr>
          </table> 
          <form id="editLoginFrom" name="editLoginFrom" action="${ctx}/oauth2/AuthPassword.go" method="post" onSubmit="">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lh28" bgcolor="#eceff4">
              <tr>
                <td colspan="3" height="28"></td>
              </tr>
              <tr>
                <td width="20%">&nbsp;</td>
                <td width="20%">服 务 名：</td>
                <td width="60%">
                    <% if (serviceName !=null && !serviceName.equals("")) {%>
					<input name="serviceName" id="serviceName" type="text" class="input108" style="width:130px" value="<%=serviceName%>"  size="18" readonly />
					<%} else { %>
					<input name="serviceName" id="serviceName" type="text" class="input108" style="width:130px" value="<%=serviceName%>"  size="18" />
					<%} %>
               </td>
              </tr>
              
              <tr>
                <td>&nbsp;</td>
                <td bgcolor="#eceff4">旧 密 码：</td>
                <td bgcolor="#eceff4">
                <input type="password" name="old_passWord" id="old_passWord" class="input108" style="width:130px"  size="20"/>
                </td>
             </tr>
             <tr>
                <td>&nbsp;</td>
                <td bgcolor="#eceff4">新 密 码：</td>
                <td bgcolor="#eceff4">
                <input type="password" name="password" id="password" class="input108" style="width:130px"  size="20"/>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td bgcolor="#eceff4"> 密码确认：</td>
                <td bgcolor="#eceff4">
                <input type="password" name="password_1"  id="password_1" class="input108" style="width:130px"  size="20"/>
                </td>
            </tr>
            
     
              <tr>
                <td height="36">&nbsp;</td>
                <td bgcolor="#eceff4">&nbsp;</td>
                <td bgcolor="#eceff4"><a href="#">
                  <input type="button" name="Submit2" id="button2" onclick='check()' value="保存" class="but_01" />
                <input type="reset" name="button4" id="button4" value="取消" class="but_01" />
                </a></td>
              </tr>
              <tr>
              <td colspan="3" height="20"></td></tr>
          </table>
          </form>
          </td>
        </tr>
      </table>
     

<br /><br />
</div>
</body>
</html>