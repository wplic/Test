var $c=function(id){return document.getElementById(id);}
var nn=1;
var key=0;
function change_img(){
	if(key==0){
		key=1;
	}else if(document.all){
		$c("pic").filters[0].Apply();
		$c("pic").filters[0].Play(duration=2);
	}
	$c("pic").src=img[nn].src;
	$c("url").href=url[nn].src;
	$c("name").innerHTML=nam[nn];
	for (var i=1;i<=counts;i++){
		$c("xxjdjj"+i).className='axx';
	}
	$c("xxjdjj"+nn).className='bxx';
	nn++;
	if(nn>counts){
		nn=1;
	}
	tt=setTimeout('change_img()',4000);
}
function changeimg(n){
	nn=n;
	window.clearInterval(tt);
	change_img();
}
function openImg() {
    window.open("/join/ShowImage.jsp?src="+$c("pic").src);
} 
document.write('<style>');
document.write('.axx{padding:3px 7px;border-left:#cccccc 1px solid;}');
document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#000;}');
document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#000;}');
document.write('.bxx{padding:3px 7px;border-left:#cccccc 1px solid;}');
document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#FF0004;}');
document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#CC0000;}');
document.write('</style>');
document.write('<div style="width:'+widths+'px;height:'+(heights +5)+'px;overflow:hidden;text-overflow:clip;">');
document.write('<div><a id="url" onclick="openImg()" target="_blank"><img id="pic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widths+' height='+heights+' /></a></div>');
document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=100);background: #333;width:100%-2px;text-align:right;top:-16px;position:relative;margin:1px;height:18px;padding:0px;margin:0px;border:0px;">');
for(var i=1;i<counts+1;i++){
	document.write('<a href="javascript:changeimg('+i+');" id="xxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');
}
document.write('</div></div>');
document.write('<div id="name" class="font-bold" align="center">');
document.write('</div>');
change_img();
