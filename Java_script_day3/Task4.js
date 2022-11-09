let n=parseInt(prompt("vvedite n"));
let arr=[];
for(let i=0;i<n;i++){
arr.push(parseInt(prompt("vvedite element")));
}
let proizv=1;
for(let a of arr){
	if(a!=0){
		proizv=proizv*a;
	}
}
console.log(proizv);
// console.log(arr.reduce((a,b)=>a*b));
// for(let i=n-1;i>=0;i--){
// alert (arr[i]);
// }