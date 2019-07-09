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
			<a href="<%=request.getContextPath()%>/jsp_board/boardView.jsp?boardNo=<%= request.getParameter("boardNo") %>" class="btn btn-outline-primary"> ���ư��� </a>
	</div>
<%
    // boardNo���� �Ѿ���� ������ boardList.jsp�� �̵�
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
%>
        <form action="<%=request.getContextPath()%>/jsp_board/boardRemoveAction.jsp" method="post" class="needs-validation">
            <!-- boardPw�� �Բ� boardNo���� ���ܼ�(hidden������) �ѱ� -->
            <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
            <div class="form-group">
				<label for="boardPw"> ��й�ȣ Ȯ�� :</label> <input type="password"
					class="form-control" id="boardPw" placeholder="Enter Board PW"
					name="boardPw" required>
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Please fill out this field</div>
			</div>
            <div class = "">
                <input type="submit" value="����" class="btn btn-outline-primary"/>
                <input type="reset" value="�ʱ�ȭ" class="btn btn-outline-primary"/>
            </div>
        </form>
<%    
    }
%>
	</div>
</body>
</html>

