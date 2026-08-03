<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>IMP Sign Up</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css">
<!-- 자바스크립트(유효성검사 해당) -->
<script src ="signUpjs3.js"></script> 
<!-- 다음 우편번호찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<form class="signup-card" action="${pageContext.request.contextPath}/signup" method="post" name="joinForm" onsubmit="return Validation();">
    <div class="title-wrap">
      <span class="title-text">Sign Up</span>
		<svg class="sparkle lg" viewBox="0 0 24 24"><path d="M12 1 L14 9 L22 11 L14 13 L12 22 L10 13 L2 11 L10 9 Z" fill="var(--accent-lime)"/></svg>
		<svg class="sparkle sm" viewBox="0 0 24 24"><path d="M12 1 L14 9 L22 11 L14 13 L12 22 L10 13 L2 11 L10 9 Z" fill="var(--accent-lavender)"/></svg>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">ID:</div>
        <div class="address-row">
          <input class="field-input addr-input" type="text" id="uid"  name="userId" placeholder="아이디를 입력하세요" maxlength="12"/>
          <button type="button" class="addr-btn"  onclick="checkIdDuplicate()" >아이디 중복 검사</button>
        </div>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">PW:</div>
        <input class="field-input" type="password" id="pw"  name="userPw" placeholder="비밀번호를 입력하세요" maxlength="12"/>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">CONFIRM PW:</div>
        <input class="field-input" type="password" id="cpw" name="confirmPw" placeholder="비밀번호를 다시 입력하세요" maxlength="12"/>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">NAME:</div>
        <input class="field-input" type="text" id="uname" name="userName" placeholder="이름을 입력하세요" maxlength="9"/>
      </div>
    </div>
    
    <div class="field">
      <div class="field-box">
        <div class="field-label">PHONENUMBER:</div>
        <input class="field-input" type="text" id="number" name="phoneNumber" placeholder="01012341234" maxlength="11"/>
      </div>
    </div>
    
    <div class="field">
      <div class="field-box">
        <div class="field-label">EMAIL:</div>
        <input class="field-input" type="text" id="mail" name="emailId" placeholder="이메일을 입력하세요" class="check"/>
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
        <input class="field-input" type="text" name="addressDetail" placeholder="상세 주소" maxlength="11"/>
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
    <script>
    //유효성 검사 메소드
    function Validation(){
    	//변수에 저장
    	
    	var uid = document.getElementById("uid")
    	var pw = document.getElementById("pw");
    	var cpw = document.getElementById("cpw");
    	var mail = document.getElementById("mail");
    	var uname = document.getElementById("uname");
        var number = document.getElementById("number");
        
        if(!checkEngNumber(uid.value)){
    		alert("영문 대소문자, 숫자만 입력하세요");
    		uid.focus();
    		return false;
    	}  

        if(pw.value.length <4){
        	alert("비밀번호를 4글자 이상 입력하세요.")
         	   pw.focus();
         	   return false;
            }else if(pw.value == uid.value){
                alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
                pw.focus();
                return false;
            }
        if(cpw.value !== pw.value){
            alert("비밀번호와 동일하지 않습니다.")
            cpw.focus();
            return false;
        }
        //메일주소확인 
        if(mail.value.length == 0){
       	 alert("메일주소를 입력하세요.")
       	 mail.focus();
       	 return false;
        }else if(mail.value.indexOf("@") == -1 || mail.value.indexOf(".") == -1 || mail.value.length <=5){
        	//@가 없다는 뜻으로 -1
            alert("잘못된 이메일 형식입니다.")
            mail.focus();
            return false;
        }
        if(uname.value == ""){
       	 alert("이름을 입력하세요.")
       	 uname.focus();
       	 return false;
        }else if(!checkKorEng(uname.value)){
       	 alert("한글,영어만 입력하세요.")
       	 uname.focus();
       	 return false;
        }
        if(number.value.length == 0){
            alert("전화번호를 입력하세요.")
            number.focus();
            return false;
        }else if(!checkOnlyNumber(number.value)){
            alert("숫자만 입력하세요. (- 없이 입력)")
            number.focus();
            return false;
        }else if(number.value.length < 10 || number.value.length > 11){
            alert("전화번호 자리수를 확인하세요.")
            number.focus();
            return false;
        }
        return true;
    }
        
   
    
  	//아이디확인
	function checkIdDuplicate(){
	    var uid = document.getElementById("uid").value;
	    
	    if(uid.length < 4){
	        alert("아이디를 4글자 이상 입력하세요.");
	        document.getElementById("uid").value = '';
	        return;
	    }
	    
	    fetch("${pageContext.request.contextPath}/idCheck.me?userId=" + uid)
	        .then(response => response.text())
	        .then(result => {
	            if(result === "1"){
	                alert("이미 사용 중인 아이디입니다.");
	                document.getElementById("uid").value = '';
	            } else {
	                alert("사용 가능한 아이디입니다.");
	            }
	        }); 
	    }
    

       
     // 문자열이 영어, 숫자인지 확인하는 메서드 
     function checkEngNumber(value){
          var count = 0;
         for(var i=0; i<value.length; i++){
             if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57)){
                 count += 1;
             }
         } 
         
         //카운트 수와 문자의 길이가 같다면 true
         if(count === (value.length)){
             return true;
         } else{
             return false;
         }  
     }

     //숫자만 있는지 확인
     function checkOnlyNumber(value){
          var count = 0;
         for(var i=0; i<value.length; i++){
             if(value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57){
            	 //즉, 48부터 57까지가 딱 숫자 0~9만 해당하는 코드번호(아스키코드) 구간
                 count += 1;
             }
         }
         if(count === value.length){ //===은 타입이랑 값 둘다 일치해야함 
             return true;
         } else {
             return false;
         } 
     }
     
     //영어, 한글인지(가~힣) 확인
     function checkKorEng(value){
          var count = 0;

         for(var i=0; i<value.length; i++){
             console.log(value.charCodeAt(i));
             if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=44032 && value.charCodeAt(i)<=55203)){
                 count += 1;
             }
         }

         if(count === (value.length)){
             return true;
         } else{
             return false;
         } 
     }
    
    function sample4_execDaumPostcode(){
    	new daum.Postcode({
    		oncomplete:function(data){
    			//우편번호
    			document.getElementById('sample4_postcode').value = data.zonecode;
    			//도로명주소
    			document.getElementById('sample4_roadAddress').value=data.roadAddress;
    			 // 참고항목(동/건물명 등) 채우기
                var extraAddress = ''; // 참고항목을 담을 빈 상자,처음에는 비어있음 
                if (data.userSelectedType === 'R') { //도로명주소 선택
                    if (data.bname !== '') extraAddress += data.bname;
                    if (data.buildingName !== '') {//건물이름
                        extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }
                document.getElementById('sample4_extraAddress').value = extraAddress;//완성된 참고 항목
            }
        }).open();
    }
    </script>
    
  </form>


</body>
</html>