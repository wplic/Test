<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<script src="/js/about_lmenu.js"></script>
<p><img src="/pic/job/applmenu.jpg" /></p>
<bean:parameter name="nav" id="nav" value="myResume"/>
<bean:parameter name="nav1" id="nav1" value="basicinfo"/>
<div class="sidemenu">
  		<table>
          <tr>
            <td class="<%="apply".equals(nav)?"active":"link"%> sideblue" id="hor1"><a href="${ctx }/job/jobApp.jsp?nav=apply">申请职位</a>  
            </td>
          </tr>
          <tr>
            <td class="<%="myResume".equals(nav)?"active":"link"%> sideblue" id="hor2" onclick="selectlMenu('hor2','board2')"><a href="#">我的简历</a></td>
          </tr>
          <tr>
            <td class="submenu" id="board2" <%if(!"myResume".equals(nav)){ %> style="display:none"<%} %>>
            	<ul >
                	<li ><span class="font_a8"></span><a href="${ctx }/job/personInfo.jsp?nav=myResume">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="basicinfo".equals(nav1)?"class='red'":""%>>个人基本信息</span></a><span class="red">*</span></li>
                    <li><span class="font_a8"></span><a href="${ctx }/job/educationExp.jsp?nav=myResume">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="edu".equals(nav1)?"class='red'":""%>>教育经历</span></a><span class="red">*</span></li>
                    <li><span class="font_a8"></span><a href="${ctx }/job/workExp.jsp?nav=myResume">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="work".equals(nav1)?"class='red'":""%>>工作/实习/项目经验</span></a></li>
                    <li><span class="font_a8"></span><a href="${ctx }/job/otherExp.jsp?nav=myResume">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="other".equals(nav1)?"class='red'":""%>>其他个人情况说明</span></a><span class="red">*</span></li>
                    <li><span class="font_a8"></span><a href="${ctx }/job/submitResume.jsp?nav=myResume">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="sub".equals(nav1)?"class='red'":""%>>提交简历</span></a></li>
                </ul>
            </td>
           </tr>
          <tr>
            <td class="link sideblue"><a href="${ctx }/job/resumePreview.jsp" target="_blank">简历预览</a></td>
          </tr>
          <tr>
            <td class="link sideblue"><a href="/hrUserAction.do?method=hrUserLoginOut&action=sessionout">退出登录</a></td>
          </tr>
                  
        </table>

  </div>


