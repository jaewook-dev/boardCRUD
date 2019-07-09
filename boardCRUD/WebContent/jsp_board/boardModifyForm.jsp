<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>BOARD MODIFY FORM</title>
</head>
<body>
	<div class = "container">
	<br>
	<h1 class = "text-center">BOARD MODIFY</h1>
	<br>
	<div class = "text-right">
			<a href="<%=request.getContextPath()%>/jsp_board/boardView.jsp?boardNo=<%= request.getParameter("boardNo") %>" class="btn btn-outline-primary"> 돌아가기 </a>
	</div>
<%
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
    } else {
        int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        System.out.println("boardModify param boardNo:"+boardNo);
        String boardTitle = "";
        String boardContent = "";
        
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
        String dbUser = "root";
        String dbPw = "java0000";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String selectSql = "SELECT board_title, board_content FROM board WHERE board_no=?";
            statement = connection.prepareStatement(selectSql);
            statement.setInt(1, boardNo);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
                boardTitle = resultSet.getString("board_title");
                boardContent = resultSet.getString("board_content");
            } else {
                response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("BOARD MODIFY FROM ERROR!");
        } finally {
            try {resultSet.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
%>    
        <form action="<%=request.getContextPath()%>/jsp_board/boardModifyAction.jsp" method="post">
        	<div class="form-group">
				<label for="boardNo"> Board No :</label> 
				<input type = "text" class="form-control" id="boardNo" name="boardNo" value = "<%=boardNo%>" readonly="readonly" required>
				<br>
				
				<label for="boardPw"> Board PW :</label> 
				<input type = "password" class="form-control" id="boardPw" name="boardPw" required>
				<br>
				
				<label for="boardTitle"> Board Title :</label> 
				<input type = "text" class="form-control" id="boardTitle" name="boardTitle" value="<%=boardTitle%>" required>
				<br>
				
				<label for="boardContent"> Board Content :</label>
				<textarea class="form-control" id="boardContent" name="boardContent" required><%=boardContent%></textarea>
				<br>
				
				<div class = "text-right">
					<input type="reset" value="초기화" class="btn btn-outline-primary"/>
					<input type="submit" value="글수정" class="btn btn-outline-primary"/> 
				</div>
            </div>
        </form>
<%
    }    
%>
	</div>
</body>
</html>

