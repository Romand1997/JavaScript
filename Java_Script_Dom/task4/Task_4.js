users = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.png",
    "5.jpg",
    "6.jpg",
    "7.jpg",
    "8.png",
    "9.jpg",
];
let n=1
function back(){	
	n=n-1;	
	if (n==-1) {
		n=9;
	}
	// alert(users[n])
	switch(n){
		case 0: pic.src = "1.jpg";
		break;
		case 1: pic.src = "2.jpg";
		break;
		case 2: pic.src = "3.jpg";
		break;
		case 3: pic.src = "4.png";
		break;
		case 4: pic.src = "5.jpg";
		break;
		case 5: pic.src = "6.jpg";
		break;
		case 6: pic.src = "7.jpg";
		break;
		case 7: pic.src = "8.png";
		break;
		case 8: pic.src = "9.jpg";
		break;
	}
	
}
function next(){	
	n=n+1;	
	if (n==10) {
		n=0;
	}
	switch(n){
		case 0: pic.src = "1.jpg";
		break;
		case 1: pic.src = "2.jpg";
		break;
		case 2: pic.src = "3.jpg";
		break;
		case 3: pic.src = "4.png";
		break;
		case 4: pic.src = "5.jpg";
		break;
		case 5: pic.src = "6.jpg";
		break;
		case 6: pic.src = "7.jpg";
		break;
		case 7: pic.src = "8.png";
		break;
		case 8: pic.src = "9.jpg";
		break;
	}
		
}

nazad.addEventListener('click', back);
vpered.addEventListener('click', next);
