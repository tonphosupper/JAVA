<%@page import="bean.KHbean"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.nav-qlsach{
margin-left: 10%;
margin-right: 10%;
}
.nav-qlsach h4{
text-align: center;
}
.nav-qlsach a{
text-align: right;
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
	
	<div class="nav-qlsach">
	<h4>Quản lý Khách Hàng</h4>
	<a class="nav-link" href="AdminController">Quay Lại</a>
	<!-- <a class="nav-link" href="giaodiencontroller">Thêm Sách</a> -->
	<table class="table table-hover table-border">
			<tr align="left">
				<td>Mã KH</td>
				<td>Họ tên</td>
				<td>Địa Chỉ</td>
				<td>Số ĐT</td>
				<td>Email</td>
				<td>Tên đăng nhập</td>
				<td>Mật khẩu</td>
				
			</tr>

			<%
				ArrayList<KHbean> lsach =(ArrayList<KHbean>)request.getAttribute("list");
				for(KHbean g: lsach){
			%>


			<tr>
				<td><%=g.getMakh()%></td>
				<td><%=g.getHoten()%></td>
				<td><%=g.getDiachi()%></td>
				<td><%=g.getSodt()%></td>
				<td><%=g.getEmail() %></td>
				<td><%=g.getTendn()%></td>
				<td><%=g.getPass()%></td>

				<%-- <td><a href="suaSach.jsp?masach=<%=g.getMasach()%>
						&tensach=<%=g.getTensach()%>
						&soluong=<%=g.getSoluong()%>
						&gia=<%=g.getGia()%>
						&maloai=<%=g.getMaloai()%>
						&sotap=<%=g.getSotap()%>
						&tacgia=<%=g.getTacgia()%>
						&anh=<%=g.getAnh()%>
						&ngaynhap=<%=g.getNgaynhap()%>
						">Sửa</a></td> --%>
				<td><a href="XoaKHController?maKH=<%=g.getMakh()%>">Xóa</a></td>
			</tr>
			<%
				}
			
			%>
		</table>
	</div>
	
</body>
</html>