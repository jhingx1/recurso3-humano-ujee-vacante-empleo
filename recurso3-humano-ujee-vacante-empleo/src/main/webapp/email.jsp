<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link rel="icon" href="favicon.ico">
    <title>Departamento de Recursos Humanos - My Company</title>
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
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title">Responder vía email</h3>
        </div>
        <div class="panel-body">

          <p class="text-danger">${message}</p>    

          <form action="email" method="post">
            <div class="form-group">
              <label for="destino">Destinatario</label>
              <input type="text" class="form-control" name="destino" readonly id="destino" value="${email}" >
            </div>                                     
            <div class="form-group">
              <label for="asunto">Asunto</label>
              <input type="text" class="form-control" name="asunto" required id="asunto" placeholder="Asunto del Email">
            </div>                   
            <div class="form-group">
              <label for="mensaje">Mensaje</label>
              <textarea class="form-control" name="mensaje" id="mensaje" required rows="3" placeholder="Escribe el mensaje del correo electrónico"></textarea>
            </div>        
            <button type="submit" class="btn btn-default" >Enviar correo</button>
          </form>
        </div>
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2016 My Company, Inc.</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>
