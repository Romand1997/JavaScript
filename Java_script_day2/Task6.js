users = [
    {"name":"Harry Potter and the Philosopher's Stone", "author": "joanne rowling", "article":"1", "price": "50$"},
   	{"name":"Harry Potter and the Chamber of Secrets", "author": "joanne rowling", "article":"1", "price": "40$"},
    {"name":"Harry Potter 1", "author": "roma", "article":"1", "price": "55$"},
    {"name":"Harry Potter 2", "author": "ivan", "article":"1", "price": "50$"},
    {"name":"Harry Potter 3", "author": "petya", "article":"1", "price": "50$"},
];
let author=prompt("vvedite author");
for(var i=0;i<users.length;i++){
	if (author.toLowerCase()==users[i]["name"]||author.toLowerCase()==users[i]["author"]||author.toLowerCase()==users[i]["article"]||author.toLowerCase()==users[i]["price"]) {
		alert(`${users[i]["name"]} - ${users[i]["author"]} - ${users[i]["article"]} - ${users[i]["price"]}`);
	}

} 
