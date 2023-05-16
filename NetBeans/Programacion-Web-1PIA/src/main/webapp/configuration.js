//Modal2
const btnAbrirModal7 = document.querySelector("#btn-abrir-modal7");
const btnCerrarModal7 = document.querySelector("#btn-cerrar-modal7");
const modal7 = document.querySelector("#modal7");

btnAbrirModal7.addEventListener("click",()=>{
    modal7.showModal();
})

btnCerrarModal7.addEventListener("click",()=>{
    modal7.close();
})


//Modal 3
const btnAbrirModal8 = document.querySelector("#btn-abrir-modal8");
const btnCerrarModal8 = document.querySelector("#btn-cerrar-modal8");
const modal8 = document.querySelector("#modal8");

btnAbrirModal8.addEventListener("click",()=>{
    modal8.showModal();
})

btnCerrarModal8.addEventListener("click",()=>{
    modal8.close();
})

function ReturnDashboard()
{
    console.log("GET USUARIO DASH")
    
   $.ajax({
       url:"ProfileConfigServlet?accion=Return"
       ,type:"GET"
       , success: function (data) {
            console.log("OK", data);
        }
   })
}

function ReturnDashboard2()
{
    console.log("GET USUARIO DASH")
    
    fetch("ProfileConfigServlet?accion=Return",
    {
        method:"GET"
    })
            .then(data =>{
                console.log(data);
    })

}

function ReturnDashboard3()
{
    console.log("GET USUARIO DASH")
    
    fetch("ProfileConfigServlet?accion=Return",
    {
        method:"GET"
    })
            .then(data =>{
                console.log(data);
    })

}

function UpdateUsuario()
{
    console.log("POST Update Usuario Config")
    
   $.ajax({
       url:"ProfileConfigServlet?=UpdateUser"
       ,type:"POST"
       ,dataType: "JSON"
   })
}