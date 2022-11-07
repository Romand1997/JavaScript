let amount=parseInt(prompt('amount'));
if(amount%60==0){
	alert(`ONLY ${amount/60} hours`)
} else{
	alert(`${(amount/60).toFixed()} hours and ${amount-((amount/60).toFixed())*60} minutes`)
}


