<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/assetManage/khfwleft.jpg" /></p>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<% 
AssetUser assetUser = null;
String fundAccount="";
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		fundAccount = assetUser.getFundAccount();
	}
	String clientUrl="/assetManage/clientService.jsp";
	if(!fundAccount.equals("")&&fundAccount.length()>2)
	{
	  if(fundAccount.substring(0,2).equals("98")||fundAccount.substring(0,2).equals("87"))
	  {
	   clientUrl="/balFundFundAction.do?method=getBalFundList&menu=zhyexx";
	  }
	}
%>	
<div class="sidemenu">
  		<table>
          <tr>
            <td class="link sideblue">
            <a href="<%=clientUrl %>">
            帐户查询</a></td>
          </tr>
          
          <tr>
            <td class="link sideblue" id="zgjj"><a href="#">理财工具</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="zgjj"><a href="survey.jsp">调研问卷</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="zgjj"><a href="http://218.19.190.13/cgiwt_new/login.php?act=display_login_form">网上交易</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="fwnr"><a href="${contextPath }/assetManage/fwnr.jsp">服务内容</a></td>
          </tr>
        </table>

  </div>
  
<%
			String leftmenu =	request.getParameter("leftmenu");
			if (leftmenu != null && !"".equals(leftmenu))
			{
				%>
						<script type="text/javascript">
								document.getElementById('<%=leftmenu%>').className = "active sideblue";
						</script>
				<%			
			}
%>


