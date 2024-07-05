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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Nuevo Cliente</title>
    </head>
    <body>

        <form action="ControlerCliente" method="post" id="FormularioCliente">
            <div class="container col-sm-3">
                        <h1 class="text-center"> Inserta Clientes</h1>
                <table border="1" class="table table-hover">
                    <tr>
                        <td class="bg-light">Id Cliente</td>
                        <td><input class="form-control" type="hidden" name="Id"></td>
                    </tr>
                    <tr>
                        <td class="bg-light">Apellidos</td>
                        <td><input class="form-control"  type="text" id="apellidos" name="apellidos"></td>
                    </tr>
                    <tr>
                        <td class="bg-light">Nombres</td>
                        <td><input  class="form-control"  type="text" name="nombres" id="nombres"></td>
                    </tr>     
                    <tr>
                        <td class="bg-light">DNI</td>
                        <td><input  class="form-control"  type="text" name="DNI" id="DNI"></td>
                    </tr>        
                    <tr>
                        <td class="bg-light">Dirección</td>
                        <td><input  class="form-control"  type="text" name="direccion" id="direccion" ></td>
                    </tr>  
                    <tr>
                        <td class="bg-light">Teléfono</td>
                        <td><input class="form-control"  type="text" name="telefono" id="telefono"></td>
                    </tr>                 
                    <tr>
                        <td class="bg-light">Móvil</td>
                        <td><input  class="form-control"  type="text" name="movil" id="movil"></td>
                    </tr>                 
                </table>
            </div>
            <div class="col-md-1 mx-auto">
                <input type="submit" name="modificar" value="Grabar" class="btn btn-success">
            </div>
        </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
     <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>

    <script>
  // Obtener una referencia al formulario
  var formulario = document.getElementById("FormularioCliente");

  // Agregar un controlador de eventos para el evento de envío del formulario
  formulario.addEventListener("submit", function(event) {
  console.log("llego");
  
   if(document.getElementById("apellidos").value=="" ||    document.getElementById("nombres").value==""         ||    document.getElementById("DNI").value==""     ||   document.getElementById("direccion").value==""           ||   document.getElementById("telefono").value==""    ||  document.getElementById("movil").value==""   ){
event.preventDefault();
alert("Conplete todos los campos del formulario");

   }
   
  
    
  });
</script>


