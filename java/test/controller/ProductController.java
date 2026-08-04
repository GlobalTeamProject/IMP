package test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import test.mapper.ProductDTO;
import test.service.ProductService;

@Controller
public class ProductController {

	@Autowired
    private ProductService productService;
	
	//product 등록 controller
    @PostMapping("/productRegisterAction")
    public String productRegisterAction(ProductDTO product, HttpServletRequest request){
    	
    	//System.out.println(product.getProduct_name());
    	
    	try {
            // 업로드할 실제 경로 지정 (예: 웹앱 내부의 upload 폴더)
            String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
            
            // 서비스 호출을 통해 파일 저장 및 DB Insert 수행
            productService.registerProduct(product, uploadPath);
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return "redirect:/productRegistration";    
 	}
}
