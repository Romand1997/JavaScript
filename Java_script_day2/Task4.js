let n=parseInt(prompt("vvedite n"));
let arr=[];
for(let i=0;i<n;i++){
arr.push(parseInt(prompt("vvedite element")));
}
for(let i=0;i<n;i++){
	console.log(arr[i]*arr[i]);
}
// for(let i=n-1;i>=0;i--){
// alert (arr[i]);
// }