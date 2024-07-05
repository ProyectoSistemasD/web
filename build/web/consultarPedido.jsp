<%@page import="java.text.DecimalFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.detallePedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<detallePedido> Lista = (List<detallePedido>) request.getAttribute("Lista");
    String nombresCliente = (String) request.getAttribute("NombresCliente");
    String apellidosCliente = (String) request.getAttribute("ApellidosCliente");
    
       
     DecimalFormat df = new DecimalFormat("#.00");
     


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Consultar Pedido</title>
    </head>
    <body>
        <div class="container col-sm-9">
            <h1>Consulta de Pedido</h1>
            
            <h4>Cliente:</h4>
            <p>${NombresCliente} ${ApellidosCliente}</p>
            
            <table class="table table-hover">
            <tr>
                        <td class="text-center bg-light">Id Pedido</td>
                        <td class="text-center bg-light">Id Producto</td>
                        <td class="text-center bg-light">Descripción</td>
                        <td class="text-center bg-light">Cantidad</td>
                        <td class="text-center bg-light">Precio</td>
                        <td class="text-center bg-light">Total Detalle</td>

                    </tr>
                <c:forEach var="campo" items="${Lista}">
                  
                    <tr>

                        <td class="text-center">${campo.getId_Pedido()}</td>
                        <td class="text-center">${campo.getId_Prod()}</td>
                        <td class="text-center">${campo.getDescripcion()}</td>
                        <td class="text-center">${campo.getCantidad()}</td>
                        <td class="text-center">${campo.getPrecio()}</td>
                        <td class="text-center">${campo.getTotalDeta()}</td>
                    </tr>

                </c:forEach>
                      <tr>
                    
                    <td class="text-center" colspan="5"><strong>SubtTotal de Ventas:</strong></td>
                    <td class="text-center"><strong>${TotalVentas}</strong></td>
                </tr>
                <tr>
                    
                    <td class="text-center" colspan="5"><strong>Total de Ventas:</strong></td>
                    <td class="text-center"><strong>${Math.round(TotalVentas*1.18 * 100.0) / 100.0}</strong></td>
                </tr>
            </table>

            <h3><a href="index.jsp">Volver</a></h3>
        </div>



    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <script src="src/js/Sesion.js" type="text/javascript"></script>
</html>