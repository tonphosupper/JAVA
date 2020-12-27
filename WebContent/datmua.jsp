<%@page import="bo.giohangbo"%>
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
	String anh=request.getParameter("anh");
	String ms=request.getParameter("ms");
	String ts=request.getParameter("ts");
	String giatam=request.getParameter("gia");
	if(ms!=null){
		giohangbo gh;
		if(session.getAttribute("gh")==null){ //mua lan dau
			gh=new giohangbo(); //
			session.setAttribute("gh",gh );
		}
		gh=(giohangbo)session.getAttribute("gh");
		gh.Themm(anh,ms, ts, Long.parseLong(giatam), 1);
		session.setAttribute("gh", gh);
		response.sendRedirect("htgio.jsp");
		
	}
		
	%>
</body>
</html>