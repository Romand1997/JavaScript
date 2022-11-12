users = [
    {"email":"1111"},
    {"email":"1111"},
    {"email":"1111"},
    {"email":"1111"},
    {"email":"1111"}
];
load()
function callOnFocusEmail() {
 	for (let email of users){
	 	if (emailInput.value==(email.email)) { // если значение НЕ содержит символ @
	        errorEmail.innerHTML = 'Please enter right email.'; // показываем сообщение о правильном вводе
      	} else {
	        errorEmail.innerHTML = '';
      	}
    }
}
function callOnFocusPassword() { 
 	if (passwordInput.value.length<6) { // если значение НЕ содержит символ @
        errorPassword.innerHTML = 'Please enter password bolee 6 simbols.'; // показываем сообщение о правильном вводе
  	} else {
        errorPassword.innerHTML = '';
  	}
}
function callOnFocusRetypePassword() { 
 	if (retypePasswordInput.value!=passwordInput.value) { // если значение НЕ содержит символ @
        errorRetypePassword.innerHTML = 'Please enter correct password '; // показываем сообщение о правильном вводе
  	} else {
        errorRetypePassword.innerHTML = '';
  	}
}
function zaregestrirovat() { 
	emailInput.value=''
	passwordInput.value=''
 	retypePasswordInput.value=''
}
function sohranit() { 
        localStorage.email=emailInput.value
        localStorage.password=passwordInput.value
        localStorage.country=countryInput.value
        localStorage.retypePassword=retypePasswordInput.value
}

function load() {
        emailInput.value=localStorage.email
        passwordInput.value=localStorage.password
        countryInput.value = localStorage.country
        retypePasswordInput.value=localStorage.retypePassword
}

// emailInput.addEventListener('keyup', callOnFocusEmail);
// passwordInput.addEventListener('keyup', callOnFocusPassword);
// retypePasswordInput.addEventListener('keyup', callOnFocusRetypePassword);
register.addEventListener('click', zaregestrirovat)
save.addEventListener('click', sohranit)