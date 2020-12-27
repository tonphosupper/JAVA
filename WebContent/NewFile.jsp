<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Thêm Ủng Hộ</h2>
	<form action="UngHocontroller" method="post">
		<label>MaDotUngHo:</label>
		<input type="text" name="txtmaDUH"><br>
		<label>MaDVUH:</label>
		<input type="text" name="txtmaDVUH"><br>
		<label>NgayUngHo:</label>
		<input type="date" name="txtngayUH"><br>
		<label>HinhThucUngHo:</label>
		<input type="text" name="txthinhThucUH"><br>
		<label>SoLuongUngHo:</label>
		<input type="text" name="txtsoLuongUH"><br>
		<label>DonViTinh:</label>
		<input type="text" name="txtdonVT"><br>
		<input type="submit" value="Thêm">
		
	</form>
</body>
</html>