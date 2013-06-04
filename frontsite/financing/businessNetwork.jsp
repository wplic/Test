<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.systemset.pojo.Branch"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>

<%
		List list = (List)request.getAttribute("list");
		Integer curPage = (Integer)request.getAttribute("curPage");
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
			function  searchBranch()
			{
				
				document.getElementById("yybListForm").action="${contextPath }/branchManagerAdminAction.do?method=getMainBranchList";
				document.getElementById("yybListForm").submit();
			}
</script>
</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<form action="${contextPath }/branchManagerAdminAction.do?method=getMainBranchList" id="yybListForm" name="yybListForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/rateNoticeLl.html">公告信息</a> - 业务网点</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="${contextPath}/financing/notice_lmenu.jsp" />
         <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>业务网点</h4></div>
    <div class="blank10"></div>
    <table width="96%" align="center">

  <tr>
    <td class="lh25"><p>尊敬的客户： <br />
      如果您在办理融入融券业务时有任何疑问，请与我们的业务网点联系！ </p></td>
  </tr>
  <tr>
  		<td>
  			<table>
  					<tr>
  							<td>业务网点查询:</td>
  							<td><input type="text" name="branch" id="branch" size="30" value="${requestScope.branch }" /></td>
  							<td><input type="button"  value="查询"  onclick="return searchBranch();"/></td>
  					</tr>
  			</table>
  			
  		</td>
  </tr>	
  <tr>
    <td>
    <table width="100%" border="1" bordercolor="#CCCCCC" class="lh25 mtb10 textcenter fcenter">
      <tr class="rrtab_tt bold">
        <td>序号</td>
        <td>分支机构</td>
        <td>融资融券专员</td>
        <td>联系电话</td>
        <td>联系邮箱</td>
      </tr>
      <%
      		int tmp = 1;
      		if (curPage > 1)
      		{
      		 tmp = (curPage-1) * 20+1;
      		}
      		if (list != null)
      		{
      		 
      				for (int i  = 0; i < list.size() ; i ++)
      				{
      						Branch branch  =	(Branch)list.get(i);
      						%>
      							<tr>
							        <td><%=tmp %></td>
							        <td><a href="${contextPath }/branchManagerAction.do?method=getBranchInfoById&id=<%=branch.getId()%>"><%=branch.getBranchName()==null?"":branch.getBranchName() %></a></td>
							         <td><%=branch.getRzrqname()==null?"":branch.getRzrqname() %></td>
							        <td><%=branch.getRzrqphone()==null?"":branch.getRzrqphone() %></td>
							        <td><%=branch.getRzrqemail()==null?"":branch.getRzrqemail() %></td>
						        </tr>	
      						<%
      						tmp ++;
      				}
      		}
       %>
      
    </table></td>
  </tr>
  <tr>
    <td class="lh30" align="right"><%=PageUtil.pagination("window.yybListForm",totleCount, currentPage, pagesize)%></td>
  </tr>
<tr>
    <td class="cuxuxian lh25">&nbsp;</td>
  </tr>
  <tr>
    <td align="right">
    </td>
  </tr>
</table>

    <div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
    </form>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
</body>
</html>