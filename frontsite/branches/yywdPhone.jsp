<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.util.List"%>
<%@page import="org.springframework.context.ApplicationContext"%>

<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.systemset.service.BranchManagerService"%>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@page import="com.cssweb.systemset.pojo.Branch"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
<%
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		BranchManagerService branchManagerService =(BranchManagerService)ctx.getBean("branchManagerService");
		String branchName="";
		String branchAdd="";
		String branchPhone="";
		String branchFax="";
		String branchPost="";
		long id=0l;
		if(request.getParameter("id")!=null&&!request.getParameter("id").equals(""))
		{
		  id=Long.parseLong(request.getParameter("id").trim());
		}
		if(id>0)
		{
		  Branch branch = branchManagerService.getBranchById(id);
		  if(branch!=null)
		  {
		   branchName=branch.getBranchName();
		   branchName=!branchName.equals("")&&branchName.length()>13?branchName.substring(0,13)+"...":branchName;
		   branchAdd=branch.getAddress()!=null?branch.getAddress():"";
		   branchPhone=branch.getZphone()!=null?branch.getZphone():"";
		   branchFax=branch.getFax()!=null?branch.getFax():"";
		   branchPost=branch.getPost()!=null?branch.getPost():"";
		  }
		}else{
		 branchName="广发总部";
		 branchAdd="广州市天河北路183号大都会广场36、38、41、42楼";
		 branchPhone="020-87555888   95575";
		 branchFax="020-87553600";
		 branchPost="510075";
		}
		
		SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(null!=request.getParameter("id") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("id")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
%>
<body bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">
  <table width="100%" border="0" class="tab_sdgd">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold"><%=branchName %></p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6 yywd_dz">
          <table width="100%" border="0" class="textcenter lh25">
            <tr>
              <th width="22%" valign="top">地址：</th>
              <th width="78%" valign="top"><%=branchAdd %> </th>
              </tr>
            <tr>
              <td>电话：</td>
              <td><%=branchPhone %></td>
              </tr>
            <tr>
              <td>传真：</td>
              <td><%=branchFax %></td>
              </tr>
            <tr>
              <td>邮编：</td>
              <td><%=branchPost %></td>
              </tr>
          </table></td>
        </tr>
      </table>
</body>        
    <!-- 以下为iframe高度自适应代码 -->
  <SCRIPT LANGUAGE="JavaScript">
function frameFitSelfHeight1(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	myCountNum++;
	if(myCountNum<=20){
		window.parent.window.document.getElementById(myFrameId).height = window.parent.window.document.getElementById(myFrameId).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeight1(myFrameId,myCountNum)',100);
	}
}
frameFitSelfHeight1('yywPhone',null);
</SCRIPT>
</html>