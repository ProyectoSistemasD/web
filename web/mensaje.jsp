<%-- 
    Document   : mensaje
    Created on : 07/07/2023, 10:11:54 PM
    Author     : JUJO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Mensaje</title>

        <style>
            .error-message {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                color: rgba(100, 59, 72, 0.8);
                font-size: 24px;
            }
            .error-icon {
                font-size: 60px;
                color: red;
                margin-top: 10px;
            }
            .intento{
                color: rgba(147, 34, 106, 0.8);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12 error-message">
                    <h1>Error: Usuario no encontrado</h1>
                    <p><a class="intento" href="login.jsp">Volver a Interlo</a></p>
                    <div>
                        <i class="fa-solid fa-triangle-exclamation fa-beat error-icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src="https://kit.fontawesome.com/b8fe3f53d2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
