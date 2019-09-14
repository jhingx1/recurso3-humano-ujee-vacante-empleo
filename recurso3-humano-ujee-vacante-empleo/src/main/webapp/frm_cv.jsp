<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Envio de CV</title>
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
      <br>

      <h4><font color="red">${message}</font></h4> <!-- message: objeto que esta implicito en la pagina -->
      
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title"><b>Enviar CV para vacante: ${vacante.nombre}</b></h3>
        </div>
        <div class="panel-body">

          <form action="solicitud" method="post" enctype="multipart/form-data">
             <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" name="nombre" value="${solicitud.nombre}" required id="nombre">              
            </div>                   
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" name="email" value="${solicitud.email}" required id="email">
            </div>                   
            <div class="form-group">
              <label for="telefono">Teléfono</label>
              <input type="text" class="form-control" name="telefono" value="${solicitud.telefono}" required id="telefono">
            </div>                   
            <div class="form-group">
              <label for="direccion">Dirección</label>
              <input type="text" class="form-control" name="direccion" value="${solicitud.direccion}" required id="direccion">
            </div>                                          
            <div class="form-group">
              <label for="archivo">Subir CV</label>
              <input type="file" required id="archivo" name="archivo">
              <p class="help-block">Solo se permiteo archivos [ pdf,doc,docx ]</p>
            </div>             
            <input type="hidden" value="${vacante.id}" name="idVacante">
            <button type="submit" class="btn btn-success" >Enviar</button>
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
