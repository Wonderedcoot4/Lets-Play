<%-- 
    Document   : index
    Created on : 22 mar 2023, 22:48:07
    Author     : Isaac Espinoza y Edson Arguello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>Login | JustPlay</title>
</head>
<body>
    <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-md-6 side-image">
                </div>
                <div class="col-md-6 right">
                    <div class="input-box">
                        <form action="LoginServlet" method="POST" name="formLogin" id="LoginForm" class="needs-validation" novalidate>
                        <header>Inicia Sesión</header>
                        <div class="input-field position-relative">
                            <input name="emailUsuario" type="text" class="input" id="email" required autocomplete="off">
                            <label for="email">Usuario</label>
                            <div class="invalid-tooltip">
                                Ingrese un usuario valido.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input  name="passUsuario" type="password" class="input" id="password" required>
                            <label for="password">Contraseña</label>
                            <div class="invalid-tooltip" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                                Ingrese una contraseña valida.
                            </div>
                        </div>
                        <div class="input-field">
                            <input type="submit" class="submit" value="Iniciar">
                        </div>
                        <div class="signin">
                            <span>¿No tienes una cuenta? <a href="Registro.jsp">Crea una aquí</a></span>
                           
                        </div>
                     </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="validations.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</body>
</html>