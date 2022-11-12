pokazat()
function pokazat() { 
        nameOfUser.innerHTML="Welcome "+JSON.parse(localStorage.kluthPerson).fullName
	emailInput.innerHTML=JSON.parse(localStorage.kluthPerson).email
        fullNameInput.innerHTML=JSON.parse(localStorage.kluthPerson).fullName
        countryInput.innerHTML=JSON.parse(localStorage.kluthPerson).country
        birthdateInput.innerHTML=JSON.parse(localStorage.kluthPerson).birthdate
}

