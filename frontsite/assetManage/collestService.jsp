<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="com.cssweb.collect.pojo.BalFund"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@page import="java.util.List"%>
<%
	AssetUser assetUser = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		String fundAccount = assetUser.getFundAccount();
	}else{%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
	//String fundAccount = assetUser.getFundAccount();
%>

<%
	List	balFundList = (List)request.getAttribute("balFundList");
	DecimalFormat dmf = new DecimalFormat("#0.00");
 %>
 <%
 	if(null!=request.getAttribute("flag")&&request.getAttribute("flag").equals("2")){
 		%>
 		<script language="javascript">
			alert("成功提交，谢谢参与！");
		</script>
 	<%}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div>
    <table>
    <tr>
    <td><b><a href="/acctCustAction.do?method=getAcctCustByDepositacct&menu=khjbxx"><font color="red" >完善您的资料，我们将为您提供更完善的服务！</font></a></b>
	</td>
	</tr>
    </table></div>
  <div class="comtit1">
    <h4>帐户余额信息</h4></div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">账户资产信息</span></div>
  <table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
    <tr class="rrtab_tt bold">
      <td><p align="center">理财账号 </p></td>
      <td><p align="center">帐户姓名 </p></td>
      <td><p align="center">计划代码</p></td>
      <td><p align="center">持有份额</p></td>
      <td align="center">昨日市值</td>
      <td align="center">分红方式</td>
      <td align="center">机构名称</td>
      
     </tr>
     <%
     		if (balFundList != null && balFundList.size()>0 )
     		{
     			for ( int i = 0 ; i < balFundList.size() ; i ++ )
     			{
     				BalFund balFund = (BalFund)balFundList.get(i);
     				%>
     					 <tr>
					      <td class="pl5">
					      	<%
					      			if (balFund != null && balFund.getDepositacct() != null)
					      			{
					      				%><%=balFund.getDepositacct() %><%
					      			}
					      			else
					      			{
					      					%>&nbsp;<%
					      			}
					      	 %>
					      </td>
					      <td align="center">
					      		<%
					      				if (balFund != null && balFund.getAccountabbr()!= null)
						      			{
						      				%><%=balFund.getAccountabbr() %><%
						      			}
						      			else
						      			{
						      				%>&nbsp;<%
						      			}
					      		 %>
					      </td>
					      <td align="center">
					      		<%
					      				if (balFund != null && balFund.getFundcode()!= null)
						      			{
						      				%><%=balFund.getFundcode() %><%
						      			}
						      			else
						      			{
						      				%>&nbsp;<%
						      			}
					      		
					      		 %>
						</td>
					      <td align="center">
								<%	
										if (balFund != null && balFund.getSumbuyvol() != null)
										{
												%><%= dmf.format(balFund.getSumbuyvol()) %><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
						  </td>
					     
					      <td align="center">
					      		<%	
										if (balFund != null && balFund.getNav() != null)
										{
												
												%><%= dmf.format(balFund.getNav())%><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
					      </td>
					      
					      <td align="center">
					      		<%	
										if (balFund != null && balFund.getDivtype() != null)
										{
										 String divtypeName="其他方式";
										 if(balFund.getDivtype().equals("0")||balFund.getDivtype().equals("2"))
										 	divtypeName="红利再投";
										 if(balFund.getDivtype().equals("1"))
										 	divtypeName="现金分红";
											%><%= divtypeName%><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
					      </td>
					      
					      <td align="center">
					      		<%	
										if (balFund != null && balFund.getDistributorname()!= null)
										{
												
												%><%= balFund.getDistributorname()%><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
					      </td>
					    </tr>
     				
     				<%
     				
     			}
     		}
     		
      %>
   
  </table>
  <div class="blank10"></div>
  <div class="khfwtit1 mt10"><span class="font14">基金经理视点</span>
  	<span ><a href="${contextPath }/assetManage/collestjjjlsd.jsp">more..</a> </span>
  	
  		
  </div>
   						<jsp:include page="${contextPath }/assetManage/newsCollectList.jsp">
				            <jsp:param name="catName" value="基金经理视点" />
				            <jsp:param name="whichCat" value="cpzx_jhlc_jjjlgd"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="selectSize" value="2"/>
				            <jsp:param name="showSize" value="5"/>
				    	</jsp:include>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
</body>
</html>