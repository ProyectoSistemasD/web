<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listar
    Created on : 17/09/2022, 10:54:58 AM
    Author     : javie
--%>
<%@page import="java.util.List"%>
<%@page import="Entidades.pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<pedido> Lista = (List<pedido>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.css" />
        <title>Lista Pedido</title>
    </head>
    <body>

        <div class="container col-sm-9">
            <h1>Listado de Pedidos</h1>
            <br>

            <table class="table table-hover" id="Pedidos">
                <thead>
                    <td class="text-center">Id Pedido</td>
                    <td class="text-center">Id Cliente</td>
                    <td class="text-center">Apellidos</td>
                    <td class="text-center">Nombres</td>
                    <td class="text-center">Fecha</td>
                     <td class="text-center">Sub Total Pedido</td>
                    <td class="text-center">Total Pedido</td>
                    <td></td>
                    <td></td>
                </thead>
                <tbody>
                <c:forEach var="campo" items="${Lista}">
                    <tr>
                        <td class="text-center">${campo.getId_Pedido()}</td>
                        <td class="text-center">${campo.getId_Cliente()}</td>
                        <td class="text-center">${campo.getApellidos()}</td>
                        <td class="text-center">${campo.getNombres()}</td>
                        <td class="text-center">${campo.getFecha()}</td>
                         <td class="text-center">${campo.getSubTotal()}</td>
                        <td class="text-center">${campo.getTotalVenta()}</td>
                        <td><a  class="btn btn-info" href="ControlerPedido?Op=Consultar&Id=${campo.getId_Pedido()}"><i class="fa-solid fa-magnifying-glass"></i></a></td>
                        <td><a class="btn btn-danger" href="ControlerPedido?Op=Eliminar&Id=${campo.getId_Pedido()}"><i class="fa-sharp fa-solid fa-trash-can"></i></a></td>
                    </tr>
                </c:forEach>
</tbody>
            </table>
        </div>
    </body>
 <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.js"></script>
    <script src="https://kit.fontawesome.com/b8fe3f53d2.js" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>
<script>
    $(document).ready( function () {
    $('#Pedidos').DataTable();
} );
    </script>