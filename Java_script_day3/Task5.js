cars = [
    {"name":"toyota", "price": 12000000, "year": 2015, "volume": 2.2},
    {"name":"mercedes", "price": 70000000, "year": 2018, "volume": 3.8},
    {"name":"toyota", "price": 7000000, "year": 2013, "volume": 2.0},
    {"name":"bmw", "price": 11000000, "year": 2011, "volume": 3.0},
    {"name":"lexus", "price": 60000000, "year": 2017 ,"volume": 5.7}
];
// var text = "";
// for(var i=0;i<cars.length;i++){
//  	text+=cars[i]["name"] + " - " + cars[i]["price"]+" - " + cars[i]["year"]+ " - " + cars[i]["volume"]+" liters\n";
// }
while(true){
	let index=prompt(`INSERT [1] TO SEARCH BY NAME
	INSERT [2] TO SEARCH BY YEAR
	INSERT [3] TO SEARCH BY ENGINE VOLUME
	INSERT [4] TO SEARCH BY PRICE
	INSERT [5] TO EXIT`);
	switch(index){
		case "1": 
			let nam=prompt("INSERT NAME OF CAR:");
			for (let car of cars){
				if (car.name.toLowerCase()==nam){
					alert(`${car.name}---${car.price} KZT---${car.year}---${car.volume} liters`)
				}
			}
			break;
		case "2": 
			let yearBegin=prompt("INSERT YEAR START FROM:");
			let yearEnd=prompt("INSERT YEAR ENDS FROM:");
			for (let car of cars){
				if (car.year>=yearBegin&&car.year<=yearEnd){
					alert(`${car.name}---${car.price} KZT---${car.year}---${car.volume} liters`)
				}
			}
			break;
		case "3": 
			let volumeBegin=parseInt(prompt("INSERT ENGINE VOLUME START FROM:"));
			let volumeEnd=parseInt(prompt("INSERT ENGINE VOLUME ENDS FROM:"));
			for (let car of cars){
				if (car.volume>=volumeBegin&&car.volume<=volumeEnd){
					alert(`${car.name}---${car.price} KZT---${car.year}---${car.volume} liters`)
				}
			}
			break;	
		case "4": 
			let priceBegin=parseInt(prompt("INSERT PRICE START FROM:"));
			let priceEnd=parseInt(prompt("INSERT PRICE ENDS FROM:"));
			for (let car of cars){
				if (car.price>=priceBegin&&car.price<=priceEnd){
					alert(`${car.name}---${car.price} KZT---${car.year}---${car.volume} liters`)
				}
			}
			break;
		case "5":
			break;
		default: alert("INSERT INCORRECT, TRY AGAIN");	
	}
	if (index=="5") {
		break;
	}
}

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
