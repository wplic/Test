<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.collect.pojo.TcsswebRyxx"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/golden/golden.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tab_cj{ border:1px solid #ece9d8;}
</style>
</head>
<body class="body_bg" onload="MM_preloadImages('/pic/golden/but_lczx2.jpg')">
<jsp:include page="/share/top.jsp?nav=grgf" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/branches/index.html">分支机构</a> &gt; 投资顾问人员信息查询结果</div>
  <p align="center"><img src="/pic/golden/banner.jpg" /></p>
  <div class="blank10"></div>
    <div class="blank10"></div>
  <div class="goldenp1">
 <%
 List list=null;
 if(request.getAttribute("list")!=null)
 {
  list=(List)request.getAttribute("list");
 }
 %>
<table cellspacing="0" border="1" class="tab_cj" cellpadding="0" width="100%">
		<%if(list!=null&&list.size()>0){ %>
  						  <tr>
						    <td class="xl64" align="center" width="59">姓名</td>
						    <td class="xl65" align="center" width="30">性别</td>
						    <td class="xl65" align="center" width="100">员工编号</td>
						    <td class="xl65" align="center" width="200">所在营业部名称</td>
						    <td align="center"  width="150">执业资格</td>
						    <td align="center">执业资格证书编号</td>
						    <td align="center" width="100">证书有效截止日期</td>
						    <td align="center" width="60">从业资格</td>
						  </tr>
						  <!--tr>
						  	<td align="center"><a href="mgrInfo.jsp"> 张三</a></td>
						  	<td align="center">女</td>
						  	<td align="center">无锡XX路证券营业部</td>
						  	<td align="center">证券投资咨询业务</td>
						  	<td align="center">S0260209080410</td>
						  	<td align="center">
						  		证券基础知识 <br/>
								证券交易 <br/>
								证券投资分析 <br/>
								证券投资基金 <br/>
								证券发行与承销 <br/>
								期货基础知识 <br/>
								期货法律法规 <br/>
						  	</td>
						  </tr-->
						  <%
						     for(int i=0;i<list.size();i++)
						     {
						       TcsswebRyxx tcsswebRyxx=(TcsswebRyxx)list.get(i);
						    %>
						   <tr>
						  	<td align="center">
						  <a href="#" onclick="javascript:window.open('${contextPath }/branches/zqtzzgInfo.jsp?zsbh=<%=tcsswebRyxx.getZsbh() %>','','width=492,height=215,resizable=no,scrollbars=no,menubar=no,location=no,status=yes');"> 
						  	<font color="blue">
						  	<%=tcsswebRyxx.getRyxm()!=null&&!tcsswebRyxx.getRyxm().equals("")?tcsswebRyxx.getRyxm():"" %>
						  	</font></a>
						  	</td>
						  	<td align="center">
						  	<%=tcsswebRyxx.getSex()!=null&&!tcsswebRyxx.getSex().equals("")?tcsswebRyxx.getSex():""%>
						  	</td>
						  	<td align="center">
						  	<%=tcsswebRyxx.getUserid()!=null&&!tcsswebRyxx.getUserid().equals("")?tcsswebRyxx.getUserid():""%>
						  	</td>
						  	<td align="center">
						  	<%=tcsswebRyxx .getDeptname()!=null&&!tcsswebRyxx .getDeptname().equals("")?tcsswebRyxx .getDeptname():"" %>
						  	</td>
						  	
						  	<td align="center">
						  	<%=tcsswebRyxx.getZyzg()!=null&&!tcsswebRyxx.getZyzg().equals("")?tcsswebRyxx.getZyzg():"" %>
						  	</td>
						  	<td align="center">
						  	<%=tcsswebRyxx.getZsbh()!=null&&!tcsswebRyxx.getZsbh().equals("")?tcsswebRyxx.getZsbh():"" %>
						  	</td>
						    <td align="center"> 
						    <%=tcsswebRyxx.getJzrq()!=null&&!tcsswebRyxx.getJzrq().equals("")?tcsswebRyxx.getJzrq():"" %>
						     </td>
						  	<td align="center">
						  		有
						  	</td>
						  </tr>
						       <%
						     }
						  }else{ 
						  %>
						  <tr>
						    <td  height="80" colspan="6" align="center">
						      <a href="${contextPath }/branches/zqtzzgInfoSearch.jsp?nav=grgf&nav1=mgrInfo"> 
						          没有找到您要查询的资料，请点击返回
						      </a>
						    </td>
						  </tr>
						  <%
						  }%>
</table>
<br />
<table cellspacing="0" border="2" class="tab_cj" cellpadding="0" width="100%">
  <tr>
    <td class="xl64" width="100%">
   <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">
     广发证券业务人员经纪业务营销活动规范
    </div>
    </td>
  </tr>
 
  <tr>
  		<td>
  		<div class="p10 lh22">
  		  <p>一、许可行为 <br />
  			广发证券金管家投资顾问业务，是指公司接受客户委托，按照约定，向客户提供涉及证券及证券相关产品的投资建议服务，辅助客户作出投资决策，并直接或者间接获取经济利益的经营活动。投资建议服务内容包括投资的品种选择、投资组合以及理财规划建议等。
  			 <br />
			</p></div>
			<div class="p10 lh22">
  		  <p>
			二、禁止行为 <br />
			1.	擅自接受客户委托理财的；未对客户进行风险揭示的；未以公司名义收取投资顾问费用的； <br /> 
			2.	未按投资顾问协议约定内容进行投资顾问业务服务；  <br />
			3.	为投资顾问人员利益相关方的利益损害客户利益的；  <br />
			4.	向客户做虚假陈述、误导客户投资决策，使客户遭受损失或投诉的；  <br />
			5.	向客户提供的投资建议缺乏合规、合理、合法依据和资讯来源，或利用上市公司内幕信息或公司非公开信息进行投资建议；  <br />
			6.	不按规定移交或妥善保管有关的投资顾问协议以及业务推广、服务留痕、回访记录、投诉处理、合规检查记录等资料，造成遗失和损毁的；  <br />
			7.	未经客户同意，泄露客户重要资料；  <br />
			8.	违反对外信息发布规则，或传播、散布虚假信息的；  <br />
			9.	违反公司有关资讯产品服务范围和使用限制规定的；  <br />
			10.	违反对外参与投资咨询活动管理要求，不经报批或报备而开展对外投资咨询活动的；  <br />
			11.	违反公司隔离墙规定， 利用公司其他部门限制信息进行投资咨询活动及股票推荐的；  <br />
			12.	公司认定的需要实施责任追究的其他违规行为。  <br />
		 </p>
		
		</div>
  		</td>
  </tr>
 
</table>
 
  </div>
    <div class="blank10"></div>

</div>
<script src="/js/imge.js"></script>
<jsp:include page="/share/bottom.jsp" />
</body>

</html>