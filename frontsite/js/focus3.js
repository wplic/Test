var $bp=function(id){return document.getElementById(id);}
var nnp=1;
var keyp=0;
function change_imgp(){
	if(keyp==0){
		keyp=1;
	}else if(document.all){
		//$bp("ad_d_gpic").filters[0].Apply();
		//$bp("ad_d_gpic").filters[0].Play(duration=2);
	}
	$bp("ad_d_gpic").src=imgp[nnp].src;
	$bp("ad_d_gurl").href=urlp[nnp].src;
	for (var i=1;i<=countsp;i++){
		$bp("ad_d_gxxjdjj"+i).className='axx';
	}
	$bp("ad_d_gxxjdjj"+nnp).className='bxx';
	nnp++;
	if(nnp>countsp){
		nnp=1;
	}
	tt=setTimeout('change_imgp()',4000);
}
function changeimgp(n){
	nnp=n;
	window.clearInterval(tt);
	change_imgp();
}
document.write('<style>');
document.write('.axx{padding:3px 7px;border-left:#cccccc 1px solid;}');
document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#000;}');
document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#000;}');
document.write('.bxx{padding:3px 7px;border-left:#cccccc 1px solid;}');
document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#FF0004;}');
document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#CC0000;}');
document.write('</style>');
document.write('<div style="width:'+widthsp+'px;height:'+heightsp+'px;overflow:hidden;text-overflow:clip;">');
document.write('<div><a id="ad_d_gurl" target="_blank"><img id="ad_d_gpic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widthsp+' height='+heightsp+' /></a></div>');
document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=100);background: #333;width:100%-2px;text-align:right;top:-16px;position:relative;margin:1px;height:18px;padding:0px;margin:0px;border:0px;">');
for(var i=1;i<countsp+1;i++){
	document.write('<a href="javascript:changeimgp('+i+');" id="ad_d_gxxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');
}
document.write('</div></div>');
change_imgp();
