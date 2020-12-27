<%@page import="bo.giohangbo"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Sofia">
<link rel="stylesheet" href="style.css" />
<link href="./css/responsive.css" rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
body{
background: white;
}
.nav-admin{
margin-left: 20%;
}
</style>
</head>

<body>
	<div class="header">
		<%
			String username = (String) session.getAttribute("tendangnhap");
		if (session != null) {
		%>
		<div class="h6">
			<h5>
				Chào Admin :
				<%=username%></h5>
		</div>
		<%
			} else {
		out.print("Chào khách");
		}
		%>




		<div class="text-center">
			<h1>Book Store</h1>
		</div>
		<div class="menu">
			<nav
				class="navbar navbar-expand-sm navbar-dark justify-content-between">
				<ul class="navbar-nav">
					<li><a class="nav-link" href="AdminController">Trang
							chủ</a></li>
					
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="btn btn-outline-warning">
							<a href="logoutcontroller">Đăng xuất</a>
						</div>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="nav-admin">	
	<a class="nav-link" href="AdminQlSach">Quản Lý Sách</a>
	<a class="nav-link" href="KhachHangController">Quản Lý Khách Hàng</a>
	</div>
</body>
</html>