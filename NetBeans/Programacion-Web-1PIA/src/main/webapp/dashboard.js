//Modal 1
const btnAbrirModal = document.querySelector("#btn-abrir-modal");
const btnCerrarModal = document.querySelector("#btn-cerrar-modal");
const modal = document.querySelector("#modal");

btnAbrirModal.addEventListener("click",()=>{
    modal.showModal();
})

btnCerrarModal.addEventListener("click",()=>{
    modal.close();
})

//Modal2
const btnAbrirModal2 = document.querySelector("#btn-abrir-modal2");
const btnCerrarModal2 = document.querySelector("#btn-cerrar-modal2");
const modal2 = document.querySelector("#modal2");

btnAbrirModal2.addEventListener("click",()=>{
    modal2.showModal();
})

btnCerrarModal2.addEventListener("click",()=>{
    modal2.close();
})


//Modal 3
const btnAbrirModal3 = document.querySelector("#btn-abrir-modal3");
const btnCerrarModal3 = document.querySelector("#btn-cerrar-modal3");
const modal3 = document.querySelector("#modal3");

btnAbrirModal3.addEventListener("click",()=>{
    modal3.showModal();
})

btnCerrarModal3.addEventListener("click",()=>{
    modal3.close();
})

//Modal 4
const btnAbrirModal4 = document.querySelector("#btn-abrir-modal4");
const btnCerrarModal4 = document.querySelector("#btn-cerrar-modal4");
const modal4 = document.querySelector("#modal4");

btnAbrirModal4.addEventListener("click",()=>{
    modal4.showModal();
})

btnCerrarModal4.addEventListener("click",()=>{
    modal4.close();
})

 function check(input)
 {
    	
    	var checkboxes = document.getElementsByName()("categoria");
    	
    	for(var i = 0; i < checkboxes.length; i++)
    	{
    		//uncheck all
    		if(checkboxes[i].checked == true)
    		{
                        console.log(checkboxes[i].toString());
    			checkboxes[i].checked = false;
    		}
    	}
    	
    	//set checked of clicked object
    	if(input.checked == true)
    	{
    		input.checked = false;
    	}
    	else
    	{
    		input.checked = true;
    	}	
}

$("#c01").click(function(){
	if($("#c01").is(':checked'))
  	$("#c02").prop("checked", false);
});