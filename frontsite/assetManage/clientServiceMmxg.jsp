
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
		
		if ( request.getAttribute("flag")!= null)
		{
				Boolean flag =(Boolean)request.getAttribute("flag");
				if (flag)
				{
					%>
						<script type="text/javascript">
									alert("修改成功");
						</script>
					<%
				}
				else
				{
					%>
						<script type="text/javascript">
									alert("修改失败");
						</script>
					<%	
				}
				
		}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script >
		function checkPass()
		{
				var oldLcpass = document.getElementById("oldLcpass").value;
				var newLcpass = document.getElementById("lcpass").value;
				var newLcpass1 = document.getElementById("lcpass1").value;
				if (oldLcpass == null || oldLcpass == "")
				{
						alert("请输您的原始密码!");
						return false;
				}
			
				if (newLcpass == null || newLcpass == "")
				{
						alert("请输您的新密码!");
						return false;
				}
				if (newLcpass1 == null || newLcpass1 == "")
				{
						alert("请输您的确认新密码!");
						return false;
				}
				
				if (newLcpass != null && newLcpass1 != null && newLcpass !=  newLcpass1)
				{
						alert("您输入的新密码不一至，请重新输入!");
						return false;
				}
		}
</script>
</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 密码修改</div>
</div>
<div class="wrap_2left">
	<form action="${ctx}/clientservice/LcUserInfo.do?method=updatePass&menu=mmxg" id="acctTransForm" name="acctTransForm" onsubmit="return checkPass();" method="post">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/clientService_lmenu.jsp?nav=mmxg" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>密码修改 </h4></div>
  <div class="blank10"></div>

    <div class="lccxtop">密码修改</div>
    <div class="lccxmid" style="height:225px">
   	  <div style="height:35px"></div>
        <table width="280" align="center" class="lh30">
          <tr>
            <td>　原始密码：</td>
            <td><input name="oldLcpass" type="password" class="inpu" id="oldLcpass"  style="width:135px" /></td>
          </tr>
          <tr>
            <td>　新 密 码：</td>
            <td><input name="lcpass" type="password" class="inpu" id="lcpass" style="width:135px" /></td>
          </tr>
          <tr>
            <td>　确认密码：</td>
            <td><input name="lcpass1" type="password" class="inpu" id="lcpass1" style="width:135px" /><input type="hidden" value="600918" /> </td>
          </tr>
        </table>
      <div class="clearfloat h25"></div>
      <p align="center">
        <input type="submit" class="khfwbut red" name="button" id="button" value="确定" /> 
        <input type="submit" class="khfwbut red" name="button3" id="button3" value="重置" />
      </p>
    </div>
    <table width="491" border="0" align="center" cellpadding="0" cellspacing="0" style=" border-top:1px solid #ececec;border-bottom:1px solid #ececec; padding:1px">
      <tr>
        <td class="lh30 pl10">提示：此密码仅用于登录广发网进行账户查询，不涉及交易/通讯密码的变动！</td>
      </tr>
    </table> 
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</form>
</body>
</html>