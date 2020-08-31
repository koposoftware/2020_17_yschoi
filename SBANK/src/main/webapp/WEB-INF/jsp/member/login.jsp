<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "https://developers.kakao.com/sdk/js/kakao.min.js" >  </script>
<script type = "text/javascript">
document.addEventListener("DOMContentLoaded", function () {
  // @details 카카오톡 Developer API 사이트에서 발급받은 JavaScript Key
  Kakao.init("2feb1780fc7fae4541a6d09f54380744");
  // @breif 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
      container: "#kakao-login-btn",
      success: function (authObj) {
          // console.log( authObj );
          Kakao.API.request({
              url: "/v2/user/me",
              success: function (res) {
                  // console.log( res );
                  // @breif 아이디
                  //document.getElementById("kakaoIdentity").innerHTML = res.id;

                  // @breif 닉네임
                  //document.getElementById("kakaoNickName").innerHTML = res.properties.nickname;
                  var url = '${pageContext.request.contextPath }/kakaologin/';
                  //alert(res.properties.nickname);
                  url += res.properties.nickname;
                location.href = url;
              },
              fail: function (error) {
                  alert(JSON
                      .stringify(error));
              }
          });
      },
      fail: function (error) {
          alert(JSON.stringify(error));
      }
  });
});

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
						<br><br>
						<a id="kakao-login-btn"></a><br>
				</div>
		</section>
</body>
</html>