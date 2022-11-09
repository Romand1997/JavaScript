let arr=[];
while(true){
	let a=parseInt(prompt("vvedite element"));
	if(a==0){		
		break;
	}
	arr.push(a);	
}
for(let a of arr){
	if (a>=0) {
		console.log(a);
	}
}