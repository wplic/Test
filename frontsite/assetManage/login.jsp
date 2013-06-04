<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<div class="rtit2">
<p class="mt5 ml10"><img src="${contextPath }/pic/assetManage/listico1.gif" class="mr5" align="absmiddle"  />用户登录</p>
</div>
 	 <div class="bg_ff ptb6 ribor3" style="background:#ffffff url(/pic/assetManage/loginbg.jpg) repeat-x bottom;" >
     <div class="blank10"></div>
 	   <table width="90%" align="center" class="fcenter lh24">
 	     <tr>
 	       <td width="31%">用户名：<br /></td>
 	       <td width="69%"><label>
 	         <input name="textfield" type="text" id="textfield" size="15" />
           </label></td>
         </tr>
 	     <tr>
 	       <td>密　码：</td>
 	       <td><input name="textfield3" type="text" id="textfield3" size="15" /></td>
         </tr>
       </table>
       <div class="blank5"></div>
	   <p align="center" class="mt10"><input type="button" value="登录" class="but01" /> <input type="button" value="注册"  class="but01"/></p>
	   <div class="blank10"></div>
</div>