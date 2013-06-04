<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage=""%>
<link type="text/css" rel="stylesheet" href="${ctx }/match/nxsy/mncg/skin/default/css/global.css"/>
<link type="text/css" rel="stylesheet" href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"/>
<!-- Add Hot Key Event by xuhz -->
<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/hotkey.js"></script>
<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/jquery.function.js"></script>
<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/jquery.contextmenu.r2.js"></script>

<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/fresh.js"></script>

<script language="javascript">
	var JQ = jQuery.noConflict();
</script>
<link type="text/css" rel="stylesheet" href="${ctx }/match/nxsy/mncg/skin/default/css/top.css" />
<link type="text/css" rel="stylesheet" href="${ctx }/match/nxsy/mncg/skin/default/css/left.css"/>

<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/menu.js"></script>
<script type="text/javascript" src="${ctx }/match/nxsy/mncg/js/jquery.treeview.js"></script>
<!--  <style type="text/css">
#head .topLeft{
	background:url(mncg/skin/logo/gfzq/banner01.jpg);
	width:210px;
	height:78px;
	float:left;
}

</style> -->

<script language="javascript">
// 记录最后一次点击的菜单ID
var latestPointMenu = null;
</script>

<script language="javascript">
JQ(document).ready( function(){
	loaddate();
    JQ("#arrowTd").toggle(
        function(){
            JQ("#menuTD").hide();
            JQ('#arrowImg').attr('src','${ctx }/match/nxsy/mncg/skin/default/pic/arrow_right.gif');
        },
        function(){
            JQ("#menuTD").show();
            JQ('#arrowImg').attr('src','${ctx }/match/nxsy/mncg/skin/default/pic/arrow_left.gif');
        }
    );
    frmOnload();

    JQ(".menu ul").treeview({
        animated: "fast",
        collapsed: true,
        unique: true,
        toggle: function() {
            window.console && console.log("%o was toggled", this);
        }
    });

    JQ(".menu_title a").click( function(){
        var id = JQ(this).attr("id");
        JQ("#activTab").val(id);
        JQ(".menu").hide();
        JQ("#"+ id +"Box").show();
        JQ(".menu_title > ul > li").removeClass("gp");
        JQ(".menu_title > ul > li").removeClass("jj");
        JQ(".menu_title > ul > li").removeClass("xy");
        JQ(".menu_title > ul > li").removeClass("menu_title_l").addClass("menu_title_l_down");
        JQ(this).parent().removeClass("menu_title_l_down").addClass("menu_title_l").addClass(id);

        //clickTopMenu(id);
    });

    JQ(".menu a").click( function(){
        setDefault(this.id);
        clickLeftMenu(this.id);
        latestPointMenu = this.id;
    });

    defaultMenu = "gp_search_zqzc";

    clickDefaultMenu();
});

//*****************菜单滚动条
JQ(window).resize( function(){
    frmOnload();
});
function frmOnload(){
    var winH = JQ(window).height();
    var topH = JQ("#head").outerHeight() + JQ("#topmenu").outerHeight();
    var custH = JQ(".alltitle").outerHeight();
    var h = winH-topH-JQ("#menuTitle").outerHeight();
    var spos = JQ("#pos").val();
    spos = (!spos) ? 0 : spos;
    var actTab = JQ("#activTab").val();
    JQ(".menu").height(h);
    JQ("#"+actTab+"Box").scrollTop(spos);
    JQ("#arrowTd").height(winH-topH);
    JQ("#mainFrame").height(winH-topH-custH);
}
function scrollDiv(){
    var actTab = JQ("#activTab").val();
    var spos = JQ("#"+actTab+"Box").scrollTop();
    JQ("#pos").val(spos);
}

//*****************菜单单击事件
function changeMainFrameSrc(_src){
    if(_src == "logout")
	{
		logout();
	}
	else
	{
		_src = _src.replace("#ctx","/mncg");
		if(_src != null && _src !="" && _src !="null"){
			document.getElementById("mainFrame").src = _src;
		}
	}
}
function showLeftMenu(mid){
    showMenu(mid);
}
function changeLeftMenu(mid){
    clickMenu(mid);
}
function changeTopMenu(mid){
//  var topFrameWin = $("topFrame").contentWindow;
//  topFrameWin.setDefault(mid);
}


window.onbeforeunload = function()
{
	if( event.clientX>document.body.clientWidth && event.clientY<0 || event.altKey )
    {
        //alert("确定要退出本页吗?");
        logout();
    }
}

function logout(){
	top.location = "/nxsyLoginAction.do?method=logout";
}

var zs_date = "";
var days = "";
//用于获取温馨提示信息
function loaddate() {
	var urlEt = "${contextPath}/nxsy/web/NxsyQueryMaAction.go?function=GetZs_msg";
	JQ.ajax({
		type : "post",
		url : urlEt,
		success : function(msg) {
			//alert(typeof(msg));
			//alert(msg.length);
			//alert(msg);
			if(msg.length==6){
				msg = "";
			}
			JQ("#showtips").html(msg);
		},
		error : function(msg) {
			//alert('数据加载出错！');
		}
	});
}

</script>

</head>
<title>广发证券牛熊宝模拟交易</title>
<body >

<div id="head">
	<div onclick="top.location='${ctx }/match/nxsy/index.jsp';" style="cursor: pointer;">
	<div class="topLeft2" style="position:absolute; z-index:1000;"></div>
	</div>
	<div id="mdiv" name="mdiv" class="topRight" style="position:absolute; z-index:999;background:url(../pic/banner04.jpg) right;">
	</div>
	<div style="width:100%;position:absolute; z-index:1001; " align="right">
	<div id="showtips"  style="margin-right:300px; margin-top:50px; width: 350px;color:red;font-size: 20px;font-weight: bold;">
	</div>
	</div>
	<div align="right" style=" width:100%; position:absolute; z-index:1002;margin-top:55px;text-align: right;">
		<a href="${contextPath}/nxsy/web/NxsyMicroCommentAction.go?function=FrontShowItems"  target="_blank">【微点评】</a>
		 <a href="${ctx }/match/nxsy/MatchIntroduce.pdf" target="_blank">【大赛介绍】</a>
		 <a href="${ctx }/match/nxsy/SystemUse.pdf" target="_blank">【使用说明】</a>
		 <a href="${ctx }/match/nxsy/login.jsp">【登录】&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</div>
</div>
<div id="topmenu" class="topmenu"></div>