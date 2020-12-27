<%@page import="bean.giohangbean"%>
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
<link href="./css/responsive.css" rel="stylesheet" type="text/css"/>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>

<body>
<div class="header">
	<div class="text-center">
		<h1>Book Store</h1>
	</div>
	
		<div class="menu">
			<nav
				class="navbar navbar-expand-sm navbar-dark justify-content-between">
				<ul class="navbar-nav">
				<%
		String username = (String) session.getAttribute("tendangnhap");
				if(username !=null){
				%>
					<li class="nav-item"><a class="nav-link"
						href="SachControllerLogin">Quay Lại</a></li>
				<%}else{ %>
					<li class="nav-item"><a class="nav-link"
							href="SachController">Quay Lại</a></li>
				<% }%>
				</ul>
			</nav>
		</div>
</div>
<div class="container">
		<h5>Giỏ hàng</h5>
		<table class="table table-hover table-border">
			<tr align="left">
				<td></td>
				<td>ID</td>
				<td>Tên sách</td>
				<td>Số lượng</td>
				<td>Giá</td>
				<td>Thành tiền</td>
			</tr>

			<%
				giohangbo gh = (giohangbo) session.getAttribute("gh");
			if (gh != null) {
				for (giohangbean g : gh.ds) {
			%>


			<tr>
				<td><img width="80px" src="<%=g.getAnh()%>"></td>
				<td><%=g.getMasach()%></td>
				<td><%=g.getTensach()%></td>
				<td><%=g.getSoluong()%>
					<form action="sua.jsp?ms=<%=g.getMasach()%>" method="post">
						<input type="number" value="0" name="txtsl"> <br> 
						<input type="submit" name="but1" value="update">
					</form></td>
				<td><%=g.getGia()%> VND</td>
				<td><%=g.getThanhtien()%> VND</td>
				<td><a href="xoa.jsp?ms=<%=g.getMasach()%>">Delete</a></td>
			</tr>
			<%
				}
			}
			%>
		</table>
		<%if (gh!=null){ %>
		<div align="right"><h5>Tổng: <%=gh.Tong() %> VND</h5></div>
		<%} %>
		</div>
</body>
</html>