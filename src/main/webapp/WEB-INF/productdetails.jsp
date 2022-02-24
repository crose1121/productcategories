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
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">
<title>Product Details</title>
</head>
<body>
	<div class="container text-secondary">
		<h1 class="text-secondary">${product.name}</h1>
		<h5>Price: $${product.price}</h5>
		
		<h5>Related Categories</h5>
		<table class="table table-secondary container">
					<thead>
						<tr>
							<th>Category Name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${product.categories}">
							<tr>
								<td>${category.name}</td>
							</tr>
						</c:forEach>								
					</tbody>
				</table>
		<br />
		<h3>Add this product to a category</h3>
		<form action="/addProductToCategory/${product.id}" method="post">
			<select name="selectedCategory" id="">
				<c:forEach items='${categories}' var='category'>
				<option value="${category.id}">${category.name}</option>
				</c:forEach>
			</select>
			<input type="submit" value="submit"/>
		</form>
	</div>
</body>
</html>