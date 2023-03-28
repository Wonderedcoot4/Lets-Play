<%-- 
    Document   : Registro
    Created on : 26 mar 2023, 20:42:02
    Author     : isaac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="registro.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>Registro | JustPlay</title>
</head>
<body>
    <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-12 m-0 p-0">
                    <h6 class="headerRegister m-0 p-0">Registro</h6>
                </div>
                <div class="col-md-6 right">
                    <div class="input-box">
                        <div class="helper mb-2 pb-5 ms-4">
                            <img src="./Imagenes/icon.png" class="image-icon">
                        </div>
                        <div class="input-field helper">
                            <div class="input-field margBoton"> 
                                <input type="submit" class="submit" value="Agregar Imagen">        
                            </div>                            
                            
                            <div class="signin">
                                <span>¿Ya tienes una cuenta? <a href="#">Inicia aquí</a></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 right"><form name="RegForm" action="RegistroServlet" method="post" class="needs-validation" novalidate>
                     <div class="input-box">
                        <div class="input-field position-relative">
                            <input type="text" class="input" id="text" name="Nombretext" required autocomplete="off" 
                            pattern="[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$">
                            <label for="text">Nombre</label>
                            <div class="invalid-tooltip">
                                Ingrese un nombre valido.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="text" class="input" id="text" name="ApAtext" required aNombretextutocomplete="off"
                            pattern="[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$">
                            <label for="text">Primer Apellido</label>
                            <div class="invalid-tooltip">
                                Ingrese un apellido valido.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="text" class="input" id="text" name="ApMtext"required autocomplete="off"
                            pattern="[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$">
                            <label for="text">Segundo Apellido</label>
                            
                            <div class="invalid-tooltip">
                                Ingrese un apellido valido.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="email" class="input" id="email" name="CorreoText" required autocomplete="off">
                            <label for="email">Email</label>
                            
                            <div class="invalid-tooltip">
                                Ingrese un Email valido.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="text" class="input" id="date" name="FechaBirthDTP" onfocus="(this.type='date')" onblur="if(!this.value) this.type='text'" required autocomplete="off">
                            <label for="text">Fecha de Nacimiento</label>
                            
                            <div class="invalid-tooltip">
                                Ingrese una fecha valida.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="text" class="input" id="text" name="UsuarioText" required autocomplete="off"
                            pattern="{3, 15}">
                            <label for="text">Usuario</label>
                            
                            <div class="invalid-tooltip">
                                Ingrese un usuario valido.
                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="password" class="input" id="password" name="Passwordtext" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                            <label for="password">Contraseña</label>
                            
                            <div class="invalid-tooltip">
                                Ingrese una contraseña valida.

                            </div>
                        </div>
                        <div class="input-field position-relative">
                            <input type="password" class="input" id="password" name="Contratext" required>
                            <label for="password">Confirmar contraseña</label>
                            
                            <div class="invalid-tooltip">
                                Ingrese la contraseña anterior.
                            </div>
                        </div>
                         <div class="input-field">
                                <input type="submit" class="submit" value="Registrarse">
                                
                            </div>
                     </div>
                </div></form>
            </div>
        </div>
    </div>
    <script src="validations.js"></script>
</body>
</html>