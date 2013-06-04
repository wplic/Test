<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.systemset.service.BranchManagerService"/>
<jsp:directive.page import="com.cssweb.systemset.pojo.Branch"/>
<jsp:directive.page import="java.util.*"/>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	BranchManagerService branchManagerService = (BranchManagerService) ctx.getBean("branchManagerService");
	Branch branch =	branchManagerService.getByBranchCode("fzjg");
	Map map = new HashMap();
	map.put("begin",0);
	map.put("end",5);
	map.put("parentId",branch.getId());
	//List branchlist = branchManagerService.getBranchPages(map);
	List branchlist = branchManagerService.getBranchRzrqPages(map);
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - 部门简介</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>部门简介</h4></div>
    <div class="blank5"></div>
<table width="96%" align="center" class="lh25">
  <tr>
    <td><img src="/pic/financing/rzrq_tu.jpg" align="left" class="mr15 mt10" />
      <p class="inden25">广发证券融资融券部是专职于融资融券业务运作和管理的部门。主要业务职能是负责客户资质审核与授信管理、信用账户的开立及管理、担保资产管理、融资融券业务交易与日常监控等各主要业务环节的运作；制订融资融券合同标准文本；组织制定融资融券管理制度和操作流程；对营业部的业务操作进行审批、复核和监督，并根据公司融资融券总规模及时调整营业部的融资融券规模；按审批权限调整或建议调整授信等级和额度；定期对融资融券业务运作情况进行评估，提出对策；定期向监管部门提交书面总结，向公司各层面报告融资融券业务运作情况等；负责信用产品设计与管理；负责融资融券业务的数据统计分析和报送工作。 </p><p class="inden25">
融资融券部的战略目标是对融资融券业务的探索和研究，结合公司由通道服务向理财服务转型的要求，以“追求风险可控下的合理收益”为风险管理理念，以“选择合适客户、推荐合适产品、提供合适服务”为目标，以强大的信息技术、资讯平台为业务支撑，由点及面、分级推进、全面铺开，追求客户满意的同时，实现公司收益最大化。目前，融资融券部已全面构建了开展融资融券业务的组织架构，形成了科学严密的四级风险控制体系，建立了运行安全、高效、功能全面的融资融券交易系统，配备了专业团队和充裕的资金，全面实施了客户资金第三方存管，为给客户提供安全、优质的融资融券服务奠定了坚实基础。</p></td>
    </tr>
</table>
<div class="clearfloat h15"></div>
  </div>  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
    <div class="rtit1">营业网点</div>
  <div class="bg_ff ptb6 ribor3">
    <table width="180" class="fcenter lh25 textcenter">
      <tr class="xuxian bold">
        <td width="39">序号</td>
        <td width="129">网点名称</td>
      </tr>
	  <%if(null!=branchlist){
		  for(int i=0;i<branchlist.size();i++){
			  Branch _branch = (Branch)branchlist.get(i);%>
			  <tr class="xuxian">
				<td><%=_branch.getBranchCode()%></td>
				<td><a href="${contextPath }/branchManagerAction.do?method=getBranchInfoById&id=<%=_branch.getId()%>"><%=_branch.getBranchName()%></a></td>
			  </tr>
	  <%
		  }
	  }%>
      <tr>
        <td colspan="2" align="right"><span class="red font_st"><a href="${contextPath }/branchManagerAdminAction.do?method=getMainBranchList&menu=mainywwd">[查看所有网点]</a></span></td>
        </tr>
    </table>
  </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>