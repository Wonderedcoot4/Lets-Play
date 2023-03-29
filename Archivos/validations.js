// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')
  
    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
  
        form.classList.add('was-validated')
        comprobarClave()
        comprobarFecha()
      }, false)
    })

    function comprobarClave() {
      var pass1 = document.getElementById("password")
      var pass2 = document.getElementById("password2")
  
      if (pass1.value == pass2.value) {
        pass2.setCustomValidity("")
      } else {
         pass2.setCustomValidity("Invalid field")
      }
  }

  function comprobarFecha(){
    var fecha = document.getElementById("date")
    
    var hoy = new Date()
    var cumpleanos = new Date(fecha.value)
    var edad = hoy.getFullYear() - cumpleanos.getFullYear()
    var m = hoy.getMonth() - cumpleanos.getMonth()
    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--
    }
    if(edad >= 6){
      fecha.setCustomValidity("")
    }
    else if(edad <= 0){
      fecha.setCustomValidity("Invalid field")
    }
    else{
      fecha.setCustomValidity("Invalid field")
    }
  }
            

        
          

  })()
