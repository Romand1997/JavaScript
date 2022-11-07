let first=parseInt(prompt('Choose your branch:\n1 - Science, 2 - Humanitarian subjects, 3 - Art, 4 - Sport:'));
if(first==1){
	first=parseInt(prompt('1 - Math, 2 - Physics:'));
	if (first==1) alert("You are Financier");
	else if (first==2) alert ("You are Engineer");
}else if(first==2){
	first=parseInt(prompt('1 - History, 2 - Foreign Languages'));
	if (first==1) alert("You are Historic or Diplomat");
	else if (first==2) alert ("You are Translator");
}else if(first==3){
	first=parseInt(prompt('1 - Drawing, 2 -Singing:'));
	if (first==1) alert("You are Painter or Architect");
	else if (first==2) alert ("You are Singer or Tamada");
}else if(first==3){
	first=parseInt(prompt('1 - Team, 2 - Individual:'));
	if (first==1) alert("You are footballer or Basketball player");
	else if (first==2) alert ("You are boxer or tennis player");
}