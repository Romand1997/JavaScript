let amount=parseInt(prompt('amount'));
if(amount%380==0){
	alert(`ONLY ${amount/380} USD`)
} else{
	alert(`${(amount/380).toFixed()} USD and ${(((amount/380)-((amount/380).toFixed()))*100).toFixed()} cents`)
}


