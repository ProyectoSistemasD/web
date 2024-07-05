<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<cliente> Lista = (List<cliente>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Editar Cliente</title>
    </head>
    <body>
   
        <form action="ControlerCliente" method="post"> 
            <div class="container col-sm-5">
                     <h1 class="text-center">Modifica Clientes</h1>
                <table class="table table-hover">

                    <c:forEach var="campo" items="${Lista}">
                        <tr>
                            <td class="bg-light">Id Cliente</td>
                            <td>${campo.id}</td>
                        <input class="form-control" type="hidden" name="Id" value="${campo.id}">
                        </tr>
                        <tr>
                            <td class="bg-light">Apellidos</td>
                            <td><input type="text"  class="form-control" class="form-control"name="apellidos" value="${campo.apellidos}"></td>
                        </tr>
                        <tr>
                            <td class="bg-light">Nombres</td>
                            <td><input type="text" class="form-control" name="nombres" value="${campo.nombres}"></td>
                        </tr>     
                        <tr>
                            <td class="bg-light">DNI</td>
                            <td><input type="text" class="form-control" name="DNI" value="${campo.DNI}"></td>
                        </tr>        
                        <tr>
                            <td class="bg-light">Dirección</td>
                            <td><input type="text" class="form-control" name="direccion" value="${campo.direccion}"></td>
                        </tr>  
                        <tr>
                            <td class="bg-light">Teléfono</td>
                            <td><input type="text"  class="form-control" name="telefono" value="${campo.telefono}"></td>
                        </tr>                 
                        <tr>
                            <td class="bg-light">Móvil</td>
                            <td><input type="text" class="form-control" name="movil" value="${campo.movil}"></td>
                        </tr>                 
                    </c:forEach>
                </table>
                     <div class="text-center">
                        <input type="submit" name="modificar" value="Modificar" class="btn btn-success"> 
                     </div>
                     </div>
           
        </form>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>
