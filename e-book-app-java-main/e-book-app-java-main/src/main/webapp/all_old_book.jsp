<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<h3 class="text-center text-primary">Old Books</h3>
	<div class="container-fluid">
		<div class="row p-3">
			<% 
        BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list3 = dao3.getAllOldBook();
        for (BookDtls b : list3) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumbnail">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%></p>
                     <p>Categories:<%=b.getBookCategory()%></p>
                    <div class="row">
                        <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa fa-inr" aria-hidden="true"></i></a>
                    </div>
                   
                </div>
            </div>
        </div>
        <%
        }
        %>
		</div>
	</div>
</body>
</html>