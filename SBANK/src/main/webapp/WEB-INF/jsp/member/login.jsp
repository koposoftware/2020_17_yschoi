<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function checkForm() {
    let f = document.lform;

    if (isNull(f.id, '아이디를 입력해주세요'))
      return false;
    if (isNull(f.password, '비빌번호를 입력해주세요'))
      return false;

    /*
    if(f.id.value == ''){
    	alert('아이디를 입력해주세요');
    	f.id.focus();
    	return false;
    }
    if(f.password.value == ''){
    	alert('비밀번호를 입력해주세요');
    	f.password.focus();
    	return false;
    }
     */
    return true;
  }
</script>
</head>
<body>
		<section>
				<div align="center">
						<br>
						<hr>
						<h2>로그인!!</h2>
						<hr>
						<br>
						<!-- form은 이름으로 접근하기 위해서 js에서 name 속성 넣음 -->
						<form action="${pageContext.request.contextPath }/login" method="post" name="lform" onsubmit="return checkForm()">
								<table style="width: 40%">
										<tr>
												<th>ID</th>
												<td><input type="text" name="id"></td>
										</tr>
										<tr>
												<th>PASSWORD</th>
												<td><input type="password" name="password"></td>
										</tr>
								</table>
								<br>
								<button type="submit">로그인</button>
						</form>
				</div>
		</section>
</body>
</html>