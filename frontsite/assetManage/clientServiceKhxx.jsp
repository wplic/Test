<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.cssweb.clientService.pojo.LcUserInfo"/>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<jsp:directive.page import="java.util.*"/>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String fundAccount = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		fundAccount = assetUser.getFundAccount();
	}else{%>	
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function checkform(){
	var idcard = document.qForm.idcard.value;
	if(""==idcard){
		alert("请填写身份证号！");
		document.qForm.idcard.value="";
		document.qForm.idcard.focus();
		return false;
	}
	var address = document.qForm.address.value;
	if(""==address){
		alert("请填写地址！");
		document.qForm.address.value="";
		document.qForm.address.focus();
		return false;
	}
	var zipcode = document.qForm.zipcode.value;
	if(""==zipcode){
		alert("请填写邮政编码！");
		document.qForm.zipcode.value="";
		document.qForm.zipcode.focus();
		return false;
	}
	var email = document.qForm.email.value;
	if(""==email){
		alert("请填写EMAIL地址！");
		document.qForm.email.value="";
		document.qForm.email.focus();
		return false;
	}
	document.qForm.submit();
}
</script>
</head>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
List list = (List)request.getAttribute("list");
LcUserInfo lcUserInfo = null;
if(null!= list && list.size()>0){
	lcUserInfo = (LcUserInfo)list.get(0);
}
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 帐户资料修改</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="clientService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>帐户资料修改 </h4></div>
  <div class="blank10"></div>
	<form name="qForm" action="${ctx}/clientservice/LcUserInfo.do?method=saveOrUpdate" method="post">
    <table border="1" bordercolor="#cccccc" width="700" align="center" class="lh28">
      <tr>
        <td width="101" class="rrtab_tt pl5"> 资金号 </td>
        <td width="583" class="pl5"><input type="hidden" name="fundaccount" value="<%=fundAccount%>"><%=fundAccount%></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">账户姓名</td>
        <td class="pl5"><%=null==lcUserInfo?"":lcUserInfo.getClientName()%></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">身份证号</td>
        <td class="pl5">
          <input name="idcard" type="text" id="textfield" value="<%=null==lcUserInfo?"":lcUserInfo.getIdcard()%>" size="35" /><span class="red font_st ml5">*</span></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">地址</td>
        <td class="pl5"><input name="address" type="text" id="textfield3" value="<%=null==lcUserInfo?"":lcUserInfo.getAddress()%>" size="35" /><span class="red font_st ml5">*</span></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">电话</td>
        <td class="pl5"><input name="phone" type="text" id="textfield4" value="<%=null==lcUserInfo?"":lcUserInfo.getPhone()%>" size="35" /></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">邮政编码</td>
        <td class="pl5"><input name="zipcode" type="text" id="textfield5" value="<%=null==lcUserInfo?"":lcUserInfo.getZipcode()%>" size="35" /><span class="red font_st ml5">*</span></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">传真</td>
        <td class="pl5"><input name="fax" type="text" id="textfield6" value="<%=null==lcUserInfo?"":lcUserInfo.getFax()%>" size="35" /></td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">EMAIL地址</td>
        <td class="pl5"><input name="email" type="text" id="textfield7" value="<%=null==lcUserInfo?"":lcUserInfo.getEmail()%>" size="35" /><span class="red font_st ml5">*</span>(如需接收电子邮件信息，必填)</td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">开户日期</td>
        <td class="pl5"> <%=null==lcUserInfo?"":sdf.format(lcUserInfo.getOpenDate())%> </td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">销户日期</td>
        <td class="pl5"><%=null==lcUserInfo?"":lcUserInfo.getCancelDate()==null?"":sdf.format(lcUserInfo.getCancelDate())%> </td>
      </tr>
      <tr>
        <td class="rrtab_tt pl5">帐户状态</td>
        <td class="pl5">
		<%
			String status = "";
			if(null!=lcUserInfo){
				status = lcUserInfo.getClientStatus();
			}
			if("0".equals(status))
				status = "正常";
			else if("1".equals(status))
				status = "冻结";
			else if("2".equals(status))
				status = "挂失";
			else if("3".equals(status))
				status = "销户";
			out.println(status);
		%>
		</td>
      </tr>
    </table>
	<p align="center" class="mt10">
	  <input type="button" class="khfwbut red" name="button" id="button" value="确定"  onclick="checkform()"/>
	  <input type="reset" class="khfwbut red" name="button2" id="button2" value="重置" />
	</p>
	</form> 
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>