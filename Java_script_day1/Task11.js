let year=parseInt(prompt('vvedite year'));
// let s=parseInt(prompt('vvedite rasstoyanie'));
// let c=parseInt(prompt('vvedite c'));

if(year%4==0&&year%100!=0||year==400)
	alert("Yes");
else 
	alert("No");