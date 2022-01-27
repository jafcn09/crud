<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
     <%@ page import="model.Aula" %><br>

  <%@ page import="dao.AulaDAO" %><br>
  <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<body>
<main class="p-4 d-flex flex-column align-items-center"> 
<h1 class="mt-3">Lista de Reserva</h1> <table class="table-bordered table-hover"> 
	
<table class="table">
  <thead>
    <tr>
    
      <th scope="col">IdResva</th>
      <th scope="col">Nombre Usuario</th>
      <th scope="col">Email</th>
       <th scope="col">Nombre De La Reserva</th>
      <th scope="col">Numero Del Aula</th>
        <th scope="col">Nombre Del Aula</th>
         <th scope="col"></th>
       
    </tr>
    
  </thead>
  <c:forEach items="${aulas}" var="aula">
  
					<tr>
					 <td>${reserva.idreserva}</td>
                        <td>${usuario.nombre}</td>
                         <td>${usuario.email}</td>
                        <td>${reserva.nombre}</td>
						<td>${aula.numaula}</td>
						<td>${aula.nombre}</td>
						<td>
						<c:if test="${aula.estado == false }">
								<a class="btn btn-success" href="aula?action=reservar&numaula=${aula.numaula}&estado=${aula.estado}" role="button" onclick="return confirm('Se va a proceder a liberar, ¿Desea Continuar?')">Liberar</a>
							</c:if>
						<td>
						
						<td>
						</c:forEach>
 </main>
</body>
</html>