<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Lista de todas las Solicitudes</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/justified-nav.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">

      <!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
      <div class="masthead">
        <h3 class="text-muted">My Company - Administración</h3>
        <nav>
          <ul class="nav nav-justified">
            <li><a href="admin?action=crear">Crear Vacante</a></li>
            <li><a href="vacante?action=lista">Vacantes</a></li>             
            <li><a href="solicitud?action=solicitudes">Solicitudes</a></li>                        
            <li><a href="admin?action=logout">Salir</a></li>            
          </ul>
        </nav>
      </div>
      <br>

      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><b>Lista de solicitudes recibidas</b></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th class="left">Fecha</th>
                <th>Nombre</th>
                <th>Email</th>                
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>Aplicó para</th>
                <th>Opciones</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${solicitudes}" var="solicitud" varStatus="status">
                <tr>
                  <td class="left">${solicitud.fecha}</td>
                  <td>${solicitud.nombre}</td>
                  <td>${solicitud.email}</td>
                  <td>${solicitud.telefono}</td>
                  <td>${solicitud.direccion}</td>
                  <td>${solicitud.vacante.nombre}</td>
                  <td>
                    <center>   
                      <!-- Mostramos un link para el archivo del CV que subio el usuario. El nombre del archivo lo tenemos
                      guadado en el campo archivo de la tabla solicitud y estan almacenados en la carpeta uploads en nuestro
                      directorio raiz de nuestra aplicacion.
                      -->
                      <a href="uploads/${solicitud.archivo}" target="_blank">
                        <img src="images/download.png" title="Descargar Curriculum Vitae">
                      </a>
                      &nbsp;&nbsp;&nbsp;
                       <!-- Mostramos un link para que el administrador le pueda enviar un correo electronico al usuario que
                       envio su CV. Mandamos el parametro email del usuario, al formulario donde se redactara el email.
                      -->
                      <a href="solicitud?action=responder&email=${solicitud.email}">
                        <img src="images/mail.png" title="Enviar correo electrónico.">
                      </a>
                    </center>  
                  </td>                                      
                </tr>
              </c:forEach>                      
            </tbody>           
          </table>
        </div>
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2016 My Company, Inc.</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>
