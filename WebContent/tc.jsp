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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<title>bookstore</title>

<style>
</style>
</head>

<body>

	<div class="header ">
		<div class="text-center">
			<h1>Book Store</h1>
		</div>
		<div class=menu>
			<div class="nav-menu">
				<nav
					class="navbar navbar-expand-sm navbar-dark justify-content-between">
					<ul class="navbar-nav">
						<li><a class="nav-link" href="SachController">Trang chủ</a></li>
						<li><a class="nav-link" href="giohangcontroller">Giỏ hàng</a></li>
						<%
							giohangbo gh = (giohangbo) session.getAttribute("gh");
						if (gh != null) {
						%>
						<div>
							<%=gh.ds.size()%>
						</div>
						<%
							}
						%>
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
							<button type="button" class="btn btn-outline-warning"
								data-toggle="modal" data-target="#myModal">Đăng Nhập</button>
						</li>
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<form class="form-login" action="logincontroller" method="post">
										<h4 class="text-center text-info">Đăng Nhập</h4>
										<div class="form-group">
											<label for="username" class="text-info">Username:</label><br>
											<input type="text" name="txtusername" class="form-control">
										</div>
										<div class="form-group">
											<label for="password" class="text-info">Password:</label><br>
											<input type="password" name="txtpassword"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="remember-me" class="text-info"><span>Remember
													me</span> <span><input id="remember-me" name="remember-me"
													type="checkbox"></span></label><br> <input type="submit"
												name="submit" class="btn btn-info btn-md" value="submit">
										</div>
									</form>
								</div>
							</div>
						</div>

						<li class="nav-item">
							<button type="button" class="btn btn-outline-warning"
								data-toggle="modal" data-target="#dangKy">Đăng Ký</button>
						</li>
						<div class="modal fade" id="dangKy" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<h4>Thông tin đăng ký khách hàng</h4>
									<form action="dangkycontroller" method="post"
										class="form-logout">
										<div align="left" class="form-text">
											<input type="text" placeholder="Nhập họ tên" name="txthoten">
										</div>
										<div align="left" class="form-text">
											<input type="text" placeholder="Nhập địa chỉ"
												name="txtdiachi">
										</div>
										<div align="left" class="form-text">
											<input type="text" placeholder="Số điện thoại" name="txtsdt">
										</div>
										<div align="left" class="form-text">
											<input type="text" placeholder="Email" name="txtemail">
										</div>
										<div align="left" class="form-text">
											<input type="text" placeholder="Nhập username"
												name="txttendn">
										</div>
										<div align="left" class="form-text">
											<input type="password" placeholder="Nhập mật khẩu"
												name="txtpass">
										</div>



										<input type="submit" name="smdk" class="btn btn-info btn-md"
											value="Đăng ký">
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Cancel</button>
										</div>

									</form>
								</div>
							</div>
						</div>
					</ul>
				</nav>
			</div>

		</div>
		<nav class="nav-btn">
		<nav class="navbar-dark">
		<button class="navbar-toggler custom-toggler" type="button"
			data-toggle="collapse" data-target="#collapsingNavbar4">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="collapsingNavbar4">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="SachController">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link"
					href="giohangcontroller">Giỏ hàng</a></li>
				<li class="nav-item">
					<button type="button" class="btn btn-outline-warning"
						data-toggle="modal" data-target="#myModal">Đăng Nhập</button>
				</li>
				<li class="nav-item">
					<button type="button" class="btn btn-outline-warning"
						data-toggle="modal" data-target="#dangKy">Đăng Ký</button>
				</li>

			</ul>
		</div>
		</nav>
	</nav>
	</div>
	
	
	<br>
	<div class="container">
		<!-- Loai sach -->

		<div class="row">
			<%
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
			%>
			<div class="col-3">
				<nav class="navbar navbar-light bg-light">
					<p>LOẠI SÁCH :</p>
				</nav>
				<%
					for (loaibean ds : dsloai) {
				%>
				<div class="list-group-item list-group-item-warning">
					<a href="SachController?maloai=<%=ds.getMaloai()%>"
						class="list-group-item list-group-item-action"> <%=ds.getTenloai()%>
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
							<h6 class="card-text-1"><%=ss.getTensach()%></h6>
							<p class="card-text-2"><%=ss.getTacgia()%></p>
							<p class="card-text-3">
								Giá:<%=ss.getGia()%>
								VND
							</p>
							<a class="card-text-img"
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