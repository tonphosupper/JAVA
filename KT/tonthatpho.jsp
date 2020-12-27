<%-- <%@page import="phodao.phoclassdao"%>
<%@page import="phobean.phoclassbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<style type="text/css">
body
</style>
<title>Insert title here</title>
</head>
<body>
	<h2>Nhập tiêu đề hoặc nội dung:</h2>
	<form class="form-inline m-auto" action="phoservlet" method="post">
		<input class="form-control mr-sm-2" type="search"
			placeholder="nhập từ khóa ..." name="txttin" />
		<button class="btn btn-outline-danger" type="submit">Search</button>
	</form>


	<%
		ArrayList<phoclassbean> dstin = (ArrayList<phoclassbean>) request.getAttribute("dstin");
	if (dstin != null) {
		for (phoclassbean d : dstin) {
	%>
	<h4>tiêu đề: <%=d.getTieude()%></h4>

		Mã tin:<%=d.getMatin()%><br>
		Ngày đưa tin:<%=d.getNgayduatin()%><br>
		Nội dung tin:<%=d.getNoidungtin()%><br>

		Tóm tắt:<%=d.getTomtat()%>
	<%
		}

	} else {
	%>
	loi
	<%
		}
	%>

</body>
</html> --%>