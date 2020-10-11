<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script type = "text/javascript" src = "https://developers.kakao.com/sdk/js/kakao.min.js" >  </script>
<script type = "text/javascript">
document.addEventListener("DOMContentLoaded", function () {
  // @details 카카오톡 DeveloperAPI 사이트에서 발급받은 JavaScript Key
  Kakao.init("2feb1780fc7fae4541a6d09f54380744"); //#$#$#$키 넣자 -1
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">






<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>로그인</h3>
        </header>
      </div>
    </div>
        <div align="center">
            <!-- form은 이름으로 접근하기 위해서 js에서 name 속성 넣음 -->
            <form action="${pageContext.request.contextPath }/login" method="post" name="lform" onsubmit="return checkForm()">
                <table style="width: 50%" class="">
                    <tr>
                        <th>ID</th>
                        <td><input type="text" autocomplete=off name="id" class="form-control" aria-describedby="inputGroupSuccess1Status"></td>
                    </tr>
                    <tr>
                        <th><br>PASSWORD</th>
                        <td><br><input type="password" name="password" class="form-control" aria-describedby="inputGroupSuccess1Status"></td> 
                    </tr>
                </table>
                <br>
                <button type="submit" class="btn btn-outline-dark">로그인</button>
            </form>
            <br><br>
            <a id="kakao-login-btn"></a><br>
        </div>

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>
