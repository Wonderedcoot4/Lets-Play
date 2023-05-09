$document.ready(function(){
 $('LoginForm').submit(function (event)
    {
        event.preventDefault();
        alert("Enviando");
        $.ajax({
            data: $(this).serialize(),
            types: "POST",
            dataType: "json",
            url: "NOMBRE DEL SERVLET"
        })
    });
});
