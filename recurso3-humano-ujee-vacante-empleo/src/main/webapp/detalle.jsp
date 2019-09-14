<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Detalle de la vacance - Ingeniero en procesos de inyeccion de plasticos</title>
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
        <h3 class="text-muted">My Company</h3>
        <nav>
          <ul class="nav nav-justified">
            <li><a href="homepage">Inicio</a></li>            
            <li><a href="admin?action=login">Administración</a></li>                        
            <li><a href="acerca.jsp">Acerca</a></li>              
          </ul>
        </nav>
      </div>
      <form method ="post" action="#" class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" name="query" required placeholder="Buscar oferta..." class="form-control">
        </div>        
        <button type="submit" class="btn btn-success">Buscar</button>
      </form>
      <br><br><br>

      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Numero de la vacante : ${vacante.id}</h3>
        </div>
        <div class="panel-body">
          <h5><b>Vacante</b>: ${vacante.nombre}</h5>
          <h5><b>Publicado</b>: ${vacante.fechaPublicacion}</h5>                             
          <b>Descripción:</b><br>
          <p class="text-justify">${vacante.descripcion}</p>
          <b>Detalles de la vacante</b>:<br>
          ${vacante.detalle}<br>
           <!--
          Mostramos un boton para permitir a un usuario enviar su Curriculm Vitae para esta Vacante. Estamos mandando 
          como parametro el id de esta vacante, ya que lo ocuparemos para hacer una busqueda para mostrar el nombre
          de la vacante en el siguiente formulario que es el formulario para enviar los datos del usuario, junto con su
          archivo DOC o PDF de su CV.
          -->          
          <p><a class="btn btn-default btn-success" title="Enviar Curriculm Vitae para aplicar a esta vacante." 
          	href="vacante?action=enviarCV&id=${vacante.id}" role="button">Enviar CV</a></p>
        </div>
      </div>      
      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2016 My Company, Inc.</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>