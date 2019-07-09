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
<title>boardView</title>
</head>
<body>
	<div class ="container">
	<br>
	<h1 class = "text-center">BOARD VIEW</h1>
	<br>
	<div class = "text-right">
			<a href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?" class="btn btn-outline-primary"> 게시판 이동 </a>
	</div>
<%
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
        int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        System.out.println("boardNo :"+boardNo);
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
        String dbUser = "root";
        String dbPw = "java0000";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String sql = "SELECT board_title, board_content, board_user, board_date FROM board WHERE board_no=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
%>
				<div class="form-group">
					<label for="boardNo"> Board No :</label> 
					<input class="form-control" id="boardNo" name="boardNo" value = "<%=boardNo%>" required readonly>
					<br>
					
					<label for="boardTitle"> Board Title :</label> 
					<input type = "text" class="form-control" id="boardTitle" name="boardTitle" value="<%=resultSet.getString("board_title")%>" required readonly>
					<br>
   
   					<label for="boardContent"> Board Content :</label>
					<textarea class="form-control" id="boardContent" name="boardContent" required readonly><%=resultSet.getString("board_content")%></textarea>
					<br>
					
					<label for="boardUser"> Board User :</label> 
					<input type = "text" class="form-control" id="boardUser" name="boardUser" value="<%=resultSet.getString("board_user")%>" required readonly>
					<br>
					
					<label for="boardDate"> Board Date :</label> 
					<input type = "text" class="form-control" id="boardDate" name="boardDate" value="<%=resultSet.getString("board_date")%>" required readonly>
					<br>
					
					<div class = "text-right">
						<a href="<%=request.getContextPath()%>/jsp_board/boardModifyForm.jsp?boardNo=<%=boardNo%>" class="btn btn-outline-primary">수정</a>
                    	<a href="<%=request.getContextPath()%>/jsp_board/boardRemoveForm.jsp?boardNo=<%=boardNo%>" class="btn btn-outline-primary">삭제</a>
                	</div>
                </div>
<%          }
        } catch(Exception e) {
            e.printStackTrace();
            out.println("BOARD VIEW ERROR!");
        } finally {
            try {resultSet.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
    }
%>
	</div>
</body>
</html>

