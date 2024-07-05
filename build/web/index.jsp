<%-- 
    Document   : index
    Created on : 17/09/2022, 08:38:47 AM
    Author     : javie
--%>
    <body>
        <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  
            if (session.getAttribute("user")==null){
                response.sendRedirect("login.jsp");
            }
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Inicio</title>
    </head>
    <body>
    
     <div class="container d-flex flex-column justify-content-center align-items-center">
         <hr>
  <h1>Menú Principal</h1>
  <br>
  <div class="row">
    <div class="col-12 d-flex flex-column justify-content-center align-items-center">
        <p><a class="btn btn-primary my-2" style="width: 150px" href="Clientes.jsp">Clientes</a></p>
      <p><a class="btn btn-primary my-2" href="Productos.jsp" style="width: 150px">Producto</a></p>
      <p><a class="btn btn-primary my-2" href="Pedidos.jsp" style="width: 150px">Pedidos</a></p>
      <p><a class="btn btn-primary my-2" href="ValidarLogin?Op=CerrarSesion" style="width: 150px">Cerrar Sesión</a></p>
    </div>
  </div>
  
</div>
           <hr>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="src/js/Sesion.js" type="text/javascript"></script>

</html>
