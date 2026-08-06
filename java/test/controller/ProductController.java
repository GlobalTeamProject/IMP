package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import test.mapper.MemberDTO;
import test.mapper.ProductDTO;
import test.service.ProductService;

@Controller
public class ProductController {

	@Autowired
    private ProductService productService;
	
	//product 등록 controller
    @PostMapping("/productRegisterAction")
    public String productRegisterAction(ProductDTO product, HttpServletRequest request,HttpServletResponse response) throws IOException{
    	HttpSession session = request.getSession();
    	
    	//System.out.println(product.getProduct_name());
    	System.out.println("--- DTO 값 확인 ---");
        System.out.println("product_name: " + product.getProduct_name());
        System.out.println("product_price: " + product.getProduct_price());
        System.out.println("product_picture: " + product.getProduct_qty());
        System.out.println("product_picture: " + product.getProduct_des());
        System.out.println("product_picture: " + product.getProduct_code());
        
        int memCode = (int) session.getAttribute("memberCode");
        String memId = (String) session.getAttribute("memberId");
        
        System.out.println(session.getAttribute("memberId"));
        System.out.println(session.getAttribute("memberCode"));
        product.setMemCode(memCode);
        product.setMemId(memId);
        

        
    	try {
            // 업로드할 실제 경로 지정 (예: 웹앱 내부의 upload 폴더)
            //String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
    		String uploadPath = "C:/upload";
            
            
            // 서비스 호출을 통해 파일 저장 및 DB Insert 수행
            productService.registerProduct(product, uploadPath);
            

            
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('Thank you for registering the inventory');");
        out.println("location.href='/seller';");
        out.println("</script>");
        out.flush();
        response.flushBuffer();
        out.close();
    	return null;    
 	}
    @GetMapping("/mypage")
    public String myPage() {
        return "mypage"; // mypage.jsp 를 보여줌
    }
}
