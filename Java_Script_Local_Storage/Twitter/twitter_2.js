function voity() {
        let flag = false
        for (let user of JSON.parse(localStorage.kluth)){
                if (emailInput.value==user.email&&passwordInput.value==user.password){
                        flag=true
                        let person ={} 
                        person.email=user.email
                        person.password=user.password
                        person.fullName=user.fullName
                        person.country=user.country
                        person.birthdate=user.birthdate
                        localStorage.kluthPerson=JSON.stringify(person)
                        window.location.href = "twitter_3.html";                      
                }
        } 
        if (!flag) {
                alert("Insert correct login or password")
        }

}

function toStorage() {
        localStorage.kluth=JSON.stringify(users)
}

function sohranit() {
        let user ={} 
        user.email=emailInput.value
        user.password=passwordInput.value
        user.fullName=fullNameInput.value
        user.country=countryInput.value
        user.birthdate=birthdateInput.value
        users.push(user)
        localStorage.kluth=JSON.stringify(users)
        window.location.href = "twitter_2.html";
}
signIn.addEventListener('click', voity)
