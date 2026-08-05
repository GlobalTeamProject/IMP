package test.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import test.mapper.ProductDTO;
import test.mapper.ProductMapper;

@Service
public class ProductService {

	@Autowired
    private ProductMapper productMapper;
	
	public int registerProduct(ProductDTO product, String uploadPath) throws IOException {
	        //System.out.println(product.getProduct_name());
	        //파일 업로드 처리
	        MultipartFile file = product.getProduct_picture();
	        if (file != null && !file.isEmpty()) {
	            String originalFileName = file.getOriginalFilename();
	            System.out.println(file);
	            // 중복 방지를 위한 중복되지 않는 id 만들기 위한 표준 규약
	            UUID uuid = UUID.randomUUID();
	            String savedFileName = uuid.toString() + "_" + originalFileName;
	            
	            // 지정한 폴더로 파일 저장
	            File saveFile = new File(uploadPath, savedFileName);
	            file.transferTo(saveFile);
	            
	            // 2. DB에 저장할 파일 이름을 DTO의 picture 필드(String)에 셋팅
	            // (주의: DTO의 product_picture 타입을 String으로 바꾸거나, 파일명을 담을 별도 변수가 필요할 수 있습니다)
	            //System.out.println(savedFileName);
	            //savedFileName = "test입니다.";
	            product.setProduct_picture(savedFileName);
	        }
	        //System.out.println(product.getProduct_name());
	        // 3. Mapper 호출
	        return productMapper.insertProduct(product);
	}
}
