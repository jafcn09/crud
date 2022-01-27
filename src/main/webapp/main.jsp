<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList"%>
 <%@ page import="model.Aula" %><br>
 <%@ page import="java.util.List" %><br>
  <%@ page import="dao.AulaDAO" %><br>
  <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	
	<main class="p-4 d-flex flex-column">
	<div class="container buscar">
			<form class="form-inline" method="post" action="aula">
				<input type="text" class="form-control" id="query" name="query" placeholder="Buscar aula" />
				<input type="hidden" name="action" value="listar" /> 				
				<button type="submit" class="btn btn-info">Buscar</button>
			</form>
			<%
			AulaDAO a = new AulaDAO();
			List<Aula> lista;
			String nombre  = request.getParameter("query");
			if(nombre !=null){
				a.getAulas("select * from aula where nombre LIKE" + "'%"+ nombre +"%'");
		
			}else{
				System.err.println("Error al buscar la aula");
			}
			%>
			</div>
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>Num. Aula</th>
						<th>Capacidad</th>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Estado</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${aulas}" var="aula">
					<tr>
						<td>${aula.numaula}</td>
						<td>${aula.capacidad}</td>
						<td>${aula.nombre}</td>
						<td>${aula.descripcion}</td>
						<td>
							
						</td>
						<td>
						
						<a class="btn btn-primary" href="aula?action=ver&numaula=${aula.numaula}
						" role="button">Ver detalles</a></td>
				
						
						<td>
							<c:if test="${aula.estado == false }">
								<a class="btn btn-success" href="aula?action=reservar&numaula=${aula.numaula}&idusuario=${user.idusuario}" role="button" onclick="return confirm('Se va a proceder a la reserva del aula. ¿Desea continuar?')">Reservar</a>
							</c:if>
						</td>
						<td>
							<c:if test="${user.perfil.equals('administrador')}">
								<a class="btn btn-danger" href="aula?action=eliminar&numaula=${aula.numaula}" role="button" onclick="return confirm('Se va a proceder a la eliminación del aula. ¿Desea continuar?')">Eliminar</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				
				<tbody>
					
				</tbody>
			</table>
		</main>

</body>
</html>