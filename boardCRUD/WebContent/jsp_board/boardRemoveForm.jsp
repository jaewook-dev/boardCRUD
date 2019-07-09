<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<title>BOARD REMOVE FORM</title>
</head>
<body>
	<div class = "container">
	<br>
		<h1 class="text-center"> BOARD DELETE </h1>
	<br>
	<div class = "text-right">
			<a href="<%=request.getContextPath()%>/jsp_board/boardView.jsp?boardNo=<%= request.getParameter("boardNo") %>" class="btn btn-outline-primary"> 돌아가기 </a>
	</div>
<%
    // boardNo값이 넘어오지 않으면 boardList.jsp로 이동
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
%>
        <form action="<%=request.getContextPath()%>/jsp_board/boardRemoveAction.jsp" method="post" class="needs-validation">
            <!-- boardPw와 함께 boardNo값도 숨겨서(hidden값으로) 넘김 -->
            <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
            <div class="form-group">
				<label for="boardPw"> 비밀번호 확인 :</label> <input type="password"
					class="form-control" id="boardPw" placeholder="Enter Board PW"
					name="boardPw" required>
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Please fill out this field</div>
			</div>
            <div class = "">
                <input type="submit" value="삭제" class="btn btn-outline-primary"/>
                <input type="reset" value="초기화" class="btn btn-outline-primary"/>
            </div>
        </form>
<%    
    }
%>
	</div>
</body>
</html>

