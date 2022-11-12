 let users = [];
 // update()
 // function update(){
 //    JSON.parse(localStorage)    
 // }
function addIphone() {         
        let iphone = {"name":"Iphone 12pro - 1200 USD","character":"6gb RAM, Memory 128gb, double front back camera"}
        users.push(iphone)
        localStorage.kluch=JSON.stringify(users)
}
function addXiaomi() {         
        let xiaomi = {"name":"Xiaomi - 250 USD","character":"6gb RAM, Memory 128gb, 3 cameras is back"}
        users.push(xiaomi)
        localStorage.kluch=JSON.stringify(users)
}
function addAsus() {         
        let asus = {"name":"Asus - 1100 USD","character":"8gb RAM, Memory 256gb, 10cameras"}
        users.push(asus)
        localStorage.kluch=JSON.stringify(users)
}
function addSumsung() {         
        let sumsung = {"name":"Sumsung - 1250 USD","character":"32gb RAM, Memory 1024gb, ip67"}
        users.push(sumsung)
        localStorage.kluch=JSON.stringify(users)
}
        
        // let fruitsDiv = b.createElement('div');
        // fruitsDiv.id = 'fruits';
        // fruitsDiv.innerHTML = "dfsghjklhgfdsadfghj"
        // for(let f of fruitsArray){
        //         let div = document.createElement('div');
        //         div.innerHTML = '<p>' + f.name + ' - ' + f.kilo + 'kg </p>'
        //         div.className = "fruitDiv";
        //         fruitsDiv.append(div);
        // }
        // b.body.append(fruitsDiv);



iphoneAdd.addEventListener('click', addIphone)
xiaomiAdd.addEventListener('click', addXiaomi)
asusAdd.addEventListener('click', addAsus)
sumsungAdd.addEventListener('click',addSumsung)