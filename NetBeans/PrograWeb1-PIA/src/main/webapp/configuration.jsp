<%-- 
    Document   : configuration
    Created on : 24 mar 2023, 22:44:41
    Author     : isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script defer src="dashboard.js"></script>
    <title>Configuración | Justplay</title>
</head>
<body class="colorBody slideBarScroll">
    <div>
        <nav class="navbar navbar-expand-lg navColor">
            <div class="col alingImage">
                <a class="navbar-brand" href="#"><img src="./Imagenes/JustPlay2.png" alt="logo" width="55px" class="rounded-circle"></a>
            </div>
            <div class="col">
                <form class="d-flex position-relative">
                    <button class="btn colorIcon" type="submit" id="btn-abrir-modal3" ><i class="icon ion-md-menu"></i></button>
                    <input class="form-control colorSearchBar colorText" type="search" placeholder="Buscar" aria-label="Buscar">
                    <button class="btn position-absolute btn-search colorIcon" type="submit"><i class="icon ion-md-search"></i></button>
                </form>
            </div>
            <div class="col alingFlex">
                <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal2">
                    <img src="./Imagenes/icon.png" alt="logo" width="55px" class="rounded-circle"></a>
            </div>
        </nav>
    </div>
    <div class="container">
        <div class="row colorText allignIcon">
            <h1>Configuración</h1>
        </div>
        <div class="row">
            <div class="col">
                <div class="publicacion-body">
                    <div class="row">
                        <p class="text-publi">Configuración del perfil</p>
                    </div>
                    <div class="row">
                      
                        <label for="text" class="colorText">Nombre(s)</label> <br>
                        <input class="inText colorText" type="text" name="title" value="Edson Eduardo">
                      
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Apellido Paterno</label> <br>
                        <input class="inText colorText" type="text" name="title" value="Arguello">
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Apellido Materno</label> <br>
                        <input class="inText colorText" type="text" name="title" value="Tienda">
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Email</label> <br>
                        <input class="inText colorText" type="text" name="title" value="eeatienda2001@hotmail.com">
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Usuario</label> <br>
                        <input class="inText colorText" type="text" name="title" value="NachtDenos">
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Contraseña</label> <br>
                        <input class="inText colorText" type="password" name="title" value="123456">
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Confirmar contraseña</label> <br>
                        <input class="inText colorText" type="password" name="title" value="123456">
                    </div>
                    <div class="row marginConfiguration">
                        <label for="text" class="colorText">Fecha de Nacimiento</label>
                        <input type="date" class="input colorText" value="2002-03-02">
                    </div>
                    <div class="row marginConfiguration">
                        <div class="col"></div>
                        <div class="col-1">
                            <button class="btn colorIcon"><i class="icon ion-md-send iconConfig"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="publicacion-body">
                    <div class="row">
                        <p class="text-publi">Configuración de Imagen</p>
                    </div>
                    <div class="row marginConfiguration">
                        <p class="colorText">Foto de perfil</p>
                     </div>
                    <div class="row marginConfiguration">
                        <button type="button" class="mybutton" data-bs-container="body">
                            <img src="./Imagenes/icon.png" alt="logo" width="250px" class="rounded-circle"></a>
                    </div>
                    <div class="row marginConfigurationEx">
                        <div class="col"></div>
                        <div class="col">
                            <input type="button" class="submit" value="Imagen">
                        </div>
                        <div class="col"></div>
                    </div>
                    <div class="row marginConfiguration">
                        <div class="col"></div>
                        <div class="col-1">
                            <button class="btn colorIcon"><i class="icon ion-md-send iconConfig"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
   
    </div>
    <footer class="bg-dark text-center text-white">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
          <p>Pagina creada por:</p>
          <p>Edson Eduardo Arguello Tienda & Isaac Espinoza Morales</p>
          <p>LMAD | UANL</p>

        </div>
      </footer>
   


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>