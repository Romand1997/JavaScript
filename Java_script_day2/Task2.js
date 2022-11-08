let n=parseInt(prompt("vvedite n"));
let arr=[];
for(let i=0;i<n;i++){
arr.push(parseInt(prompt("vvedite element")));
}
alert(Math.max.apply(null, arr));

// for(let i=n-1;i>=0;i--){
// alert (arr[i]);
// }