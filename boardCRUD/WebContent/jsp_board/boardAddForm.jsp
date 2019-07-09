<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<title>BOARD ADD</title>
</head>
<body>
	<div class="container">
		<br>
		<h1 class="text-center">BOARD ADD</h1>
		<br>

		<form
			action="<%=request.getContextPath()%>/jsp_board/boardAddAction.jsp"
			method="post" class="needs-validation">
			<div class="form-group">
				<label for="boardPw"> Board PW :</label> <input type="password"
					class="form-control" id="boardPw" placeholder="Enter Board PW"
					name="boardPw" required>
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Please fill out this field</div>
				
				<br> 
				
				<label for="boardTitle"> Board Title :</label> <input
					type="text" class="form-control" id="boardTitle"
					placeholder="Enter Board Title" name="boardTitle" required>
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Please fill out this field</div>
				
				<br> 
				
				<label for="boardUser"> Board Name :</label> <input
					type="text" class="form-control" id="boardUser"
					placeholder="Enter Board Name" name="boardUser" required>
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Please fill out this field</div>
				
				<br> 
				
				<label for="boardContent"> Board Content :</label>
				<textarea class="form-control" id="boardContent"
					placeholder="Enter Board Content" name="boardContent" required></textarea>
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Please fill out this field</div>

				<br>
				
				<div class = "text-right">
					<input type="reset" value="초기화" class="btn btn-outline-primary"/>
					<input type="submit" value="글입력" class="btn btn-outline-primary"/> 
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	if(boardPw.length)
</script>
</html>

