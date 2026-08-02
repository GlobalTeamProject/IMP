<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IMP Seller Page - Product Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productRegistration.css">
</head>
<script type="text/javascript">

	/*
	
		1. 예외상황 [입력하는 부분 없을경우 alert()- o
		2. 첨부파일 통해서 이미지 미리보기 - o
		3. 재고 카테고리에 대한 내용 - o
		4. 등록을 통해 DB에 입력
	
	*/
	//이미지 미리보기 화면
	window.addEventListener('DOMContentLoaded', function() {
	    var product_picture = document.getElementById('product_picture'); 
	    var preview_image = document.getElementById('preview_image');

	    if (product_picture) {
	        product_picture.addEventListener('change', function(event) {
	            var file = event.target.files[0];
	            if (file) {
	                preview_image.src = URL.createObjectURL(file);
	            } else {
	                preview_image.src = '';
	            }
	        });
	    }
	});
	//값 전부 입력 가능하게 하는 로직
	function product_sign() {
		var product_price = document.getElementById('product_price').value.replace(/[^0-9]/g, '').trim();
		var product_name = document.getElementById('product_name').value.trim();
		var product_qty = document.getElementById('product_qty').value.trim();
		var product_des = document.getElementById('product_des').value.trim();
		var product_code = document.getElementById('product_code').value.trim();
		var product_picture = document.getElementById('product_picture').value.trim();
		
		if (!product_price || !product_name || !product_des || !product_qty || !product_code || !product_picture) {
	        alert('Enter Information'); 
	        return false;
	    }
	}
	//숫자형식 변경하는 로직
	function formatNumber(target) {
		var value = target.value.replace(/[^0-9]/g, '');
		if(value)
			value = Number(value).toLocaleString('ko-KR');
		target.value = value;
	}
	
</script>
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
        <form action="${pageContext.request.contextPath}/productRegisterAction" method="post" enctype="multipart/form-data" class="content-body" onsubmit="return product_sign(event);">
            
            <div class="preview-section">
                <div class="image-preview-box" id="imagePreviewBox">
                    <div class="preview-placeholder-content">
                        <img id="preview_image" alt="Preview image" style="width: 300px; margin-top: 10px;" src="">
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
                    <input type="text" id="product_price" oninput="formatNumber(this)"	name="product_price" placeholder="ex)10000" />
                </div>

                <div class="input-group">
                    <label for="productName">Product Name</label>
                    <input type="text" id="product_name" name="product_name" placeholder="Enter product name">
                </div>

                <div class="input-group">
                    <label for="productDescription">Product Description</label>
                    <textarea id="product_des" name="product_des" placeholder="Enter product description"></textarea>
                </div>

                <div class="input-group">
                    <label for="productStock">Product Stock</label>
                    <input type="number" id="product_qty" name="product_qty" placeholder="Enter stock quantity">
                </div>

                <div class="input-group">
                    <label for="productCategory">Product Category</label>
                    <select id="product_code" name="product_code">
                        <option value="1">Vegetables & Fruits</option>
                        <option value="2">Meats & Poultry</option>
                        <option value="3">Seafood</option>
                        <option value="4">Noodles & Dried Goods</option>
                        <option value="5">Frozen Foods</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="attachmentFile">Attachment File</label>
                    <input type="file" id="product_picture" name="product_picture" accept="image/*">
                </div>
            </div>

            <div class="bottom-actions">
                <button type="submit" class="action-circle-btn register-btn">Register</button>
                <button type="reset" class="action-circle-btn cancel-btn">Reset</button>
                <a href="${pageContext.request.contextPath}/seller" class="action-circle-btn home-btn">Home</a>
            </div>
        </form>
    </div>
</body>
</html>