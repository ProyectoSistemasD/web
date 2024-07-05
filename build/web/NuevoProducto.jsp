
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Nuevo Producto</title>
    </head>
    <body>
      
        <form action="ControlerProducto" method="post" id="FormularioProducto">
            <div class="container col-sm-3">
                  <h1 class="text-center">Nuevo Producto</h1>
                <table border="1" class="table table-hover">

                    <tr>
                    <input type="hidden" name="Id" >
                    </tr>
                    <tr>
                        <td class="bg-light">Descripcion</td>
                        <td><input class="form-control" type="text" name="descripcion"  id="descripcion"></td>
                    </tr>
                    <tr>
                        <td class="bg-light">Costo</td>
                        <td><input class="form-control" type="text" name="costo"  id="costo"></td>
                    </tr>     
                    <tr>
                        <td class="bg-light">Precio</td>
                        <td><input class="form-control" type="text" name="precio"   id="precio"></td>
                    </tr>        
                    <tr>
                        <td class="bg-light">Cantidad</td>
                        <td><input class="form-control" type="text" name="cantidad"  id="cantidad"></td>
                    </tr>             

                </table>
            </div>
            <div class="text-center">
                <input type="submit" name="Agregar" class="btn btn-success" value="Agregar">
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
  var formulario = document.getElementById("FormularioProducto");

  // Agregar un controlador de eventos para el evento de envío del formulario
  formulario.addEventListener("submit", function(event) {
  console.log("llego");
  
   if(document.getElementById("descripcion").value=="" ||    document.getElementById("costo").value==""         ||    document.getElementById("precio").value==""     ||   document.getElementById("cantidad").value==""){
    event.preventDefault();
    alert("Conplete todos los campos del formulario");
   }
   
  
    
  });
</script>
