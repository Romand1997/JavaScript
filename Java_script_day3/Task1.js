let n=parseInt(prompt("vvedite n"));
let arr=[];
for(let i=0;i<n;i++){
arr.push(parseInt(prompt("vvedite element")));
}
let m=parseInt(prompt("vvedite m"))

if (arr.indexOf(m)!=-1){
  alert(`YES ${arr.indexOf(m)}`);
} else alert("NO");
