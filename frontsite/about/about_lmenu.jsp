<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="/js/about_lmenu.js"></script>
<p><img src="/pic/about/gygf.jpg" /></p>
<%

String meun="gfkl";
if(request.getParameter("meun")!=null&&!request.getParameter("meun").equals(""))
 meun=request.getParameter("meun").trim();

String nav2="";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
 %>
<div class="sidemenu">
  		<table>
          <tr>
            <td <%=meun.equals("gfkl")?"class='active sideblue'":"class='link sideblue'" %> id="hor1" onclick="selectlMenu('hor1','board1')"><a href="#">广发概况</a></td>
          </tr>
          <tr>
            <td class="submenu" id="board1" <%=meun.equals("gfkl")?"":"style='display:none'" %>>
            	<ul>
                	<li><span class="font_a8">·</span><a href="${ctx }/about/aboutUs.jsp"><font <%=nav2.equals("gsjj")?"color='red'":"color='#000000'" %>>公司简介</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/organizational.html"><font <%=nav2.equals("zzgj")?"color='red'":"color='#000000'" %>>组织架构</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/overviewManager.html"><font <%=nav2.equals("gsgg")?"color='red'":"color='#000000'" %>>公司高管</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/brilliant.html"><font <%=nav2.equals("gygf_hhyj")?"color='red'":"color='#000000'" %>>辉煌业绩</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/companyXxpl.jsp"><font <%=nav2.equals("xxpl")?"color='red'":"color='#000000'" %>>信息披露</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/branches/yywdServices.html"><font <%=nav2.equals("xywd")?"color='red'":"color='#000000'" %>>营业网点</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/aboutDznc.jsp"><font <%=nav2.equals("dznc")?"color='red'":"color='#000000'" %>>电子年册</font></a></li>
                </ul>
            </td>
          </tr>
          <tr>
            <td <%=meun.equals("gygf_gsdt")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/about/companyNews.html">公司动态</a></td>
          </tr>
          <tr>
            <td <%=meun.equals("gygf_qywh")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/about/corporateCulture.html">企业文化</a></td>
          </tr>
          <tr>
            <td <%=meun.equals("gygf_gsdsj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/about/companyEvent.html">公司大事记</a></td>
          </tr>
          
          <tr>
            <td <%=meun.equals("cgbq")?"class='active sideblue'":"class='link sideblue'" %> id="hor2" onclick="selectlMenu('hor2','board2')"><a href="#">采购招标</a></td>
          </tr>
          <tr>
            <td class="submenu" id="board2" <%=meun.equals("cgbq")?"":"style='display:none'" %>>
            	<ul>
                	<li><span class="font_a8">·</span><a href="${ctx }/about/specificityProcureTsxcg.html"><font <%=nav2.equals("gygf_cgzp_tsxcg")?"color='red'":"color='#000000'" %>>特殊性采购</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/specificityProcureXmcg.html"><font <%=nav2.equals("gygf_cgzp_xmcg")?"color='red'":"color='#000000'" %>>项目采购</font></a></li>
                    <li><span class="font_a8">·</span><a href="${ctx }/about/specificityProcureRcxcg.html"><font <%=nav2.equals("gygf_cgzp_rcxcg")?"color='red'":"color='#000000'" %>>日常性采购</font></a></li>
                </ul>
            </td>
          </tr>
          <tr>
            <td <%=meun.equals("gygf_zthd")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/about/themeList.jsp?meun=gygf_zthd">专题活动</a></td>
          </tr>
        </table>

  </div>


