String.prototype.trim = function() {  
  var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);  
  return (m == null) ? "" : m[1];  
} 

function isNum(value){
	var numtype="0123456789";
	for(i=0;i<value.length;i++){
		if(numtype.indexOf(value.substring(i,i+1))<0)
			return false; 
	}
	return true;
} 