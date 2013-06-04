// JavaScript Document
$(function(){
	//about5.html	   
	$('.accBox h2.title').click(function(){
		$(this).parent().parent().toggleClass('color4');
		$(this).next('.desc').toggle();
	});
});