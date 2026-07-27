<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>IMP Sign Up</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

  <form class="signup-card" action="${pageContext.request.contextPath}/signup" method="post">

    <div class="title-wrap">
      <span class="title-text">Sign Up</span>
		<svg class="sparkle lg" viewBox="0 0 24 24"><path d="M12 1 L14 9 L22 11 L14 13 L12 22 L10 13 L2 11 L10 9 Z" fill="var(--accent-lime)"/></svg>
		<svg class="sparkle sm" viewBox="0 0 24 24"><path d="M12 1 L14 9 L22 11 L14 13 L12 22 L10 13 L2 11 L10 9 Z" fill="var(--accent-lavender)"/></svg>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">ID:</div>
        <div class="address-row">
          <input class="field-input addr-input" type="text" name="userId" placeholder="아이디를 입력하세요" />
          <button type="button" class="addr-btn">아이디 중복 검사</button>
        </div>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">PW:</div>
        <input class="field-input" type="password" name="userPw" placeholder="비밀번호를 입력하세요" />
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">CONFIRM PW:</div>
        <input class="field-input" type="password" name="confirmPw" placeholder="비밀번호를 다시 입력하세요" />
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">NAME:</div>
        <input class="field-input" type="text" name="userName" placeholder="이름을 입력하세요" />
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">BIRTHDAY:</div>
        <input class="field-input" type="date" name="birthday" />
      </div>
    </div>
    
    <div class="field">
      <div class="field-box">
        <div class="field-label">PHONENUMBER:</div>
        <input class="field-input" type="text" name="phoneNumber" placeholder="010-0000-0000" />
      </div>
    </div>
    
    <div class="field">
      <div class="field-box">
        <div class="field-label">EMAIL:</div>
        <input class="field-input" type="text" name="emailId" placeholder="이메일을 입력하세요" />
      </div>
    </div>

    <div class="field">
	  <div class="field-box">
	    <div class="field-label">POST CODE:</div>
	    <div class="address-row">
	      <input class="field-input addr-input" type="text" id="sample4_postcode" placeholder="우편번호" readonly />
	      <button type="button" class="addr-btn" onclick="sample4_execDaumPostcode()">찾기</button>
	    </div>
	  </div>
	</div>

<div class="field">
  <div class="field-box">
  <div class="field-label">ROAD ADDRESS:</div>
    <input class="field-input" type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" readonly />
  </div>
</div>

<input type="hidden" id="sample4_extraAddress" name="extraAddress" />
    <div class="field">
      <div class="field-box">
      <div class="field-label">ADDRESS DETAIL:</div>
        <input class="field-input" type="text" name="addressDetail" placeholder="상세 주소" />
      </div>
    </div>
    <div class="btn-row">
      <button type="reset" class="star-btn" aria-label="Reset">
        <svg viewBox="0 0 100 128" preserveAspectRatio="none"><path d="M50 2 C52 40 55 58 98 64 C55 70 52 88 50 126 C48 88 45 70 2 64 C45 58 48 40 50 2 Z"/></svg>
        <span class="star-label">RESET</span>
      </button>
      <button type="submit" class="star-btn" aria-label="Sign Up">
        <svg viewBox="0 0 100 128" preserveAspectRatio="none"><path d="M50 2 C52 40 55 58 98 64 C55 70 52 88 50 126 C48 88 45 70 2 64 C45 58 48 40 50 2 Z"/></svg>
        <span class="star-label">SIGN UP</span>
      </button>
    </div>
  </form>
<script>
function sample4_execDaumPostcode() {
    //검색을 통한 프로그램 개발 ^^
}
</script>

</body>
</html>