let n=0
let y=0
if (localStorage.length!=0){
addIphone()
}
function addIphone() {
        bigDiv.remove(); 
        n=0
        let phonesDiv = document.createElement('div');
        phonesDiv.id = 'bigDiv';
        phonesDiv.className = 'invalidEm'
        document.body.append(phonesDiv);
        for(let ph of JSON.parse(localStorage.kluch)){
                n++
                let div = document.createElement('div');
                div.id=n
                div.innerHTML = '<h3>'+ph.name+'</h3>'
                        '<h5>'+ph.character+'</h5>'
                div.className = 'invalidEm'
                phonesDiv.append(div);
                let butt = document.createElement('button');
                butt.innerHTML = '-remove'
                butt.id = n
                butt.addEventListener('click',rem);
                div.append(butt);
                
        }
} 

function rem(){

        console.log(event.target.id)
        let d=document.getElementById(event.target.id);
        d.remove();
        let newArr=JSON.parse(localStorage.kluch)
        // let newNewArr=[]
        
        newArr.splice(((event.target.id)-1), 1)
        // delete newArr[(event.target.id)-1]
        // for(let elem for newArr){
        //         if(i!=(event.target.id-1)){
        //                 newNewArr.push(newArr[i])
        //         }
        // }

        localStorage.kluch=JSON.stringify(newArr)
        addIphone()
        
}        
// for(let ph of JSON.parse(localStorage.kluch)){
//         y++
//         y.addEventListener('click', remove)
// }
        // let a
        // let fruitsDiv = document.createElement('div');
        // fruitsDiv.id = 'fruits';
        // fruitsDiv.className = 'invalidEm'
        // fruitsDiv.innerHTML = JSON.parse(localStorage.kluch)[0].email
        // document.body.append(fruitsDiv);


// b.addEventListener('click', addIphone)
