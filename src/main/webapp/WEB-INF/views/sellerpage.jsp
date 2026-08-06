<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>IMP Seller Page</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerpage.css" />
 </head>
<body>
<section class="page-shell active" id="seller-page">
    <div class="page-header">
      <div class="logo">
        <span class="logo-strong">IMP</span><span class="logo-rest">SellerPage</span>
        <span class="sparkle-group">
          <svg class="sparkle-green" viewBox="0 0 24 24" fill="var(--lime)"><path d="M12 0 C12 6.5 14.5 9 21 9 C14.5 9 12 11.5 12 18 C12 11.5 9.5 9 3 9 C9.5 9 12 6.5 12 0 Z"/></svg>
          <svg class="sparkle-purple" viewBox="0 0 24 24" fill="var(--lavender)"><path d="M12 0 C12 6.5 14.5 9 21 9 C14.5 9 12 11.5 12 18 C12 11.5 9.5 9 3 9 C9.5 9 12 6.5 12 0 Z"/></svg>
        </span>
      </div>
      <div class="nav-circles">
        <a href="${pageContext.request.contextPath}/buyer" class="nav-circle c-lavender">Buyer<br>Page</a>
        <a href="${pageContext.request.contextPath}/productRegistration" class="nav-circle c-lime">Product<br>Registration</a>
        <a href="${pageContext.request.contextPath}/mypage" class="nav-circle c-cyan">My<br>Page</a>
        <a href="${pageContext.request.contextPath}/logout" class="nav-circle c-coral-outline">Log<br>out</a>
      </div>
    </div>
	<!--
		1. select 부분 보고 파악 - o
		2. buyerpage 삭제 , 수정 가능하게
		3. 미리보기 이미지 보이게
		4. 로그아웃 버튼 만들기 - o
		5. 경로 확인 후 수정
	
	  -->
    <div class="card-grid">
	  <%-- 1. 데이터(productList)가 존재하는 경우 --%>
	  <c:choose>
	    <c:when test="${not empty productList}">
	      <c:forEach var="product" items="${productList}" varStatus="status">
	      	<a href="#" class="card-link" style="text-decoration: none; color: inherit;">
		        <div class="card">
		          <%-- 상품 이미지 (DB에 이미지 경로가 있다면 src에 넣고, 없다면 기본 썸네일 유지) --%>
				  <%-- <div class="card-thumb" style="<c:if test='not empty product.product_picture'>background: url('${pageContext.request.contextPath}/resources/upload/${product.product_picture}') center/cover no-repeat;</c:if>"></div> --%>		          
				  <div class="card-thumb" style="background: url('/resources/upload/${product.product_picture}') center/cover no-repeat;"></div>
				  <%-- 상품 제목 및 설명 출력 --%>
		          <div class="card-title">Title: <c:out value="${product.product_name}"/></div>
		          <div class="card-desc">Description: <c:out value="${product.product_des}"/></div>
		          <div class="card-price">Price: <c:out value="${product.product_price}"/></div>
		        </div>
		  	</a>
	      </c:forEach>
	    </c:when>
	    
	    <%-- 2. 데이터가 없는 경우 (등록된 상품이 없을 때) --%>
	    <c:otherwise>
	      <div class="card" style="grid-column: 1 / -1; text-align: center; padding: 40px;">
	        <div class="card-title" style="justify-content: center;">등록된 상품이 없습니다.</div>
	        <div class="card-desc">새로운 상품을 등록해 보세요!</div>
	      </div>
	    </c:otherwise>
	  </c:choose>
	</div>
  </section>

</body>
</html>
