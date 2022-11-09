users = [];

while(true){
    let index=prompt(`INSERT [1] TO ADD STUDENT
INSERT [2] TO TO LIST STUDENT
INSERT [5] TO EXIT`);
    switch(index){
        case "1": 
            student =[];
            student.name=prompt("INSERT NAME:");
            student.surname=prompt("INSERT SURNAME:");
            student.gpa=prompt("INSERT GPA:");
            users.push(student);
            break;
        case "2": 
            for (let user of users){                
                    alert(`${user.name}---${user.surname}---${user.gpa}`)
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