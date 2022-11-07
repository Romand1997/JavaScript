let amount=parseInt(prompt('INSERT YOUR AMOUNT IN KZT:'));
let n=parseInt(prompt('1- CONVERT TO USD\n2 - CONVERT TO EUR\n3- CONVERT TO GBP'));

switch (n) {
	case 1: alert(`${(amount/380).toFixed(2)} USD`);
	break;
	case 2: alert(`${(amount/430).toFixed(2)} EUR`);
	break;
	case 3: alert(`${(amount/480).toFixed(2)} GBP`);
	break;
	default: alert ("Error");
	break;
}

// let c=parseInt(prompt('vvedite c'));
// let t =s/v*60;
// if(t<=135)
// 	alert("Yes, you can reach");
// else 
// 	alert("No, you cant reach");