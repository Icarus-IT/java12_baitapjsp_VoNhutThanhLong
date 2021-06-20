<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<form action="ProductServlet" method="POST" class="form-border m-4 p-4">
		<h1>Quản Lý Sản Phẩm</h1>
		<p>Tên sản phẩm:</p>
		<input type="text" name="txtName" value="" />
		<p>Số lượng:</p>
		<input type="number" name="txtQuantity" value="" />
		<p>Giá bán:</p>
		<input type="number" step="0.01" name="txtPrice" value="" /> </br> </br> <input
			class="btn btn-primary text-white" type="submit" value="Lưu lại"
			name="btnAction" />
		<c:if test="${requestScope.SUCCESS ne null }">

			<font color="green"> ${requestScope.SUCCESS} </font>
		</c:if>
		<c:if test="${requestScope.FAIL ne null }">

			<font color="red"> ${requestScope.FAIL} </font>
		</c:if>
	</form>
	</br>

	<c:set var="result" value="${sessionScope.PRODUCTLIST}" />
	<c:if test="${not empty result}">
		<table border="1" width="100%" class="table table-bordered m-4 p-4">
			<thead class="text-primary">
				<tr>
					<th>STT</th>
					<th>Tên sản phẩm</th>
					<th>Số lượng</th>
					<th>Giá bán</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" varStatus="counter" items="${result}">
					<form action="Update">
						<tr>
							<td>${counter.count}</td>
							<td>${dto.getName()}</td>
							<td>${dto.getQuantity()}</td>
							<td>${dto.getPrice()}</td>
						</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>