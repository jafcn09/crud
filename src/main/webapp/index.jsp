 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	 <!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<main class="p-4 d-flex flex-column align-items-center">
		<div style="width: 40vw;">
			<img style="width: 40vw; height:20vw;" src="img/aula.jpg" alt="aula" />
		</div>
		<div class="card" style="width: 40vw;">
			<div class="card-body">
				<form method="post" class="pb-4" action="usuario">
					<h3 class="text-center">Iniciar sesión</h3>
					<label for="username">Nombre de usuario</label>
					<input type="text" class="form-control" id="username" name="username" placeholder="Usuario" required autofocus /><br>
					<label for="password">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="Password" required /><br>
					<input type="hidden" name="action" value="login" />
					<div class="p-4 d-flex flex-ro1 justify-content-around">
						<input type="submit" value="Login" class="btn btn-primary" />
					</div>
				</form>
				<c:if test="${message != null }">
					<div class="alert alert-danger text-center" role="alert">
						${message}
					</div>
				</c:if>
			</div>
		</div>
	</main> 
</body>
</html>