<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"> 
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">Aulas USIL</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Mis reservas</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Mi perfil</a></li>
			<c:if test="${user.perfil.equals('administrador')}">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						Administración
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Crear aula</a>
						<a class="dropdown-item" href="#">Crear usuario</a>
					</div>
				</li>
					<li class="nav-item"><a class="nav-link" href="reserva.jsp">Mi Reservas</a></li>
			</c:if>
		</ul>
		
		<ul class="navbar-nav ml-auto">
		
			<li class="nav-item"><a type="submit" class="nav-link" href="index.jsp"><i class="fa fa-sign-out"></i>Log out</a>
		</ul>
	</nav>
</body>
</html>