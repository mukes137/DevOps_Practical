let form = document.getElementById("form");
let input = document.getElementById('input');
let dateInput = document.getElementById('dateInput')
let task = document.getElementById('task');



form.addEventListener("submit", (e) => {
    e.preventDefault();
    formValidation();
    reset();
  });


let formValidation = () => {
    if (input.value === "") {
        console.log("falure");
    } else {
        console.log("success");
        acceptData();
    }
   
};


let data = [{}];


let acceptData = () => {
    data.push({
        text : input.value,
        date : dateInput.value
    })
    localStorage.setItem("data", JSON.stringify(data));
    createTask();
};

let createTask = () => {
    task.innerHTML = "";
    data.map((x, y) => {
        return (task.innerHTML += ` 
        <div id="${y}">
        <div class="card float-lg-start border-primary mb-2" style="width: 100%; background-color: rgb(127, 172, 255);">
        <div class="card-body">
        <h6 class="card-subtitle mb-2 text-muted">${x.date}</h6>
        <p class="card-text">${x.text}</p>
        <div class="float-end">
            <button onclick="edit(this)"; class="btn btn-sm btn-success">
                <i class="fa fa-edit"></i>
            </button>
            <button onclick="deletes(this)"; class="btn btn-sm btn-danger">
                <i  class="fa fa-trash"></i>
            </button>
        </div>
        </div>
        </div>
        </div>
        `)
    });
    
reset();
};


let deletes = (e) => {
    e.parentElement.parentElement.parentElement.remove();
    data.splice(e.parentElement.parentElement.parentElement.id, 1);
    localStorage.setItem("data", JSON.stringify(data));
}

let edit = (e) => {
    let selected = e.parentElement.parentElement;
    dateInput.value = selected.children[0].innerHTML;
    input.value = selected.children[1].innerHTML;

    deletes(e);
}
let reset = () => {
    dateInput.value = "";
    input.value = "";
    
};

(() => {
    data = JSON.parse(localStorage.getItem("data")) || [];
    createTask();
  })();
