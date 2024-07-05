<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : javie
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <br>
        <h1 class="col-12 d-flex flex-column justify-content-center align-items-center">Inicio de Sesión</h1>
        <form action="ValidarLogin" method="post">   
            <table class="table table-hover col-12 d-flex flex-column justify-content-center align-items-center">
                <tr>
                    <td class="text-center">Usuario</td>
                    <td><input type="text" name="txtUsuario"></td>
                </tr>
                <tr>
                    <td class="text-center">Clave</td>
                    <td><input type="password" name="txtClave"></td>
                </tr> 
            </table>        
            <div class="d-flex justify-content-center">
                <input type="submit" name="accion" value="Iniciar Sesion" class="btn btn-primary">
                <a href="RegistrarUsuario.jsp" class="btn btn-primary">Registrar Usuario</a> 
            </div>
        </form>
    </body>



    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
