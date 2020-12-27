<%@page import="bo.giohangbo"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
				giohangbo gh=(giohangbo)session.getAttribute("gh");
			if(gh!=null){
				gh.Xoa(request.getParameter("ms"));
				session.setAttribute("gh", gh);;
			
				response.sendRedirect("giohangcontroller");
			}
%>		


</body>
</html>