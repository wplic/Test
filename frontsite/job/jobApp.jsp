<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.ThrPostInfoService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hr.pojo.ThrPostInfo"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="com.cssweb.hr.service.HrApplyRecorderService"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrApplyRecorder"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value="myResume"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<c:if test="${message!=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	ThrPostInfoService thrPostInfoService = (ThrPostInfoService)ctx.getBean("thrPostInfoService");
	HrApplyRecorderService hrApplyRecorderService = (HrApplyRecorderService)ctx.getBean("hrApplyRecorderService");
	
	List<ThrPostInfo> list = thrPostInfoService.getAllList();
	
	HrUser hrUser = (HrUser)request.getSession().getAttribute("hrUser");
	
	long oneJobId = 0l;
	long twoJobId = 0l;
	if(null!=request.getParameter("oneJobId")){
		oneJobId = Long.parseLong(request.getParameter("oneJobId"));
	}
	if(null!=request.getParameter("twoJobId")){
		twoJobId = Long.parseLong(request.getParameter("twoJobId"));
	}
	Map map = new HashMap();
	HrApplyRecorder job1=null;
	if(hrUser!=null){
		if(oneJobId==0 && twoJobId==0){
			map.put("userId",hrUser.getId());
			map.put("wish",1);
			job1 = hrApplyRecorderService.getRecorderByUser(map);
			oneJobId  = (job1==null?0L:job1.getJobId());
			
			map.put("wish",2);
			HrApplyRecorder job2 = hrApplyRecorderService.getRecorderByUser(map);
			twoJobId  = (job2==null?0L:job2.getJobId());
		}
	}
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 简历投递系统</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/application_lmenu.jsp?nav=apply" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>申请职位</h4></div>
<p class="inden25 lh30 cuxuxianb"><span class="red">申请提示：</span>您最多可以选择两个职位</p>
<div class="clearfloat"></div>
<form action="${ctx }/hrUserAction.do?method=hrUserJobApply" method="post" 
		name="hrForm" >   
<table width="100%" border="0" class="lh30">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" class="font14 bold">第一志愿岗位：</td>
    <td><select name="firstPosition" id="firstPosition" style="width:400px;">
    		<option value="">====请选择====</option>
    		<%
    			if(list!=null && list.size()>0){
    				ThrPostInfo bean =null;
    				for(int i=0;i<list.size();i++){
    					bean = (ThrPostInfo)list.get(i);
    			%>
    				<option value="<%=bean.getId() %>" <%if(bean.getId().longValue()==oneJobId){out.println("selected");} %>><%=bean.getType()+"-"+bean.getBranchName()+"-"+bean.getPostName()+"("+bean.getCategory()+")" %></option>
    				
    			<%
    				}
    			}
    		 %>
    </select></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
  <tr>
    <td align="right" class="font14 bold">第二志愿岗位：</td>
    <td><select name="secondPosition" id="secondPosition" style="width:400px;">
    	<option value="">====请选择====</option>
    		<%
    			if(list!=null && list.size()>0){
    				ThrPostInfo bean =null;
    				for(int i=0;i<list.size();i++){
    					bean = (ThrPostInfo)list.get(i);
    			%>
    				<option value="<%=bean.getId() %>" <%if(bean.getId().longValue()==twoJobId){out.println("selected");} %>><%=bean.getType()+"-"+bean.getBranchName()+"-"+bean.getPostName()+"("+bean.getCategory()+")" %></option>
    				
    			<%
    				}
    			}
    		 %>
    </select></td>
  </tr>
  <%--
  <tr>
    <td colspan="2" style="padding-left: 285px">
    	<select multiple="multiple" size="8" style="width: 195px" ondblclick="window.open('${ctx }/job/jobReq.jsp?jobId='+this.value);">
    		<%
    			if(list!=null && list.size()>0){
    				ThrPostInfo bean =null;
    				for(int i=0;i<list.size();i++){
    					bean = (ThrPostInfo)list.get(i);
    			%>
    				<option value="<%=bean.getId() %>" ><%="--"+bean.getType()+"--"+bean.getPostName()+"--("+bean.getCategory()+")" %></option>
    				
    			<%
    				}
    			}
    		 %>
    	</select>
    </td>
  </tr>--%>
   <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="cuxuxian">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" class="font14"><span class="red">*</span>是否服从调剂 &nbsp;&nbsp;&nbsp;&nbsp;
      <input name="ifTj" type="radio" value="1" <%=(job1!=null&&job1.getIfTj()==1)?"checked='checked'":"" %>/>
是
<input name="ifTj" type="radio" value="0" <%=(job1==null||job1.getIfTj()==0)?"checked='checked'":"" %>/>
否</td>
  </tr>
  <tr>
    <td height="60" colspan="2" align="center" class="font14"><input name="button" type="submit" class="bu08" id="button" value="保存并下一步" /></td>
  </tr>
</table>
</form>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>