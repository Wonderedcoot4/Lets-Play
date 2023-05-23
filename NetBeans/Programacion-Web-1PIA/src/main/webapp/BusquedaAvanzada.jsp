<%-- 
    Document   : BusquedaAvanzada
    Created on : 23 may 2023, 17:16:16
    Author     : isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script defer src="dashboard.js"></script>
    <title>Principal | Justplay</title>
    </head>
    <body class="colorBody slideBarScroll" style="background-color: gray">
        
         <div class="static">
        <nav class="navbar navbar-expand-lg navColor">
            <div class="col alingImage">
                <a class="navbar-brand" href="#"><img src="./Imagenes/JustPlay2.png" alt="logo" width="55px" class="rounded-circle"></a>
            </div>
            <div class="col">
                <form class="d-flex position-relative" method="get" action="BusquedaPostServlet">
                   <!-- <button class="btn colorIcon" type="submit" id="btn-abrir-modal3" ><i class="icon ion-md-menu"></i></button> -->
                    <!-- AQUI ES PARA LA BUSQUEDA NORMAL -->
                    
                        <input class="form-control colorSearchBar colorText" type="text" placeholder="Buscar" name="barrabusquedakev" id="BarraBusqueda" aria-label="Buscar">
                    
                        <button class="btn position-absolute btn-search colorIcon" id="botonBusquedaPost" type="submit"><i class="icon ion-md-search"></i></button>
                </form>
            </div>
            <div class="col alingFlex">
                <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal2">
                    <img src="" alt="logo" width="55px" class="rounded-circle"></a>
            </div>
        </nav>
    </div>
        
        
        <br><!-- comment -->
        <br>
        <br><!-- comment -->
        <br><!-- comment -->
        <br><!-- comment -->
         <br>
        <form action='AdvancedSearchServ' method="GET" style="text-align: center;">
    <div class="form-group" style="text-align: center; margin-bottom: 1rem;">
      <input style="
    width:600px; display:inline;" type="search" class="form-control" id="inputKeyword" name="keywordname" placeholder="¿Qué deseas buscar?">

      <br>
      <label for="inputState">Categoria</label>
         <select style="
              width:600px; display:inline;"  id="inputCat" class="form-control" name="catselec">
          <option selected value="0">TODAS</option>
          <option value="1">CAFÉ</option>
          <option value="2">TÉ</option>
          <option value="3">MATCHA</option>
          <option value="4">CAFÉ HELADO</option>
          <option value="5">LATTE</option>
          <option value="6">DESAYUNO</option>
          <option value="7">CITA</option>
          <option value="8">AESTHETIC</option>
      </select>
     </div>
           <div class="form-group" style="text-align: center; margin-bottom: 1rem;">
                <input id="fechainicial" name="fechainicialname" onkeydown="filtrarInput(event)" style="width: 200px;display:inline;" type="text" value="2023-03-02" class="form-control">
        <h5 class="pt-2" style="display:inline;"> hasta </h5>
        <input id="fechafinal" name="fechafinalname" onkeydown="filtrarInput(event)" style="width: 200px;display:inline;" type="text" value="2023-03-02" class="form-control">
        <span>Escribe la fecha en formato: yyyy-mm-dd</span>
           </div>
    <button class="btn btn-outline-success" id="botonSearch" type="submit" style="width: 200px;"> <i class="fa-solid fa-magnifying-glass"></i> Filtrar</button>
    </form>
    </body>
</html>
