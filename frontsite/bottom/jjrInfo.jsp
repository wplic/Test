<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.systemset.pojo.TgfFundInfo"%>
<%@page	import="com.cssweb.systemset.pojo.Branch"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<%
	List list =(List)request.getAttribute("list");	
	List branchList = (List)request.getAttribute("branchList");	
	String branch_no = (String)request.getAttribute("branch_no");
%>
<script >
		function fundInfoSubmit()
		{
				document.getElementById("tgfFundInfoForm").submit();
		}
</script>
</head>

<body class="ggjs_bg">
<form action="${contextPath }/tgfFundInfoAction.do?method=getTgfFundInfoAll" id="tgfFundInfoForm" name="tgfFundInfoForm" method="post">
  
<div class="ggjs_box">
	<div class="jobtcy_tt">
    	<p><a href="/default.jsp"><img src="/pic/job/tcy_logo.jpg" /></a></p>
    </div>
    <div class="ggjs_line"></div>
    
    <div class="dqwz"><span class=" mr10 ml10">当前位置：<a href="${contextPath }/default.html"> 首页 </a> - 基金销售网点及销售人员资格情况公示</span></div>
  <div class="p15">
    <div class="khfwcx"> <a href="#"></a>
  
    
      <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10%">营业部 ：</td>
          <td width="44%"><select id="branch_no" name="branch_no">
              <option selected="selected" value="">全部</option>
             
             <%
             		
             		
             if (branchList != null && branchList.size()>0)
				{
						for (int i =0 ; i < branchList.size() ; i ++ )
						{
							Branch branch1 =	(Branch)branchList.get(i);
							String  branchName = "";
							if ( branch1.getBranchName()!= null)
							{
								branchName = branch1.getBranchName() ;
							}
							
							if (branch_no != null && branch_no.equals(branch1.getBranchCode()))
							{
								%>
     						    	<option selected="selected"   value="<%= branch1.getBranchCode() %>" title="<%= branchName %>"><%= branchName %></option>
     							<%	
 							}else
 							{
	 							%>
	     						    <option    value="<%= branch1.getBranchCode() %>" title="<%= branchName %>"><%= branchName %></option>
	     						<%
 							} 
						}
				}
              %>
             
          </select></td>
          <td width="7%">姓名 ：</td>
          <td width="18%"><input name="name" type="text" id="name" style=" width:100px" value="${requestScope.name }" /></td>
          <td width="21%"><a href="#" onclick="fundInfoSubmit();"><img src="/pic/assetManage/butCx.jpg"/></a></td>
        </tr>
      </table>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="list_bline02">&nbsp;</td>
      </tr>
    </table>
    <table cellspacing="0" cellpadding="0" width="100%" class="lh25" border="1" bordercolor="#cccccc">
      <tr  class="rrtab_tt bold">
        <td align="center" nowrap="nowrap">基金销售网点</td>
        <td align="center">地址</td>
        <td align="center" nowrap="nowrap">客服电话</td>
        <td align="center" nowrap="nowrap">基金销售人员</td>
        
        <td align="center" nowrap="nowrap">资质类型</td>
         <td align="center" nowrap="nowrap">证书号码</td>
         <td align="center" nowrap="nowrap">证书名称</td>
      </tr>
      <%
      		if (list != null )
      		{
      				for (int i = 0 ; i < list.size() ; i ++)
      				{
      						TgfFundInfo	tgfFundInfo =	(TgfFundInfo)list.get(i);
      						%>
      								<tr bgcolor="#ffffff">
							        <td nowrap="nowrap" class="pl5"><%= (tgfFundInfo.getBranch() == null ?"":tgfFundInfo.getBranch()) %></td>
							        <td class="pl5"><%= (tgfFundInfo.getAddress() == null ?"":tgfFundInfo.getAddress()) %></td>
							        <td align="center"><%= (tgfFundInfo.getTelno() == null ?"":tgfFundInfo.getTelno()) %></td>
							        <td align="center"><%= (tgfFundInfo.getName() == null ?"":tgfFundInfo.getName()) %></td>
							        <td align="center" ><%= (tgfFundInfo.getCertifytype() == null ?"":tgfFundInfo.getCertifytype()) %></td>
							        <td align="center" ><%= (tgfFundInfo.getCertifyno() == null ?"":tgfFundInfo.getCertifyno()) %></td>
							        <td align="center" ><%= (tgfFundInfo.getCertifyname() == null ?"":tgfFundInfo.getCertifyname()) %></td>
							        
							      </tr>
      						<%
      				}
      		}
      		
       %>
   		<tr>
   				<td colspan="7" align="right"><%=PageUtil.pagination("window.tgfFundInfoForm",totleCount, currentPage, pagesize)%></td>
   		</tr>

    </table>
   
    <div align="center" class="mt10">
      <input name="input" type="button" class="but02 blue" value="关闭此页" onclick="javascript:window.opener=null;window.close();" />
    </div>
  </div>
  
    <jsp:include page="/commons/msbottom2.jsp" />
</div>
 </form>
</body>
</html>