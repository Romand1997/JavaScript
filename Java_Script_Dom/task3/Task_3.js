users = [
    {"card1":"1111", "card2":"1111", "card3":"1111", "card4":"1111", "name": "roma roma", "cvv": "123"},
    {"card1":"1111", "card2":"1111", "card3":"1111", "card4":"1111", "name": "roma vanya", "cvv": "123"},
    {"card1":"1111", "card2":"1111", "card3":"1111", "card4":"1111", "name": "roma1", "cvv": "123"},
    {"card1":"1111", "card2":"1111", "card3":"1111", "card4":"1111", "name": "roma2", "cvv": "123"},
    {"card1":"1111", "card2":"1111", "card3":"1111", "card4":"1111", "name": "roma3", "cvv": "123"}
];
let flag=false;
let cardFiled1=firstNumberCard;
let cardFiled2=secondNumberCard;
let cardFiled3=thirdNumberCard;
let cardFiled4=fourthNumberCard;
let nameFiled=nam;
let cvvFiled=cvv;
function logout(){			
	console.log(cardFiled1.value);
	console.log(cardFiled2.value);
	console.log(cardFiled3.value);
	console.log(cardFiled4.value);
	console.log(nameFiled.value);
	console.log(cvvFiled.value);
	for(var i=0;i<users.length;i++){
	if (cardFiled1.value==users[i]["card1"]&&
		cardFiled2.value==users[i]["card2"]&&
		cardFiled3.value==users[i]["card3"]&&
		cardFiled4.value==users[i]["card4"]&&
		nameFiled.value.toLowerCase()==users[i]["name"]&&
		cvvFiled.value==users[i]["cvv"]) {
		flag=true;
		break;
	}
} 
	if (flag) {
		document.body.innerHTML="<h1>You are authenticated</h1>"
	} else {
		document.body.innerHTML="<h1>Invalid authentication</h1>"
	};	
}
signIn.addEventListener('click', logout);