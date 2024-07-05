<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listarProducto
    Created on : 31/05/2023, 10:51:15 AM
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
        <title>Listar Producto</title>
    </head>
    <body>

        <div class="container col-sm-9">
            <h1 class="text-center">Listado de Productos</h1>
            <br>
            <table class="table table-hover">
                <tr class="bg-light">
                    <td>Id Producto</td>
                    <td>Descripcion</td>
                    <td>Costo</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                </tr>

                <c:forEach var="campo" items="${Lista}">
                    <tr>
                        <td>${campo.id}</td>
                        <td>${campo.descripcion}</td>
                        <td>${campo.costo}</td>
                        <td>${campo.precio}</td>
                        <td>${campo.cantidad}</td>
                        <td><a class="btn btn-info" href="ControlerProducto?Op=Consultar&Id=${campo.id}"><i class="fa-solid fa-magnifying-glass"></i></a></td>
                        <td><a class="btn btn-success" href="ControlerProducto?Op=Modificar&Id=${campo.id}"><i class="fa-solid fa-pen-to-square"></i></td>
                        <td><a class="btn btn-danger" href="ControlerProducto?Op=Eliminar&Id=${campo.id}"><i class="fa-sharp fa-solid fa-trash-can"></i></td>
                    </tr>
                </c:forEach>

            </table>
            <div class="d-flex justify-content-center">
                <button class="btn btn-info" onclick="window.location.href = 'index.jsp'">Volver al inicio</button>
            </div>
        </div>
    </body>
    <script src="https://kit.fontawesome.com/b8fe3f53d2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>
