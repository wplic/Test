// JavaScript Document


document.writeln("<SCRIPT language=\"JavaScript\">");
document.writeln("");
document.writeln("jQuery(document).ready(function($){");
document.writeln("     $(window).scroll(function() {");
document.writeln("         var bodyTop = 0;");
document.writeln("         if (typeof window.pageYOffset != \'undefined\') {");
document.writeln("             bodyTop = window.pageYOffset");
document.writeln("         } else if (typeof document.compatMode != \'undefined\' && document.compatMode != \'BackCompat\') {");
document.writeln("             bodyTop = document.documentElement.scrollTop");
document.writeln("         } else if (typeof document.body != \'undefined\') {");
document.writeln("             bodyTop = document.body.scrollTop");
document.writeln("         }");
document.writeln("         $(\"#dcDiv\").css(\"top\",  bodyTop)");
document.writeln("		 ");
document.writeln("     });");
document.writeln(" });");
document.writeln(" ");
document.writeln("<\/script>");
document.writeln("");
document.writeln("<div id=\"dcDiv\">");
document.writeln("<div id=\"spt_dc\">");
document.writeln("    <div id=\"spt_x\"><a  href=\"javascript:void(0)\" onclick=\"$(\'#dcDiv\').fadeOut();$(\'#spt_x\').css(\'display\',\'none\');\" ><img src=\"\/london2012\/sportimg\/stp_dcX.png\" width=\"21\" height=\"21\" \/><\/a><\/div>");
document.writeln("    <div class=\"spt_dctitle\"><img src=\"\/london2012\/sportimg\/spt_title.gif\" width=\"152\" height=\"22\" \/><\/div>");
document.writeln("    ");
document.writeln("<script language=javascript>");
document.writeln("function fsubmit(obj){");
document.writeln("checkForm();");
document.writeln("}");
document.writeln("function freset(obj){");
document.writeln("obj.reset();");
document.writeln("}");
document.writeln("<\/script>");
document.writeln("    <form  action=\"http:\/\/www.gf.com.cn\/london.do?method=addLondon\" id=form1 name=form1 method=post > ");
document.writeln("  <table width=\"370\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"spt_dctd\">");
document.writeln("      <tr>");
document.writeln("        <td width=\"133\" height=\"36\" align=\"right\" class=\"spt_tf\">姓　　名：<\/td>");
document.writeln("        <td width=\"237\" height=\"36\"><input type=\"text\" name=\"custName\" id=\"custName\" class=\"spt_dcinput\"\/><\/td>");
document.writeln("      <\/tr>");
document.writeln("      <tr>");
document.writeln("        <td height=\"36\" align=\"right\" class=\"spt_tf\">手　　机：<\/td>");
document.writeln("        <td height=\"36\"><input type=\"text\" name=\"phone\" id=\"phone\" class=\"spt_dcinput\"\/><\/td>");
document.writeln("      <\/tr>");
document.writeln("      <tr>");
document.writeln("        <td height=\"36\" align=\"right\" class=\"spt_tf\">是否广发用户：<\/td>");
document.writeln("        <td height=\"36\"><input name=\"radio\" type=\"radio\" id=\"radio\" value=\"1\" checked=\"checked\" \/> ");
document.writeln("          是　　");
document.writeln("            <input type=\"radio\" name=\"radio\" id=\"radio\" value=\"0\" \/> 否<\/td>");
document.writeln("      <\/tr>");
document.writeln("      <tr>");
document.writeln("        <td height=\"60\">&nbsp;<\/td>");
document.writeln("        <td height=\"60\"><img src=\"\/london2012\/sportimg\/spt_dcsubmit.gif\" width=\"56\" height=\"26\" style=\"margin-right:34px;\" onclick=\"javascript:fsubmit(document.form1);\"  \/><img src=\"\/london2012\/sportimg\/spt_dcdeset.gif\" width=\"56\" height=\"26\"  onClick=\"javascript:freset(document.form1);return false;\" \/><\/td>");
document.writeln("      <\/tr>");
document.writeln("  <\/table>");
document.writeln("  <\/form> ");
document.writeln("<\/div>");
document.writeln("");
document.writeln("<\/div>");
document.writeln("")