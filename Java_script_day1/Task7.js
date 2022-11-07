let v=parseInt(prompt('vvedite skorost'));
let s=parseInt(prompt('vvedite rasstoyanie'));
// let c=parseInt(prompt('vvedite c'));
let t =s/v*60;
if(t<=135)
	alert("Yes, you can reach");
else 
	alert("No, you cant reach");