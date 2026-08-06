<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IMP My Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" />
</head>
<body>

    <!-- 전체를 감싸는 큰 메인 컨테이너 박스 -->
    <div class="main-container">
        
        <!-- 상단 헤더 영역 -->
        <header class="header-area">
            <div class="logo-title">
                IMP<span class="logo-sub">MyPage</span> <span class="sparkle">✨</span>
            </div>

            <!-- 네비게이션 버튼 영역 -->
            <nav class="nav-buttons">
                <a href="${pageContext.request.contextPath}/seller/main" class="nav-btn seller-btn">Seller<br>page</a>
                <a href="${pageContext.request.contextPath}/product/register" class="nav-btn reg-btn">Product<br>Registration</a>
                <a href="${pageContext.request.contextPath}/member/mypage" class="nav-btn my-btn">My<br>Page</a>
                <a href="${pageContext.request.contextPath}/member/logout" class="nav-btn logout-btn">Log<br>out</a>
            </nav>
        </header>

        <!-- 마이페이지 콘텐츠 2분할 래퍼 -->
        <div class="content-wrapper">
            
            <!-- 왼쪽: 회원정보 수정 섹션 -->
            <div class="card">
                <h2>Profile Settings</h2>
                <form action="${pageContext.request.contextPath}/member/update" method="post">
                    
                    <div class="input-group">
                        <label>ID (Email / Username)</label>
                        <input type="text" name="member_id" value="${loginUser.member_id}" readonly class="readonly-input">
                    </div>

                    <div class="input-group">
                        <label>New Password</label>
                        <input type="password" name="member_pw" placeholder="Enter new password">
                    </div>

                    <div class="input-group">
                        <label>Confirm Password</label>
                        <input type="password" name="member_pw_chk" placeholder="Confirm new password">
                    </div>

                    <button type="submit" class="update-btn">Update Profile</button>
                </form>
            </div>

            <!-- 오른쪽: 보유 금액/포인트(Wallet) 표시 섹션 -->
            <div class="card wallet-card">
                <div>
                    <h2>My Wallet</h2>
                    <div class="balance-display-box">
                        <span class="balance-label">Current Balance</span>
                        <div class="balance-amount">
                            <fmt:formatNumber value="${loginUser.balance}" pattern="#,###" /> <small>원</small>
                        </div>
                    </div>
                    <p class="balance-desc">IMP 플랫폼에서 안전하게 충전 및 사용된 잔액입니다.</p>
                </div>
                
                <div class="wallet-action">
                    <button type="button" onclick="alert('충전 기능 준비 중입니다!')" class="charge-btn">Charge Balance</button>
                </div>
            </div>

        </div>
    </div>

</body>
</html>