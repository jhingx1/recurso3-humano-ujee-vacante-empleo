<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Departamento de Recursos Humanos - Starks</title>
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
        <h3 class="text-muted">Starks</h3>
        <nav>
          <ul class="nav nav-justified">
            <li><a href="homepage">Inicio</a></li>            
            <li><a href="admin?action=login">Administración</a></li>                        
            <li><a href="acerca.jsp">Acerca</a></li>              
          </ul>
        </nav>
      </div>
      
      <!-- Formulario para la busqueda. El formulario es enviado por POST al BusquedaController -->    
      <form method ="post" action="buscar" class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" name="query" required placeholder="Buscar oferta..." class="form-control">
        </div>        
        <button type="submit" class="btn btn-success">Buscar</button>
      </form>
          
      <!-- Jumbotron -->
      <div class="jumbotron">
        <h2>¡ENCUENTRA TU TRABAJO IDEAL!</h2>
        <!--
        <h4>ESTAMOS CONTRATANDO</h4>
        -->
        <p class="lead text-justify">Bienvenido a Starks, aquí podrás encontrar ofertas de empleos 
          que sean adecuados a tu perfil, experiencia y ubicación. 
          Es muy fácil de usar, solo haz clic en una vacante, ingresa para ver los detalles y envíanos tu CV en formato 
          PDF o DOCX. Nosotros revisaremos tu CV y posteriormente te contactaremos.<br><br>

        <p><a class="btn btn-lg btn-success" href="vacante?action=lista" role="button">Ver más Ofertas</a></p>                
      </div>

      <h1>Ofertas recientes</h1>

     <!-- Example row of columns -->
      <div class="row">
      
      	<c:forEach items="${ultimas}" var="vacante" varStatus="status">
      	
      		<div class="col-lg-4">
	          <h2>${vacante.id}</h2>
	          <p class="text-danger text-justify">${vacante.nombre}</p>
	          <p class="text-justify">${vacante.descripcion}</p>
	          <p><a class="btn btn-primary" href="vacante?action=ver&id=${vacante.id}" role="button">Ver Ofertas &raquo;</a></p>
	        </div>
      	      	
      	</c:forEach>
      
        
        
        
<!--         <div class="col-lg-4"> -->
<!--           <h2>Heading</h2> -->
<!--           <p class="text-danger text-justify">As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p> -->
<!--           <p class="text-justify">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p> -->
<!--           <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p> -->
<!--         </div> -->
<!--         <div class="col-lg-4"> -->
<!--           <h2>Heading</h2> -->
<!--           <p class="text-danger text-justify">As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p> -->
<!--           <p class="text-justify">Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p> -->
<!--           <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p> -->
<!--         </div> -->


      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2016 My Company, Inc.</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>