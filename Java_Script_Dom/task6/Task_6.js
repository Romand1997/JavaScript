users = [
    {"email":"1111"},
    {"email":"1111"},
    {"email":"1111"},
    {"email":"1111"},
    {"email":"1111"}
];
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

emailInput.addEventListener('keyup', callOnFocusEmail);
passwordInput.addEventListener('keyup', callOnFocusPassword);
retypePasswordInput.addEventListener('keyup', callOnFocusRetypePassword);
//register.addEventListener('click', zaregestrirovat)