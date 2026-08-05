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
          <input class="field-input addr-input" type="text" id="uid"  name="memId" placeholder="Please enter your ID." maxlength="12"/>
          <button type="button" class="addr-btn"  onclick="checkIdDuplicate()" >Check ID</button>
        </div>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">PW:</div>
        <input class="field-input" type="password" id="pw"  name="memPw" placeholder="Please enter your password." maxlength="12"/>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">CONFIRM PW:</div>
        <input class="field-input" type="password" id="cpw" name="confirmPw" placeholder="Please re-enter your password." maxlength="12"/>
      </div>
    </div>

    <div class="field">
      <div class="field-box">
        <div class="field-label">NAME:</div>
        <input class="field-input" type="text" id="uname" name="memName" placeholder="Please enter your name." maxlength="9"/>
      </div>
    </div>
    <div class="field">
  	  <div class="field-box">
    	<div class="field-label">TYPE:</div>
    	<select class="field-input" id="memType" name="memCode">
      		<option value="" disabled selected>Please select a type.</option>
      		<option value="1">Buyer</option>
      		<option value="2">Seller</option>
    	</select>
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
        <input class="field-input" type="text" id="mail" name="emailId" placeholder="Please enter your email." class="check"/>
      </div>
    </div>

    <div class="field">
	  <div class="field-box">
	    <div class="field-label">POST CODE:</div>
	    <div class="address-row">
	      <input class="field-input addr-input" type="text" id="sample4_postcode" name="postNum" placeholder="POST CODE" readonly />
	      <button type="button" class="addr-btn" onclick="sample4_execDaumPostcode()">Find</button>
	    </div>
	  </div>
	</div>

<div class="field">
  <div class="field-box">
  <div class="field-label">ROAD ADDRESS:</div>
    <input class="field-input" type="text" id="sample4_roadAddress" name="roadAddress" placeholder="ROAD ADDRESS" readonly />
  </div>
</div>

<input type="hidden" id="sample4_extraAddress" name="extraAddress" />
    <div class="field">
      <div class="field-box">
      <div class="field-label">ADDRESS DETAIL:</div>
        <input class="field-input" type="text" name="addressDetail" placeholder="ADDRESS DETAIL" maxlength="11"/>
      </div>
    </div>
    <div class="btn-row">
    <button type="button" class="star-btn" onclick="location.href='${pageContext.request.contextPath}/login'">
         <svg viewBox="0 0 100 128" preserveAspectRatio="none"><path d="M50 2 C52 40 55 58 98 64 C55 70 52 88 50 126 C48 88 45 70 2 64 C45 58 48 40 50 2 Z"/></svg>
        <span class="star-label">BACK</span>
    </button>
    <button type="reset" class="star-btn">
         <svg viewBox="0 0 100 128" preserveAspectRatio="none"><path d="M50 2 C52 40 55 58 98 64 C55 70 52 88 50 126 C48 88 45 70 2 64 C45 58 48 40 50 2 Z"/></svg>
        <span class="star-label">RESET</span>
    </button>
    <button type="submit" class="star-btn">
         <svg viewBox="0 0 100 128" preserveAspectRatio="none"><path d="M50 2 C52 40 55 58 98 64 C55 70 52 88 50 126 C48 88 45 70 2 64 C45 58 48 40 50 2 Z"/></svg>
        <span class="star-label" >SIGN UP</span>
    </button>
</div>
    <script>
    //유효성 검사 메소드
    function Validation(){
    	//변수에 저장
    	
    	/*
    	1. insert 데이터 입력
    	2. 암호화/복호화 처리
    	3. forgot id/pw
    	4. MYPAGE
    	*/
    	
    	var uid = document.getElementById("uid");
    	var pw = document.getElementById("pw");
    	var cpw = document.getElementById("cpw");
    	var mail = document.getElementById("mail");
    	var uname = document.getElementById("uname");
        var number = document.getElementById("number");
        var memType =document.getElementById("memType");
        
        
        
        if(!checkEngNumber(uid.value)){
    		alert("Letters and numbers only.");
    		uid.focus();
    		return false;
    	}  
        

        if(pw.value.length <4){
        	alert("Please enter a password with at least 4 characters.");
         	   pw.focus();
         	   return false;
            }else if(pw.value == uid.value){
                alert("You cannot use the same password as your ID.");
                pw.focus();
                return false;
            }
        if(cpw.value !== pw.value){
            alert("Passwords do not match.");
            cpw.focus();
            return false;
        }
        if(uname.value == ""){
          	 alert("Please enter your name.");
          	 uname.focus();
          	 return false;
           }else if(!checkKorEng(uname.value)){
          	 alert("Please enter Korean or English characters only.")
          	 uname.focus();
          	 return false;
        }
        if(memType.value ==''){
        	alert("Please select a type.");
            memType.focus();
            return false;
        }
        //메일주소확인 
        if(mail.value.length == 0){
       	 alert("Please enter your email address.")
       	 mail.focus();
       	 return false;
        }else if(mail.value.indexOf("@") == -1 || mail.value.indexOf(".") == -1 || mail.value.length <=5){
        	//@가 없다는 뜻으로 -1
            alert("Invalid email format.");
            mail.focus();
            return false;
        }
        
        if(number.value.length == 0){
            alert("Please enter your phone number.")
            number.focus();
            return false;
        }else if(!checkOnlyNumber(number.value)){
            alert("Please enter numbers only (without dashes).")
            number.focus();
            return false;
        }else if(number.value.length < 10 || number.value.length > 11){
            alert("Please check the number of digits in your phone number.")
            number.focus();
            return false;
        }
        return true;
    }
        
   
    
  	//아이디확인
	function checkIdDuplicate(){
	    var uid = document.getElementById("uid").value;
	    
	    if(uid.length < 4){
	        alert("Please enter an ID with at least 4 characters.");
	        document.getElementById("uid").value = '';
	        return;
	    }
	    
	    fetch("${pageContext.request.contextPath}/idCheck.me?userId=" + uid)
	    //유지보수의 용이성을 위해  ${pageContext.request.contextPath}를 사용한다.
	        .then(response => response.text())
	        .then(result => {
	            if(result === "1"){
	                alert("This ID is already in use.");
	                document.getElementById("uid").value = '';
	            } else {
	                alert("This ID is available.");
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