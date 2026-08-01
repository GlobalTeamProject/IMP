<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IMP Seller Page - Product Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productRegistration.css">
</head>
<body>

    <div class="main-container">
        <!-- 상단 헤더 영역 (완벽하게 고정된 색상 적용) -->
        <header class="header">
            <div class="logo-area">
                <a href="${pageContext.request.contextPath}/seller" class="transparent-logo-btn">
                    <span class="logo-text">IMP<span class="seller-text">SellerPage</span></span>
                    <div class="sparkles-container">
                        <span class="sparkle green-sparkle">✦</span>
                        <span class="sparkle purple-sparkle">✦</span>
                    </div>
                </a>
            </div>
            
            <nav class="top-nav">
                <a href="${pageContext.request.contextPath}/seller" class="nav-circle c-purple">Buyer<br>Page</a>
                <a href="${pageContext.request.contextPath}/productRegistration" class="nav-circle c-lime active">Product<br>Registration</a>
                <a href="${pageContext.request.contextPath}/myPage" class="nav-circle c-skyblue">My<br>Page</a>
            </nav>
        </header>

        <!-- 메인 콘텐츠 영역 (폼) -->
        <form action="${pageContext.request.contextPath}/productRegisterAction" method="post" enctype="multipart/form-data" class="content-body">
            
            <div class="preview-section">
                <div class="image-preview-box" id="imagePreviewBox">
                    <div class="preview-placeholder-content">
                        <span>Product Preview Area</span>
                    </div>
                </div>
                <div class="text-info-area">
                    <div class="info-title">Title:</div>
                    <div class="info-description">Description:</div>
                </div>
            </div>

            <div class="form-fields-section">
                <div class="input-group">
                    <label for="productPrice">Product Price</label>
                    <input type="text" id="productPrice" name="productPrice" placeholder="Enter product price">
                </div>

                <div class="input-group">
                    <label for="productName">Product Name</label>
                    <input type="text" id="productName" name="productName" placeholder="Enter product name">
                </div>

                <div class="input-group">
                    <label for="productDescription">Product Description</label>
                    <textarea id="productDescription" name="productDescription" placeholder="Enter product description"></textarea>
                </div>

                <div class="input-group">
                    <label for="productStock">Product Stock</label>
                    <input type="number" id="productStock" name="productStock" placeholder="Enter stock quantity">
                </div>

                <div class="input-group">
                    <label for="productCategory">Product Category</label>
                    <select id="productCategory" name="productCategory">
                        <option value="">Select category</option>
                        <option value="electronics">Electronics</option>
                        <option value="fashion">Fashion</option>
                        <option value="home">Home & Living</option>
                        <option value="beauty">Beauty</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="attachmentFile">Attachment File</label>
                    <input type="file" id="attachmentFile" name="attachmentFile">
                </div>
            </div>

            <div class="bottom-actions">
                <button type="submit" class="action-circle-btn register-btn">Register</button>
                <button type="reset" class="action-circle-btn cancel-btn">Cancel</button>
                <a href="${pageContext.request.contextPath}/seller" class="action-circle-btn home-btn">Home</a>
            </div>

        </form>
    </div>

</body>
</html>