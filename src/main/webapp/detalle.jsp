<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Detalle</title>
<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<main class="p-4 d-flex flex-column align-items-center">
		<h1 class="mt-3">Datos del aula</h1>
			<div class="card" style="width: 40vw;">
				<div class="card-body">
					<form method="post" class="pb-4" action="aula">
					<c:choose>
						<c:when test="${aula.numaula != null}">
							<input type="hidden" name="action" value="editar" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="action" value="alta" />
						</c:otherwise>
 					</c:choose>
 					<label for="numaula">N�mero:</label>
 					<input type="number" class="form-control" id="numaula" name="numaula" value='${aula.numaula}' required
	 					<c:if test="${aula.numaula != null}">
		 						readonly
		 				</c:if>
 					/><br>
 					<label for="nombre">Nombre</label>
 					<input type="text" class="form-control" id="nombre" name="nombre" value='${aula.nombre}' required
 						<c:if test="${user.perfil.equals('normal')}">
		 						readonly
		 				</c:if>
 					/> <br>
 					<label for="capacidad">Capacidad</label>
 					<input type="number" class="form-control" id="capacidad" name="capacidad" value='${aula.capacidad}' required
	 					<c:if test="${user.perfil.equals('normal')}">
		 						readonly
		 				</c:if>
 					/><br>
 					<label for="descripcion">Descripcion</label>
 					<textarea class="form-control" name="descripcion" id="descripcion" rows="4" cols="50" required
 						<c:if test="${user.perfil.equals('normal')}">
		 						readonly
		 				</c:if>
 					>${aula.descripcion}</textarea>
 					
 					<div class="p-4 d-flex flex-row justify-content-around">
	 					<c:if test="${aula.numaula != null}">
	 						<c:if test="${aula.estado == false}">
	 							<a class="btn btn-success" href="aula?action=reservar&numaula=${aula.numaula}&idusuario=${user.idusuario}" role="button" onclick="return confirm('Se va a proceder a la reserva del aula. �Desea continuar?')">Reservar</a>
	 						</c:if>
	 					</c:if>
	 					<c:if test="${user.perfil.equals('administrador')}">
	 						<c:choose>
	 							<c:when test="${aula.numaula!=null}">
	 								<input type="submit" class="btn btn-primary" value="Modificar" />
	 								<a class="btn btn-danger" title="Eliminar" href="#" onclick="return confirm('Se va a proceder a la eliminaci�n del aula. �Desea continuar?')">Eliminar</a>
	 							</c:when>
	 							<c:otherwise>
	 								<input type="submit" class="btn btn-primary" value="Crear aula" />
	 							</c:otherwise>
	 						</c:choose>
	 					</c:if>
 					</div>
 					</form>
 					
 					<c:if test="${message != null}">
						<div class="alert alert-danger text-center" role="alert">
							${message}
						</div>
					</c:if>
					
 				</div>
 				
 				
 			</div>
					
	</main>
</body>
</html>