<%@page import="bo.giohangbo"%>
<%@page import="dao.History"%>
<%@page import="bean.viewbean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

</head>

<body>
	<div class="header">
		<%
			String username = (String) session.getAttribute("tendangnhap");
		if (session != null) {
		%>
		<div class="h6">
			<h5>
				Chào bạn:
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
					<li><a class="nav-link" href="SachControllerLogin">Trang
							chủ</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<br>
	<div class="container">
		<h4>Lịch sử mua hàng</h4>

		<table class="table table-hover table-border">
			<tr>
				<td>Mã KH</td>
				<td>Họ Tên</td>
				<td>Tên Sách</td>
				<td>Ngày Mua</td>
				<td>Số Lượng</td>
				<td>Giá</td>
				<td>Thành Tiền</td>
			</tr>

			<%
				//ArrayList<viewbean> list = (ArrayList<viewbean>) request.getAttribute("list");
			History vdao = new History();
			ArrayList<viewbean> list = vdao.getview();
			for (viewbean a : list) { 
			%>

			<tr>
				<td><%=a.getMakh()%></td>
				<td><%=a.getHoten()%></td>
				<td><%=a.getTensach()%></td>
				<td><%=a.getNgayMua()%></td>
				<td><%=a.getSoluong()%></td>
				<td><%=a.getGia()%>VNĐ</td>
				<td><%=a.getThanhtien()%>VNĐ</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>