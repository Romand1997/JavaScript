users = [
    {"name":"Harry Potter and the Philosopher's Stone", "author": "joanne rowling", "article":"1233123", "price": "50$"},
   	{"name":"Harry Potter and the Chamber of Secrets", "author": "joanne rowling", "article":"222332", "price": "40$"},
    {"name":"Harry Potter 1", "author": "roma", "article":"452323", "price": "55$"},
    {"name":"Harry Potter 2", "author": "ivan", "article":"1233137", "price": "50$"},
    {"name":"Harry Potter 3", "author": "petya", "article":"1233138", "price": "50$"},
];
let author=prompt("vvedite author");
for(var i=0;i<users.length;i++){
	if (author.toLowerCase()==users[i]["author"]) {
		alert(`${users[i]["name"]} - ${users[i]["author"]} - ${users[i]["article"]} - ${users[i]["price"]}`);
	}
} 