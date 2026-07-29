<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>IMP Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<script type="text/javascript">

	function member_sign() {
		
		var userId = document.getElementById('userId').value.trim();
		var userPw = document.getElementById('userPw').value.trim();
		
		if(userId == '' || userPw == '')
			alert("ID/PW 입력해주세요.");
			event.preventDefault();
			return false;
		else
		{
			//1. 데이터 유무 확인
			alert("데이터 유무 확인 부분");
			//2. 멤버 코드를 보내고  buyer 부분 seller 부분 연결하기
			
			return true;
		}
			
		
	}
</script>
</head>
<body>

  <form class="login-card" action="${pageContext.request.contextPath}/login" method="post" onsubmit="return member_sign(event);">

    <div class="logo-wrap">
      <span class="logo-text">IMP</span>
      <svg class="sparkle lg" viewBox="0 0 24 24"><path d="M12 1 L14 9 L22 11 L14 13 L12 22 L10 13 L2 11 L10 9 Z" fill="var(--accent-lime)"/></svg>
      <svg class="sparkle sm" viewBox="0 0 24 24"><path d="M12 1 L14 9 L22 11 L14 13 L12 22 L10 13 L2 11 L10 9 Z" fill="var(--accent-lavender)"/></svg>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">ID:</div>
        <input class="field-input" type="text" name="userId" id ="userId" placeholder="아이디를 입력하세요" />
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">PW:</div>
        <input class="field-input" type="password" name="userPw" id="userPw"  placeholder="비밀번호를 입력하세요" />
      </div>
    </div>

    <div class="star-row">
      <button type="submit" class="star-btn signin" aria-label="Sign In" onclick="member_sign()">
        <svg viewBox="0 0 76 96" preserveAspectRatio="none"><path d="M38 2 C40 34 42 46 74 48 C42 50 40 62 38 94 C36 62 34 50 2 48 C34 46 36 34 38 2 Z"/></svg>
        <span class="star-label">Login</span>
      </button>

      <button type="button" class="star-btn forgot" aria-label="Forgot ID" onclick="location.href='${pageContext.request.contextPath}/forgotId'">
        <svg viewBox="0 0 76 96" preserveAspectRatio="none"><path d="M38 2 C40 34 42 46 74 48 C42 50 40 62 38 94 C36 62 34 50 2 48 C34 46 36 34 38 2 Z"/></svg>
        <span class="star-label">Forgot<br>ID</span>
      </button>

      <button type="button" class="star-btn forgot" aria-label="Forgot PW" onclick="location.href='${pageContext.request.contextPath}/forgotPw'">
        <svg viewBox="0 0 76 96" preserveAspectRatio="none"><path d="M38 2 C40 34 42 46 74 48 C42 50 40 62 38 94 C36 62 34 50 2 48 C34 46 36 34 38 2 Z"/></svg>
        <span class="star-label">Forgot<br>PW</span>
      </button>

      <button type="button" class="star-btn signup" aria-label="Sign Up" onclick="location.href='${pageContext.request.contextPath}/signup'">
        <svg viewBox="0 0 76 96" preserveAspectRatio="none"><path d="M38 2 C40 34 42 46 74 48 C42 50 40 62 38 94 C36 62 34 50 2 48 C34 46 36 34 38 2 Z"/></svg>
        <span class="star-label">Sign<br>Up</span>
      </button>
    </div>

  </form>

</body>
</html>