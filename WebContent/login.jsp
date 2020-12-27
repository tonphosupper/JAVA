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
					<li><a class="nav-link" href="giohangcontroller">Giỏ hàng</a></li>
					<%
						giohangbo gh = (giohangbo) session.getAttribute("gh");
					if (gh == null) {
					%>
					<div></div>
					<%
						}
					if (gh != null) {
					%>
					<div>
						<%=gh.ds.size()%>
					</div>
					<%
						}
					%>
					<li><a class="nav-link" href="Lichsu.jsp">Lịch sử mua hàng</a></li>
				</ul>
				<form class="form-inline m-auto" action="SachController"
					method="post">
					<input class="form-control mr-sm-2" type="search"
						placeholder="nhập từ khóa ..." name="txttk" />
					<button class="btn btn-outline-danger" type="submit">
						Search</button>
				</form>
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
	<div class="container">
		<!-- Loai sach -->
		<div class="row">

			<%
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
			%>
			<div class="col-3">
				<div align="center" class="navbar bg-light">
					<p>LOẠI SÁCH :</p>
				</div>

				<%
					for (loaibean ds : dsloai) {
				%>
				<div class="list-group-item list-group-item-warning">
					<a href="SachControllerLogin?maloai=<%=ds.getMaloai()%>"
						class="list-group-item list-group-item-action list-group-item-light">
						<%=ds.getTenloai()%>
					</a>
				</div>
				<%
					}
				%>
			</div>
			<!-- Content -->
			<div class="col-9">
				<%
					ArrayList<sachbean> dssach = (ArrayList<sachbean>) request.getAttribute("dssach");
				%>
				<div class=container-card>

					<%
						for (sachbean ss : dssach) {
					%>
					<div class="card">
						<img class="card-img-top" alt="" src="<%=ss.getAnh()%>">
						<div class="card-body">
							<h6 class="card-title"><%=ss.getTensach()%></h6>
							<p class="card-text"><%=ss.getTacgia()%></p>
							<p class="card-text">
								Giá:<%=ss.getGia()%>
								VND
							</p>
							<a
								href="datmuacontroller?anh=<%=ss.getAnh()%>&ms=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&gia=<%=ss.getGia()%>">
								<img width="120px" alt="" src="buybutton.png">
							</a>
						</div>
					</div>
					<%
						}
					%>

				</div>

			</div>

		</div>

	</div>

</body>
</html>