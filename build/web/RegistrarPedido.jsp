<%-- 
    Document   : RegistrarPedido
    Created on : 07/07/2023, 07:30:13 AM
    Author     : PC1
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Registrar Pedido</title>

    </head>

    <body>
        <form action="ControlerPedido" method="post">
        <h1>Nuevo Pedido</h1>

        <div class="d-flex flex-column mt-4">
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Ingrese DNI del Cliente</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" id ="txtDNI" name="dniCliente" class="form-control col-sm-8" placeholder="DNI">
                                <button name="" type="button"  class="btn btn-outline-info col-8" id="btnBuscarCliente">Buscar DNI</button>
                            </div>                  
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Datos del Cliente</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-3 d-flex">
                                <input type="text"  id="txtCodigoCliente" Readonly="true" name="txtCodigoCliente" class="form-control" placeholder="Codigo">
                            </div>
                            <div class="col-sm-4 d-flex">
                                <input type="text" id="txtNombreCliente" disabled="true" name="nombreCliente" class="form-control" placeholder="Nombre">
                            </div>
                            <div class="col-sm-4 d-flex">
                                <input type="text" id="txtApellidoCliente"  disabled="true" name="apellidoCliente" class="form-control" placeholder="Apellido">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex flex-column mt-4">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Productos</label>
                            <button type="button" id="btnMostrarProducto" class="btn btn-outline-info float-right" data-toggle="modal" data-target="#modalProductos">Ver Productos</button>                            
                        </div>
                        <div class="form-group d-flex justify-content-center align-items-center">
                            <table class="table table-hover">
                                <tr class="">
                                   <th>ID</th>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                       <th>Cantidad</th>
                                           <th>Sub Total</th>
                                    <th></th>
                                </tr>
                                <tbody id="tablaProductoDetalle">
                               
                                </tbody>
                            </table>
                        </div>
                                  <div class="form-group">
                            <label>Subtotal de venta: </label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-3 d-flex">
                                <icon>S/ </icon><input type="text" value="0" id="txtSubTotal" Readonly="true"  name="txtSubTotal" class="form-control" placeholder="Total">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Total de venta: </label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-3 d-flex">
                                <icon>S/ </icon><input type="text" value="0" id="txtTotal" Readonly="true"  name="txtTotal" class="form-control" placeholder="Total">
                            </div>
                        </div>
                        
                              <input type="submit" class="btn btn-primary" value="Registrar" />
                    </div>
                </div>
            </div>
        </div>


        <!-- Modales -->

        <div class="modal fade" id="modalProductos">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Productos</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                       <th>Cantidad</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tablaProducto">
                                <tr>
                                    <td>ID</td>
                                    <td>Producto 1</td>
                                    <td>$10</td>
                                    <td>2</td>
                                    <td><button type="button" class="btn btn-primary btn-sm">Añadir</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

           
        

        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cliente no encontrado</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>El cliente con el DNI  ####   no existe</p>
                        <p>Registrelo en: <a href="#">Registrar Cliente</a></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        
        
   
        
        </form>
    </body>
    <script src="https://kit.fontawesome.com/b8fe3f53d2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>
<script>
    
    
var btnBuscarCliente = document.getElementById('btnBuscarCliente');
var txtDNI = document.getElementById('txtDNI');
var btnMostrarProducto= document.getElementById('btnMostrarProducto');
var tablaProductoDetalle=document.getElementById("tablaProductoDetalle");        
var txtSubTotal = document.getElementById("txtSubTotal");   
var txtTotal = document.getElementById("txtTotal"); 

btnBuscarCliente.addEventListener('click', function() {
  
  var dni = txtDNI.value;
  
    if(dni==""){
    alert("Ingrese el DNI")
    return;
    }
   var rutaBase = window.location.origin;

  var url = rutaBase + '/PractSem04/Proyecto/ControlerCliente?Op=ConsultarJson&DNI=' + dni;

  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.setRequestHeader('Content-type', 'application/json');
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
     
      var jsonResponse = JSON.parse(xhr.responseText);
      if(Object.keys(jsonResponse).length === 0){
          console.log("DATA NO ENCONTRADA");
      }else{
      document.getElementById("txtCodigoCliente").value=jsonResponse["Id_Cliente"];
        document.getElementById("txtNombreCliente").value=jsonResponse["Apellidos"];
          document.getElementById("txtApellidoCliente").value=jsonResponse["Nombres"];
       }
      
    
    }
  };
  xhr.send();
});
 

btnMostrarProducto.addEventListener('click', function() {
  

   var rutaBase = window.location.origin;

  var url = rutaBase + '/PractSem04/Proyecto/ControlerProducto?Op=ListarJson';

  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.setRequestHeader('Content-type', 'application/json');
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
     
      var jsonResponse = JSON.parse(xhr.responseText);
      if(Object.keys(jsonResponse).length === 0){
          console.log("DATA NO ENCONTRADA");
      }else{
         console.log(jsonResponse);
         
         var html="";
         
         jsonResponse.forEach(function(item) {
html += "<tr><td>" + item['Id_Prod'] + "</td>" +
        "<td>" + item['Descripcion'] + "</td>" +
        "<td>" + item['precio'] + "</td>" +
        "<td>" + item['cantidad'] + "</td>" +
        "<td><button type='button' class='btn btn-primary btn-sm' onclick=\"AddProd('" + item['Id_Prod'] + "','" + item['Descripcion'] + "'," + item['precio'] + "," + item['cantidad'] + ")\">Añadir</button></td></tr>";
    });
    document.getElementById("tablaProducto").innerHTML=html;
       }
      
    
    }
  };
  xhr.send();
});
 
 function AddProd(id,desc,pr,c){
 
var flag=true;
var elementosHidden = document.querySelectorAll("input[type='hidden'][name='Id_Prod']");
for (var i = 0; i < elementosHidden.length; i++) {
  var valor = elementosHidden[i].value;
  
  if (valor==id) {
  flag=false;
  } 
  
}

    if(flag){
  var Cantidad = prompt("Ingrese la cantidad que necesita:");
  if(Cantidad!=null && Cantidad!=""){
      if(Cantidad<=c){
      
      txtSubTotal.value = (Number(txtSubTotal.value) + (pr * Cantidad)).toFixed(2);
      txtTotal.value=(Number(txtSubTotal.value) *1.18).toFixed(2);
      
         tablaProductoDetalle.innerHTML+="<tr><td>" + id + "</td>" +
        "<td><input type='hidden' name='Id_Prod' value='" + id + "' />" + desc + "</td>" +
        "<td><input type='hidden' name='precio' value='" + pr + "' />" + pr + "</td>" +
        "<td><input type='hidden' name='cantidad' value='" + Cantidad + "' />" + Cantidad+ "</td>" +
         "<td>" + pr*Cantidad+ "</td>" +
        "<td><button type='button' class='btn btn-danger btn-sm' onclick=\"DeleteProd(this,'" + id + "','" +desc + "'," + pr + "," + Cantidad + ")\"><i class='fa-sharp fa-solid fa-trash-can'></i></button></td></tr>";   
      }else{
          alert("No se puede exceder del stock");
      }


  }
    }else{
        alert("El código de producto ya existe en el detalle");
    }
  
  
 }
    
function DeleteProd    (that,id,desc,pr,c){
  txtSubTotal.value = (Number(txtSubTotal.value) - (pr * c)).toFixed(2);
    txtTotal.value=(Number(txtSubTotal.value) *1.18).toFixed(2);
  var fila = that.parentNode.parentNode;
  fila.parentNode.removeChild(fila);
    
    }


 </script>