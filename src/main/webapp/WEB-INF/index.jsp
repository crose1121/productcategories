<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Categories</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        <h1 class="text-secondary">Welcome, Friend.</h1>
        <h6 class="text-secondary m-3">Here are all the products.</h6>
			<div>
				<table class="table table-secondary container">
					<thead>
						<tr>
							<th>Name</th>
							<th>Price</th>
							<th>Description</th>
							<th>Related Categories</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${allProducts}">
							<tr>
								<td ><a href="/products/${product.id}">${product.name}</a></td>
								<td>${product.price}</td>
								<td>${product.description}</td>
								<c:forEach var="category" items="${product.categories}">
								<td>${category.name}</td>
								</c:forEach>								
							<!-- <td>${dojo.ninjas.size()}</td> --> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
				<div>
		<form:form action="/categories/create" method="post" modelAttribute="category" style="width: 50%">
			<div class="form-group">
			<h4 class="text-secondary">Create a new product category</h4>
				<p>
					<form:label path="name">Category Name</form:label>
					<br /><form:errors path="name" class="text-danger"/>
					<form:input path="name" class="form-control"/>
				</p>
				<hr />
				
				<input type="submit" value="Submit" class="btn btn-info"/>				
			</div>
		</form:form>
	</div>
    </div> <!-- End of Container -->
</body>
</html>