var $b=function(id){return document.getElementById(id);}
var nn=1;
var key=0;
function change_img(){
	if(key==0){
		key=1;
	}else if(document.all){
		$b("toppic").filters[0].Apply();
		$b("toppic").filters[0].Play(duration=2);
	}
	$b("toppic").src=img[nn].src;
	$b("topurl").href=url[nn].src;
	for (var i=1;i<=counts;i++){
		$b("topxxjdjj"+i).className='axx';
	}
	$b("topxxjdjj"+nn).className='bxx';
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
document.write('<div style="width:'+widths+'px;height:'+heights+'px;overflow:hidden;text-overflow:clip;">');
document.write('<div><a id="topurl" target="_blank"><img id="toppic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widths+' height='+heights+' /></a></div>');
document.write('<div>');
for(var i=1;i<counts+1;i++){
	document.write('<a href="javascript:changeimg('+i+');" id="topxxjdjj'+i+'"></a>');
}
document.write('</div></div>');
change_img();
