<%@page import="java.sql.Date"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.form-control {
	width: 50%;
}
body{
	margin-left: 20%;
}
</style>
</head>
<body>

<%
long millis=System.currentTimeMillis();   
Date date=new Date(millis); 
%>
<h4>Thêm sách</h4>

	<form method="post" action="ThemSachController" enctype="multipart/form-data">
		<div class="form-group row">
			<label for="example-text-input" class="col-2 col-form-label"> Mã Sách:</label><br>
			<div class="col-10">
				<input class="form-control" type="text" name="txtMaSach" >
			</div>
		</div>
		<div class="form-group row">
			<label for="example-search-input" class="col-2 col-form-label">Tên Sách:</label><br>
			<div class="col-10">
				<input class="form-control" type="text" name="txtTenSach">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-email-input" class="col-2 col-form-label">Tác Giả:</label><br>
			<div class="col-10">
				<input class="form-control" type="text" name="txtTacGia">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-url-input" class="col-2 col-form-label">Giá:</label>
			<div class="col-10">
				<input class="form-control" type="text" name="txtGia">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-tel-input" class="col-2 col-form-label">Số lượng:</label>
			<div class="col-10">
				<input class="form-control" type="text" name="txtSoLuong">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-password-input" class="col-2 col-form-label">Ngày Nhập:</label>
			<div class="col-10">
				<input class="form-control" type="date" value="<%=date %>" name="txtNgayNhap">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="example-number-input" class="col-2 col-form-label">Ảnh:</label>
			<div class="col-10">
				<input type="file" class="form-control" name="txtAnh" >
			</div>
		</div>
		<div class="form-group row">
			<label for="example-date-input" class="col-2 col-form-label">Số tập:</label>
			<div class="col-10">
				<input class="form-control" type="text" name="txtSoTap">
			</div>
		</div>
		 <div class="form-group row">
			<label for="example-text-input" class="col-2 col-form-label"> Loại Sách:</label><br>
			<div class="col-10">							
				<select class="form-control" name="txtMaLoai" >
				<% 
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
				for (loaibean ds : dsloai) {
				%>			
					<option value="<%=ds.getMaloai()%>"><%=ds.getTenloai() %></option>
				
				<%
					}
				%>
				</select>
			</div>
		</div> 
		<input type="submit" value="Add">
	</form><br>
	<form action="AdminQlSach" method="post">
		<input type="submit" value="Hủy">
	</form>

</body>
</html>