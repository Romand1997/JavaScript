users = [
    {"login":"roma", "password": "qwerty"},
    {"login":"eldar", "password": "qqqqq"},
    {"login":"assylkhan", "password": "qweqwe"},
    {"login":"anel", "password": "asdasd"},
    {"login":"alibek", "password": "aaaaaa"}
];
let login=prompt("vvedite login");
let password=prompt("vvedite login");
// alert(login.toLowerCase());
let flag=false;
for(var i=0;i<users.length;i++){
	if (login.toLowerCase()==users[i]["login"]&&password==users[i]["password"]) {
		flag=true;
		break;
	}
} 
if (flag) {
	alert("Welcome, you are authenticated");
} else alert("User not found");
