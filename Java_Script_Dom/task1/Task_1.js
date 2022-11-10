users = [
    {"login":"1", "password": "1"},
    {"login":"eldar", "password": "qqqqq"},
    {"login":"assylkhan", "password": "qweqwe"},
    {"login":"anel", "password": "asdasd"},
    {"login":"alibek", "password": "aaaaaa"}
];
let flag=false;
let logFiled = name;
let passwFiled = password;
function logout(){			
	console.log(logFiled.value);
	console.log(passwFiled.value);	
// 	for(var i=0;i<users.length;i++){
// 	if (logFiled.value.toLowerCase()==users[i]["login"]&&passwFiled.value==users[i]["password"]) {
// 		flag=true;
// 		break;
// 	}
// } 
// 	if (flag) {
// 		document.body.innerHTML="<h1>You are authenticated</h1>"
// 		// // let divElem = document.createElement('div');
// 		// let divElem2 = document.createElement('div'); // создаем div элемент
// 		// // divElem.className = "newDiv";
// 		// divElem2.className = "greenBorder";
// 		// divElem2.innerHTML="You are authenticated";		
// 		// document.body.append(divElem2)
// 	} else {
// 		login.className = "redBorder";
// 		password.className = "redBorder";
// 	};	
}
signIn.addEventListener('click', logout);








// let login=prompt("vvedite login");
// let password=prompt("vvedite login");
// // alert(login.toLowerCase());
// let flag=false;
// for(var i=0;i<users.length;i++){
// 	if (login.toLowerCase()==users[i]["login"]&&password==users[i]["password"]) {
// 		flag=true;
// 		break;
// 	}
// } 
// if (flag) {
// 	alert("Welcome, you are authenticated");
// } else alert("User not found");