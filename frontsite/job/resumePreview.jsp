<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserWorkExperienceService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserItemService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserBasicInfoService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserBasicInfo"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserEduExperienceService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserEduExperience"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="java.util.Arrays"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserWorkExperience"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserItem"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserBearwardService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserPubpaperService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserFamilyService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserApplyItemService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserApplyItem"/>
<jsp:directive.page import="com.cssweb.hr.service.HrUserSubmitService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUserSubmit"/>
<jsp:directive.page import="com.cssweb.hr.service.ThrPostInfoService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.ThrPostInfo"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.service.LobService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrApplyRecorderService"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrApplyRecorder"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<%
	HrUser hrUser = (HrUser)request.getSession().getAttribute("hrUser");
	if(hrUser==null){
%>
	<script>
		alert("登陆超时,请重新登陆");
		window.location="${ctx }/job/index.jsp";
	</script>
<%
	}
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	HrUserBasicInfoService BasicInfoService = (HrUserBasicInfoService)ctx.getBean("hrUserBasicInfoService");
	HrUserBasicInfo basicInfo = null;
	if(hrUser!=null){
		basicInfo = BasicInfoService.getBeanById(hrUser.getId());
	}
	pageContext.setAttribute("basicInfo",basicInfo);
 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=null==basicInfo?"":(basicInfo.getUserName()+"的")%>个人简历</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
</head>
<%	
	HrUserEduExperienceService service = (HrUserEduExperienceService)ctx.getBean("hrUserEduExperienceService");
	HrUserEduExperience eduExp = new HrUserEduExperience();
	List list = new ArrayList();
	if(hrUser!=null){
		list = service.getAllEduList(hrUser.getId());
	}
	pageContext.setAttribute("list",list);
	
	
	HrUserWorkExperienceService workService = (HrUserWorkExperienceService)ctx.getBean("hrUserWorkExperienceService");
	HrUserItemService itemService = (HrUserItemService)ctx.getBean("hrUserItemService");
	
	HrUserWorkExperience workExp = new HrUserWorkExperience();
	HrUserItem userItem = new HrUserItem();
	
	List workExpList = new ArrayList();
	List itemList = new ArrayList();
	
	if(hrUser!=null){
		workExpList = workService.getAllWorkList(hrUser.getId());
		itemList = itemService.getAllItemList(hrUser.getId());
	}
	pageContext.setAttribute("workExpList",workExpList);
	pageContext.setAttribute("itemList",itemList);
	
	
	String iftj="";
	HrApplyRecorderService hrApplyRecorderService = (HrApplyRecorderService)ctx.getBean("hrApplyRecorderService");
	if(hrUser!=null){
		 HrApplyRecorder recorder= hrApplyRecorderService.getApplyRecorderByUserID(hrUser.getId());
		 if(recorder!=null)
		 {
		  if(recorder.getIfTj()==0)
		  iftj="不服从"+"调剂";
		  if(recorder.getIfTj()==1)
		  iftj="服从"+"调剂";
		 }
	}
	HrUserBearwardService bearwardService = (HrUserBearwardService)ctx.getBean("hrUserBearwardService");
	HrUserPubpaperService paperService = (HrUserPubpaperService)ctx.getBean("hrUserPubpaperService");
	HrUserFamilyService familyService = (HrUserFamilyService)ctx.getBean("hrUserFamilyService");
	HrUserApplyItemService applyItemService = (HrUserApplyItemService)ctx.getBean("hrUserApplyItemService");
	
	List bearwardlist = new ArrayList();
	List paperList = new ArrayList();
	List familyList = new ArrayList();
	HrUserApplyItem applyItem = null;
	if(hrUser!=null){
		bearwardlist = bearwardService.getAllBearwardList(hrUser.getId());
		paperList = paperService.getAllPubpaperList(hrUser.getId());
		familyList = familyService.getAllFamilyList(hrUser.getId());
		applyItem = applyItemService.getBeanById(hrUser.getId());
	}
	pageContext.setAttribute("bearwardlist",bearwardlist);
	pageContext.setAttribute("paperList",paperList);
	pageContext.setAttribute("familyList",familyList);
	pageContext.setAttribute("applyItem",applyItem);
	
	
	HrUserSubmitService subMitService = (HrUserSubmitService)ctx.getBean("hrUserSubmitService");
	HrUserSubmit userSubmit = new HrUserSubmit(); 
	if(hrUser!=null){
		userSubmit = subMitService.getBeanById(hrUser.getId());
	}
	pageContext.setAttribute("userSubmit",userSubmit);
	
	
	ThrPostInfoService thrPostInfoService = (ThrPostInfoService)ctx.getBean("thrPostInfoService");
	
	List<ThrPostInfo> postList =null;
	if(hrUser!=null){
		postList = thrPostInfoService.getPostByUserId2(hrUser.getId());
	}
	pageContext.setAttribute("postList",postList);
	
	LobService lobService=(LobService)ctx.getBean("lobService");
	
	if(null==basicInfo 
		&& (null==list || list.size()==0) 
		&& (null==workExpList || workExpList.size()==0) 
		&& (null==itemList || itemList.size()==0) 
		&& (null==bearwardlist || bearwardlist.size()==0)
		&& (null==paperList || paperList.size()==0)
		&& (null==familyList || familyList.size()==0)
		&& null==applyItem){
%>
	<script>
		alert("简历不完整，请先填写简历。");
		window.close();
	</script>
<%
	}
%>
<body class="ggjs_bg">
<div style="width:740px; background:#ffffff; height:100%; margin:0 auto">
	<div class="jobtcy_tt">
    	<p><a href="/default.jsp"><img src="/pic/job/tcy_logo.jpg" /></a></p>
    </div>
   <div class="p15">
  	<table width="98%" border="0" align="center" cellspacing="2" class="lh25 mt10">
  		<tr>
  			<td width="60%" align="right">
    			<p class="font14 bold">${basicInfo.userName }的个人简历〈编号：${basicInfo.userId }）</p>
    		</td>
    		<td align="left">
			    <c:choose>
			    	<c:when test="${basicInfo.picId gt 0 }"><img src="${contextPath}/share/showUploadImage.jsp?id=${basicInfo.picId }" width="85" height="115"/></c:when>
			    	<c:otherwise><img src="/pic/job/photo.jpg"  /></c:otherwise>
			    </c:choose>
    		</td>
    	</tr>
    </table>
  <table width="98%" border="0" align="center" class="lh25 mt10">
  <tr>
  	<td>
		<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
			<tr>
				<td class="font14 reseum_tt bold">个人基本信息</td>
			</tr>
		</table>
  	</td>
  </tr>
   <tr>
   <td>
  <table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  <tr class="bg_ff">
  		
  
    <td width="16%" class="bold">姓　　名</td>
    <td >${basicInfo.userName }</td>
    <td width="16%" class="bold">应聘类型</td>
    <td width="13%" class="bold">${basicInfo.inviteType}</td>
    <td width="16%" class="bold">性　　别</td>
    <td width="12%">${basicInfo.sex}</td>
  </tr>
  <tr class="bg_ff">
    <td class="bold">出生日期</td>
    <td>
    <c:if test="${!empty basicInfo.birthday}">
    	<bean:write name="basicInfo" property="birthday" format="yyyy-MM-dd"/>
    </c:if>
    
    </td>
    <td class="bold">民　　族</td>
    <td>${basicInfo.minzu}</td>
    <td class="bold">政治面貌</td>
    <td>${basicInfo.zzmm}</td>
  </tr>
  <tr class="bg_ff">
    <td class="bold">出&nbsp;&nbsp;生&nbsp;&nbsp;地</td>
    <td>${basicInfo.bornaddr}</td>
    <td class="bold">身高体重</td>
    <td>${basicInfo.stature}cm/${basicInfo.weight}kg</td>
    <td class="bold">身份证号</td>
    <td>${basicInfo.idcard}</td>
  </tr>
  <tr class="bg_ff">
    <td class="bold">婚姻状况</td>
    <td>${basicInfo.marrystate}</td>
    <td class="bold">工作年限</td>
    <td>${basicInfo.worktime}</td>
    <td class="bold">现所在地</td>
    <td>${basicInfo.nowaddr}</td>
  </tr>
  <tr class="bg_ff">
    <td class="bold">最高学位</td>
    <td>${basicInfo.highdegree}</td>
    <td class="bold">最高学历</td>
    <td>${basicInfo.highxl}</td>
    <td class="bold">月薪要求（元）</td>
    <td>${basicInfo.paywant}</td>
  </tr>
  <!-- 2011-09-26修改 -->
  <tr class="bg_ff">
    <td class="bold">本科毕业院校</td>
    <td>${basicInfo.undergraduateSchool}</td>
    <td class="bold">本科专业类别</td>
    <td>${basicInfo.undergraduateSjType}</td>
    <td class="bold">本科毕业时间</td>
    <td><fmt:formatDate value="${basicInfo.undergraduateTime}" type="date" pattern="yyyy-MM-dd"/></td>
  </tr>
  <!--  -->
  <!-- 2011-09-26增加 -->
  <tr class="bg_ff">
    <td class="bold">最高学历毕业院校</td>
    <td>${basicInfo.school}</td>
    <td class="bold">最高学历专业类别</td>
    <td>${basicInfo.specialtype}</td>
    <td class="bold">最高学历毕业时间</td>
    <td>${basicInfo.graduateyear}年${basicInfo.graduatemonth}月</td>
  </tr>
  <!--  -->
  <tr class="bg_ff">
    <td class="bold">可实习时间</td>
    <td>${basicInfo.practisetime}</td>
    <td class="bold">可工作时间</td>
    <td>${basicInfo.jointime}</td>
    <td class="bold">现工作单位</td>
    <td>${basicInfo.nowcompany}</td>
  </tr>
  <tr class="bg_ff">
    <td class="bold">应聘的岗位</td>
    <td colspan="5" style="line-height:20px">
     <c:forEach items="${postList }" var="bean">
     <strong>${bean.wish }、</strong>
    <strong>${bean.type }-${bean.branchName }-${bean.postName }</strong>
    <strong>(${bean.category })</strong>&nbsp;&nbsp;
    </c:forEach>
     &nbsp;<%=iftj %>
    </td>
    </tr>
  <tr class="bg_ff">
    <td class="bold">户口所在地</td>
    <td colspan="5">${basicInfo.hukouaddr}</td>
    </tr>
  <tr class="bg_ff">
    <td class="bold">档案所在地</td>
    <td colspan="5">${basicInfo.docuaddr}</td>
    </tr>
  <tr class="bg_ff">
    <td class="bold">希望工作地</td>
    <td colspan="5">${basicInfo.hopeworkaddr}
    &nbsp;&nbsp;&nbsp;
    <c:if test="${basicInfo.ifworkaddr eq '是' }">服从调剂</c:if>
    <c:if test="${basicInfo.ifworkaddr eq '否' }">不服从调剂</c:if>
    </td>
    </tr>
    </table>
    </td>
    </tr>
      <tr>
      	<td>
      		<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  					<tr>
  							<td class="font14 reseum_tt bold">个人联系信息</td>
  					</tr>
  			</table>
      	</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
      <tr class="bg_ff">
      
		   
        <td width="12%" class="bold">移动电话</td>
        <td width="18%">${basicInfo.mobil}</td>
        <td width="12%" class="bold">紧急联系电话</td>
        <td width="18%">${basicInfo.urgentphone}</td>
        <td width="12%" class="bold">电子邮箱</td>
        <td width="28%"><%=hrUser.getRegName()%></td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">现通讯地址</td>
        <td colspan="3">${basicInfo.curentaddr}</td>
        <td class="bold">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编</td>
        <td>${basicInfo.post}</td>
      </tr>
    </table>
    </td>
    </tr>
      <tr>
      	<td>
      		<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  					<tr>
  							<td class="font14 reseum_tt bold">资格证书及专业水平</td>
  					</tr>
  			</table>
      	</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
      <tr class="bg_ff">
        <td width="27%" class="bold">英语水平证书</td>
        <td>${basicInfo.engletter}<span <c:if test="${basicInfo.englettercount eq null }">style='display:none'</c:if>>--${basicInfo.englettercount }分</span> ${basicInfo.otherengletter }</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">计算机水平证书</td>
        <td>${basicInfo.computerletter }</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">是否通过国家司法考试</td>
        <td> 
        <c:if test="${basicInfo.gjsfks eq '1' }">是</c:if>
        <c:if test="${basicInfo.gjsfks eq '0' }">否</c:if>
        </td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">是否通过保荐代表人考试</td>
        <td> 
        <c:if test="${basicInfo.isInsuranceAgents eq '1' }">是</c:if>
        <c:if test="${basicInfo.isInsuranceAgents eq '0' }">否</c:if>
        </td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">注册会计师考试通过情况</td>
        <td>
        <%
        
      //因为basicInfo.getZckjs()获取的字符串已经很长，所以有很多重复的字符，需要将其变为数组来处理
      	String [] zckjss=null;
      	List zckjsList=null;
    	  if(basicInfo!=null&&basicInfo.getZckjs()!=null){
    		  zckjss=basicInfo.getZckjs().split(",");
    		  zckjsList=Arrays.asList(zckjss);
    	  }
        //if(zckjsList!=null && zckjsList.indexOf("11")!=-1){out.println("通过部分科目考试 ");}
        if(zckjsList!=null && zckjsList.indexOf("1")!=-1){out.println("会计 ");}
        if(zckjsList!=null && zckjsList.indexOf("2")!=-1){out.println("审计 ");}
        if(zckjsList!=null && zckjsList.indexOf("3")!=-1){out.println("财务成本管理 ");}
        if(zckjsList!=null && zckjsList.indexOf("4")!=-1){out.println("经济法 ");}
        if(zckjsList!=null && zckjsList.indexOf("5")!=-1){out.println("税法 ");}
        if(zckjsList!=null && zckjsList.indexOf("6")!=-1){out.println("公司战略与风险管理 ");}
        if(zckjsList!=null && zckjsList.indexOf("7")!=-1){out.println("公司战略与风险管理 ");}
        if(zckjsList!=null && zckjsList.indexOf("8")!=-1){out.println("注册会计师执业会员 ");}
        if(zckjsList!=null && zckjsList.indexOf("9")!=-1){out.println("注册会计师非执业会员 ");}
        if(zckjsList!=null && zckjsList.indexOf("10")!=-1){out.println("未通过任何科目考试 ");}
        
        
        %>
        
        
        </td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">证券从业资格考试通过情况</td>
        <td>
			<%
			if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("1")){out.println("证券市场基础知识 ");}
			if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("2")){out.println("证券投资基金 ");}
			if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("3")){out.println("证券发行与承销 ");}
			if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("4")){out.println("证券交易 ");}
			if(basicInfo!=null && basicInfo.getZqcyzgks()!=null && basicInfo.getZqcyzgks().contains("5")){out.println("证券投资分析 ");}
			%>
		</td>
      </tr>
      <tr class="bg_ff">
        <td style="line-height:15px" class="bold">是否具有证券投资咨询执业资格</td>
        <td> 
        <c:if test="${basicInfo.tzzxzg eq '1' }">是</c:if>
        <c:if test="${basicInfo.tzzxzg eq '0' }">否</c:if>
        &nbsp;&nbsp;&nbsp;&nbsp;<span class="bold" <c:if test="${basicInfo.tzzxzg eq '0' }">style='display:none'</c:if>>执业证书编号：${basicInfo.tzzxzgno }</span>
        </td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">专业技术职称</td>
        <td>${basicInfo.haveposition }</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">其他技能/资格证书</td>
        <td>${basicInfo.otherposition }</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">专业特长描述</td>
        <td style="line-height:20px">${basicInfo.strongskill }</td>
      </tr>
      <tr class="bg_ff">
        <td valign="top"  class="bold">所学课程及成绩描述</td>
        <td style="line-height:20px">${basicInfo.course }</td>
      </tr>
    </table>
    </td>
    </tr>
      <tr>
      	<td>
      			<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  					<tr>
  							<td class="font14 reseum_tt bold">教育经历</td>
  					</tr>
  				</table>
      	</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
		<tr class="textcenter bold bg_ff">
			<!-- <td width="19%" class="bold">时间</td> -->
		    <td width="19%" class="bold">时间</td>
		    <td width="25%" class="bold">学校/专业名称（研究方向）</td>
		    <td width="19%" class="bold">学习方式/学历/学位</td>
		    <td width="12%" class="bold">班级排名</td>
		    <td width="25%" class="bold">证明人信息</td>
		  </tr>
      
      <c:forEach items="${list }" var="bean">
		<tr class="bg_ff textcenter">
		    <td width="19%">【${bean.startDateYear }/${bean.startDateMonth }-${bean.endDateYear }/${bean.endDateMonth }】</td>
		    <td width="25%">${bean.school }/${bean.spename }（${bean.searchpos }）</td>
		    <td width="19%">${bean.studystyle }/${bean.xueli }/${bean.degree }</td>
		    <td width="12%">${bean.classorder }</td>
		    <td width="25%">${bean.prover }/${bean.prorelation }/${bean.proverphone }</td>
		  </tr>
	</c:forEach>
      
    </table>
    </td>
    </tr>
      <tr>
      	<td>
      			<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  					<tr>
  							<td class="font14 reseum_tt bold">工作/实习经验</td>
  					</tr>
  				</table>
      	</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
      
      <c:forEach items="${workExpList }" var="bean">
			<tr class="bold bg_ff">
		        <td colspan="2">【${bean.startDateYear }/${bean.startDateMonth }-${bean.endDateYear }/${bean.endDateMonth }】</td>
		        <td colspan="2">${bean.companyName }/${bean.companyScope }</td>
		        <td colspan="2" >工作形式：${bean.workStyle }</td>
		      </tr>
		      <tr class="bg_ff">
		        <td width="10%" class="bold">所在部门</td>
		        <td width="24%">${bean.workDept }</td>
		        <td width="10%" class="bold">工作岗位</td>
		        <td width="31%">${bean.workPosition }</td>
		        <td width="14%" class="bold">职位月薪 (税前)</td>
		        <td width="11%">${bean.laborage }</td>
		      </tr>
		      <tr class="bg_ff" <c:if test="${bean.mainResult eq null }">style='display:none'</c:if>>
		        <td class="bold">汇报对象</td>
		        <td>${bean.reportto }</td>
		        <td class="bold">下属人数</td>
		        <td colspan="3">${bean.underling }人</td>
		      </tr>
		      <tr class="bg_ff">
		        <td class="bold">证明人信息</td>
		        <td colspan="5">${bean.prover }/${bean.prorelation }/${bean.proverphone }</td>
		      </tr>
		      <tr class="bg_ff">
		        <td class="bold">工作职责</td>
		        <td colspan="5" style="line-height:20px">${bean.workResponse }</td>
		      </tr>
		      <tr class="bg_ff" <c:if test="${bean.mainResult eq null }">style='display:none'</c:if>>
		        <td class="bold">主要业绩</td>
		        <td colspan="5" style="line-height:20px">${bean.mainResult }</td>
		      </tr>
		      <tr class="bg_ff">
		        <td class="bold">离职原因</td>
		        <td colspan="5" style="line-height:20px">${bean.lzyy }</td>
		      </tr>
	</c:forEach>
    </table>
    </td>
    </tr>
      <tr>
      	<td>
      			<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  					<tr>
  							<td class="font14 reseum_tt bold">项目/活动经验</td>
  					</tr>
  				</table>
      	</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
      <c:forEach items="${itemList }" var="itemBean">
      	<tr class="bold bg_ff">
	        <td colspan="2">【${itemBean.startDateYear }/${itemBean.startDateMonth }-${itemBean.endDateYear }/${itemBean.endDateMonth }】</td>
	        <td colspan="2" >${itemBean.itemName }</td>
	        <td colspan="2" width="25%" ><b>担任角色：</b>${itemBean.roleName }</td>
	       
	      </tr>
	      <tr class="bg_ff">
	        <td width="12%" class="bold">项目发起单位</td>
	        <td width="22%">${itemBean.itemOrg }</td>
	        <td width="10%" class="bold">证明人信息</td>
	        <td colspan="3">${itemBean.prover }/${itemBean.prorelation }/${itemBean.proverphone }</td>
	       
	      </tr>
	      <tr class="bg_ff">
	        <td valign="top" class="bold">项目/活动简述</td>
	        <td colspan="5" style="line-height:20px"><p align="left">${itemBean.itemIntro }</p></td>
	      </tr>
		</c:forEach>
      
    </table>
    </td>
    </tr>
      <tr>
      		<td>
      				<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
	  					<tr>
	  							<td class="font14 reseum_tt bold">获奖情况</td>
	  					</tr>
	  				</table>
      		</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
    	
      <tr class="textcenter bold bg_ff">
        <td width="12%">获奖时间</td>
        <td width="38%">奖励名称</td>
        <td>奖励机构</td>
        <td  width="20%">奖励级别</td>
      </tr>
      
       <c:forEach items="${bearwardlist }" var="bean">
	      <tr class="textcenter bg_ff">
	        <td>【${bean.startTimeYear }-${bean.startTimeMonth }】</td>
	        <td>${bean.awardName }</td>
	        <td>${bean.awardOrg }</td>
	        <td>${bean.awardLever }</td>
	      </tr>
      </c:forEach>
    </table>
    </td>
    </tr>
      <tr>
      		<td>
      				<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
	  					<tr>
	  							<td class="font14 reseum_tt bold">发表论文著作情况</td>
	  					</tr>
	  				</table>
      		</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
    <tr class="textcenter bold bg_ff">
        <td width="12%">发表时间</td>
        <td width="38%">著作名称</td>
        <td >出版机构</td>
        <td width="20%">作者顺序</td>
      </tr>
      
       <c:forEach items="${paperList }" var="bean">
	      <tr class="textcenter bg_ff">
	        <td>【${bean.startTimeYear }-${bean.startTimeMonth }】</td>
	        <td>${bean.paperName }</td>
	        <td>${bean.publicationName }</td>
	        <td>${bean.anthorOrder }</td>
	      </tr>
      </c:forEach>
    </table>
    </td>
    </tr>
      <tr>
      	<td>
      			<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
	  					<tr>
	  							<td class="font14 reseum_tt bold">家庭情况</td>
	  					</tr>
	  			</table>
      	</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
     <tr class="textcenter bold bg_ff">
        <td width="12%">与本人关系</td>
        <td width="12%">姓名</td>
        <td >工作单位/职务</td>
        <td width="20%">联系电话</td>
      </tr>
      
       <c:forEach items="${familyList }" var="bean">
	      <tr class="textcenter bg_ff">
	        <td>${bean.relationship }</td>
	        <td>${bean.name }</td>
	        <td>
	        	<c:choose>
	        			<c:when test="${bean.jobUnit != null || bean.position != null}">
	        					${bean.jobUnit }/${bean.position }
	        			</c:when>
	        			<c:otherwise>
	        					&nbsp;
	        			</c:otherwise>
	        	</c:choose>
	        </td>
	        <td>${bean.contactMode }</td>
	      </tr>
      </c:forEach>
    </table>
    </td>
    </tr>
      <tr>
      		<td>
      				<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
	  					<tr>
	  							<td class="font14 reseum_tt bold">个人申报事项</td>
	  					</tr>
	  				</table>
      		</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
    	
      <tr class="bg_ff">
        <td width="46%" class="bold">有无刑事处罚记录</td>
        <td width="4%"><c:choose><c:when test="${applyItem.xscf eq '1' }">有</c:when><c:when test="${applyItem.xscf eq '0' }">无</c:when></c:choose></td>
        <td  class="bold">有无被证券市场禁入记录</td>
        <td width="20%"><c:choose><c:when test="${applyItem.zqscjr eq '1' }">有</c:when><c:when test="${applyItem.xscf eq '0' }">无</c:when></c:choose></td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">有无参加“法轮功”等邪教组织</td>
        <td><c:choose><c:when test="${applyItem.cjflg eq '1' }">有</c:when><c:when test="${applyItem.cjflg eq '0' }">无</c:when></c:choose></td>
        <td class="bold">有无违反国家计划生育政策</td>
        <td><c:choose><c:when test="${applyItem.wfgjjhsy eq '1' }">有</c:when><c:when test="${applyItem.wfgjjhsy eq '0' }">无</c:when></c:choose></td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">有无因违法或违纪行为被证券相关机构开除的记录</td>
        <td><c:choose><c:when test="${applyItem.zqsckc eq '1' }">有</c:when><c:when test="${applyItem.zqsckc eq '0' }">无</c:when></c:choose></td>
        <td class="bold">本人是否具有股票投资帐户</td>
        <td><c:choose><c:when test="${applyItem.gptzzh eq '1' }">有</c:when><c:when test="${applyItem.gptzzh eq '0' }">无</c:when></c:choose> ${applyItem.gdkh}</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">若离开原单位是否涉及未了手续或经济补偿</td>
        <td><c:choose><c:when test="${applyItem.sjsxjjbc eq '1' }">有</c:when><c:when test="${applyItem.sjsxjjbc eq '0' }">无</c:when></c:choose></td>
        <td class="bold">目前是否与企业/单位存在劳动关系</td>
        <td><c:choose><c:when test="${applyItem.czldgx eq '1' }">是</c:when><c:when test="${applyItem.czldgx eq '0' }">否</c:when></c:choose></td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">可否在入司后立即将档案转入</td>
        <td colspan="3"><c:choose><c:when test="${applyItem.jdazr eq '1' }">是</c:when><c:when test="${applyItem.jdazr eq '0' }">否</c:when></c:choose> ${applyItem.reason}</td>
      </tr>
    </table>
    </td>
    </tr>
      <tr>
   			<td>
     			<table width="100%" border="1" align="center" cellspacing="0" cellPadding="0" bordercolor="#cccccc">
  					<tr>
  						<td class="font14 reseum_tt bold">其他信息</td>
  					</tr>
  				</table>
     		</td>
      </tr>
   <tr>
   <td>
    <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#cccccc">
      <tr class="bg_ff">
        <td width="14%" class="bold">业余爱好描述</td>
        <td colspan="2">${applyItem.avocation}</td>
      </tr>
      <tr class="bg_ff">
        <td rowspan="2" valign="top" class="bold">本人性格特点</td>
        <td colspan="2">优势：${applyItem.advantage}</td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2">劣势：${applyItem.feebleness}</td>
      </tr>
      <tr class="bg_ff">
        <td style="line-height:15px" class="bold">请说明申请广发证券实习或工作的目的和理由</td>
        <td colspan="2" style="word-break:break-all,line-height:15px;">
          ${applyItem.workreason}</td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2" class="bold">您与广发证券的员工是否有亲属关系</td>
        <td width="64%"><c:choose><c:when test="${applyItem.jyqsgx eq '1' }">有</c:when><c:when test="${applyItem.jyqsgx eq '0' }">无</c:when></c:choose> ${applyItem.aboutqs}</td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2" class="bold">您从哪个渠道了解到广发证券的此次招聘？</td>
        <td >${applyItem.channel}</td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2" class="bold">其他情况说明</td>
        <td>${applyItem.otherthing}</td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2" class="bold">简历附件</td>
        <td ><%
        String fileName="";
        if(applyItem!=null && applyItem.getBlogId()>0){
        	fileName = lobService.getFileNameById(applyItem.getBlogId());
         %>
         <a href="${contextPath }/commons/showDocumentFile.jsp?id=<%=applyItem.getBlogId()%>"><%=fileName %></a>
		 <%}%>
         </td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2" class="bold">论文代表作</td>
        <td ><%
        String paperName="";
        if(applyItem!=null && applyItem.getPaperId()>0){
        	paperName = lobService.getFileNameById(applyItem.getPaperId());
         %>
         <a href="${contextPath }/commons/showDocumentFile.jsp?id=<%=applyItem.getPaperId()%>"><%=paperName %></a>
		 <%}%>
         </td>
      </tr>
      <!-- tr>
        <td colspan="2">个性倾向测评：</td>
        <td width="67%">有</td>
      </tr-->
      <tr class="bg_ff">
        <td rowspan="2" valign="top" class="bold">特别说明</td>
        <td colspan="2">是否同意我司对此简历中所提供的信息在认为必要时进行核实:<c:choose><c:when test="${userSubmit.ifcheck eq '1' }">是</c:when><c:when test="${userSubmit.ifcheck eq '0' }">否 ${userSubmit.notCheckReason }</c:when></c:choose></td>
      </tr>
      <tr class="bg_ff">
        <td colspan="2">是否同意我司在必要时对您的档案进行调阅:<c:choose><c:when test="${userSubmit.ifreadDocument eq '1' }">是</c:when><c:when test="${userSubmit.ifreadDocument eq '0' }">否 ${userSubmit.notReadReason }</c:when></c:choose></td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">承　诺</td>
        <td colspan="2">我承诺所填写的内容完全属实，若有虚假或有应填而未填事项的，本人愿承担相应责任。</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">承诺人</td>
        <td colspan="2">${userSubmit.name }</td>
      </tr>
      <tr class="bg_ff">
        <td class="bold">日　期</td>
        <td colspan="2">${userSubmit.promisesTime }</td>
      </tr>
    </table>
    
    </td>
    </tr>
    </table>
    
    <div align="center" class="mt10">
      <input name="input" type="button" class="but02 blue" value="关闭此页" onclick="javascript:window.opener=null;window.close();" />
      <input type="button" class="but02 blue"  value="打印简历"  onclick="window.print()"/>
      <object id="WebBrowser" width=0 height=0 classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2">
		</object>
      <input name="input" type="button" class="but02 blue" value="保存简历" onclick="javascript:window.document.all.WebBrowser.ExecWB(4,1);" />
    </div>
  </div>
</body>
</html>