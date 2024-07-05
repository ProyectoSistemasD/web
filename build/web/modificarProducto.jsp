<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : modificarProducto
    Created on : 31/05/2023, 11:24:22 AM
    Author     : USER
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<producto> Lista = (List<producto>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Editar Producto</title>
    </head>
    <body>
      

        <form action="ControlerProducto" method="post"> 
            <div class="container col-sm-5">
                  <h1 class="text-center">Modifica Productos</h1>
        <br>
                <table class="table table-hover">

                    <c:forEach var="campo" items="${Lista}">
                        <tr>
                            <td class="bg-light">Id Producto</td>
                            <td>${campo.id}</td>
                        <input class="form-control" type="hidden" name="Id" value="${campo.id}">
                        </tr>
                        <tr>
                            <td class="bg-light">Descripcion</td>
                            <td><input  class="form-control" type="text" name="descripcion" value="${campo.descripcion}"></td>
                        </tr>
                        <tr>
                            <td class="bg-light">Costo</td>
                            <td><input  class="form-control" type="text" name="costo" value="${campo.costo}"></td>
                        </tr>     
                        <tr>
                            <td class="bg-light">Precio</td>
                            <td><input  class="form-control" type="text" name="precio" value="${campo.precio}"></td>
                        </tr>        
                        <tr>
                            <td class="bg-light">Cantidad</td>
                            <td><input  class="form-control" type="text" name="cantidad" value="${campo.cantidad}"></td>
                        </tr>             
                    </c:forEach>
                </table>
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-success" name="modificar" value="Modificar"> 
            </div>
        </form>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>
