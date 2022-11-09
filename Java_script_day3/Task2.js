let arr=[];
while(true){
	let a=parseInt(prompt("vvedite element"));
	if(a==0){		
		break;
	}
	arr.push(a);	
}
// alert(arr.reduce((a,b) =>a*b));
// alert(arr.length);
alert((Math.pow((arr.reduce((a,b) =>a*b)),1/(arr.length))).toFixed(3));
