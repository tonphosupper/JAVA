<%@page import="bo.loaibo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
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

<%String masach = request.getParameter("masach");
String tensach = request.getParameter("tensach"); 
String soluong = request.getParameter("soluong");
String gia = request.getParameter("gia");
String sotap = request.getParameter("sotap");
String tacgia = request.getParameter("tacgia");
String anh = request.getParameter("anh");
String ngaynhap = request.getParameter("ngaynhap");
%>
<h4>Sửa sách</h4>

	<form method="post" action="SuaSachController?ms=<%=masach%>&anh=<%=anh%>" enctype="multipart/form-data">
		<div class="form-group row">
			<label for="example-text-input" class="col-2 col-form-label"> Mã Sách:</label><br>
			<div class="col-10">
				<input class="form-control" type="text" name="txtMaSach" value="<%=masach %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-search-input" class="col-2 col-form-label">Tên Sách:</label><br>
			<div class="col-10">
				<input class="form-control" type="text" name="txtTenSach" value="<%=tensach %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-email-input" class="col-2 col-form-label">Tác Giả:</label><br>
			<div class="col-10">
				<input class="form-control" type="text" name="txtTacGia" value="<%=tacgia %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-url-input" class="col-2 col-form-label">Giá:</label>
			<div class="col-10">
				<input class="form-control" type="text" name="txtGia" value="<%=gia %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-tel-input" class="col-2 col-form-label">Số lượng:</label>
			<div class="col-10">
				<input class="form-control" type="text" name="txtSoLuong" value="<%=soluong %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-password-input" class="col-2 col-form-label">Ngày Nhập:</label>
			<div class="col-10">
				<input class="form-control" type="date" name="txtNgayNhap" value="<%=ngaynhap %>">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="example-number-input" class="col-2 col-form-label">Ảnh:</label>
			<div class="col-10">
				<input type="file" class="form-control" name="txtAnh" value="<%=anh %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-date-input" class="col-2 col-form-label">Số tập:</label>
			<div class="col-10">
				<input class="form-control" type="text" name="txtSoTap" value="<%=sotap %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="example-text-input" class="col-2 col-form-label"> Loại Sách:</label><br>
			<div class="col-10">							
				<select class="form-control" name="txtMaLoai" >
				<% 
				 /* ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
				for (loaibean ds : dsloai) {  */
					loaibo lbo = new loaibo();
					ArrayList<loaibean> dsl = lbo.getloai();
					int n = dsl.size();
					for (int i = 0; i < n; i++) { 
				%>	
					<%-- <option value="<%=ds.getMaloai()%>"><%=ds.getTenloai() %></option>  --%>
					<option value="<%=dsl.get(i).getMaloai()%>"> <%=dsl.get(i).getMaloai()%></option>
				<%
					}
				%>
				</select>
			</div>
		</div> 
		<input type="submit" value="Sửa">
		</form><br>
	<form action="AdminQlSach" method="post">
		<input type="submit" value="Hủy">
	</form>
</body>
</html>