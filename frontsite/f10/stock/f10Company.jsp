<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 公司基本资料</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="2" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name }（${stockCode }）基本资料</div> 
    <div class="blank5"></div>
    <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
      <tr>
        <th width="15%">股票代码</th>
        <td width="34%">${stockCode }</td>
        <th width="16%">邮编</th>
        <td width="35%">${company.postcode }</td>
      </tr>
      <tr>
        <th>公司名称(中) </th>
        <td>${company.companyName }</td>
        <th>E-MALL</th>
        <td>${company.email }</td>
      </tr>
      <tr>
        <th>公司名称(英)</th>
        <td>${company.companyEnglisName }</td>
        <th>主页地址</th>
        <td>${company.website }</td>
      </tr>
      <tr>
        <th>注册地址</th>
        <td>${company.registeredAddress }</td>
        <th>注册资本</th>
        <td><fmt:formatNumber value="${company.registeredCaptial }" pattern="#,#00.#"/>	</td>
      </tr>
      <tr>
        <th>办公地址</th>
        <td>${company.businessAddress }</td>
        <th>电话</th>
        <td>${company.phoneCode }</td>
      </tr>
      <tr>
        <th>行业分类 </th>
        <td>${company.industryCategory }</td>
        <th>传真</th>
        <td>${company.faxNumber }</td>
      </tr>
      <tr>
        <th>公司经营范围</th>
        <td colspan="3">${company.businessScope }</td>
       
      </tr>
      <tr>
        <th>法人代表 </th>
        <td>${company.legalPerson }</td>
        <th>注册资本(万元)</th>
        <td>${company.registeredCaptial } </td>
      </tr>
      <tr>
        <th>工商登记号码  </th>
        <td>${company.GSDJH }</td>
        <th>成立时间</th>
        <td>
        <c:set var="increaseIssueDate">
									<fmt:formatDate value="${company.foundationDate}"
										pattern="yyyy-MM-dd" />
								</c:set>
								<c:if test='${increaseIssueDate!="1900-01-01"}'>${increaseIssueDate}</c:if>
								&nbsp;
        </td>
      </tr>

      <tr>
        <th>所在地区</th>
        <td>${company.country }</td>
        <th>评估人员</th>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <th>公司简介</th>
        <td colspan="3">
        ${company.history }
        </td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>