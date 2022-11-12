users = [
];
if (localStorage.length!=0){
        toStorage()
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
        alert("registration completed")
        window.location.href = "twitter_2.html";
}

function toStorage() {
        for (user of JSON.parse(localStorage.kluth)){
                users.push(user)
        }
        localStorage.kluth=JSON.stringify(users)
}

register.addEventListener('click', sohranit)
