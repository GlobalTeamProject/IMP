<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>IMP Buyer Page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/buyerpage.css" />
 </head>

<body>
<section class="page-shell active" id="buyer-page">
    <div class="page-header">
      <div class="logo">
        <span class="logo-strong">IMP</span><span class="logo-rest">BuyerPage</span>
        <span class="sparkle-group">
          <svg class="sparkle-green" viewBox="0 0 24 24" fill="var(--lime)"><path d="M12 0 C12 6.5 14.5 9 21 9 C14.5 9 12 11.5 12 18 C12 11.5 9.5 9 3 9 C9.5 9 12 6.5 12 0 Z"/></svg>
          <svg class="sparkle-purple" viewBox="0 0 24 24" fill="var(--lavender)"><path d="M12 0 C12 6.5 14.5 9 21 9 C14.5 9 12 11.5 12 18 C12 11.5 9.5 9 3 9 C9.5 9 12 6.5 12 0 Z"/></svg>
        </span>
      </div>
      <div class="nav-circles">
        <a href="${pageContext.request.contextPath}/seller" class="nav-circle c-lavender">Seller<br>page</a>
        <a href="#" class="nav-circle c-lime">Cart</a>
        <a href="#" class="nav-circle c-cyan">My<br>Page</a>
      </div>
    </div>

    <div class="card-grid">
      <div class="card"><div class="card-thumb"></div><div class="card-title">Title:</div><div class="card-desc">Description:</div></div>
      <!-- ... 나머지 카드 3개 ... -->
    </div>
  </section>

</body>
</html>