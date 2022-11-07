let login=prompt('vvedite login');
let password=prompt('vvedite password');
// let s=parseInt(prompt('vvedite rasstoyanie'));
// let c=parseInt(prompt('vvedite c'));
login=login.toLowerCase();
if(login=="user"&&password=="qwerty")
	alert("Authentication completed");
else 
	alert("Invalid login or password");