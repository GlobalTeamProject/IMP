package test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;   
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	
/* @RequestMapping은 Class와 Method에 붙일 수 있고 @GetMapping, @PostMapping, @PutMapping, @DeleteMapping들은 Method에만 붙일 수 있다.*/
    @RequestMapping("/login")
    public String loginPage() {
        return "login";  // WEB-INF/views/login.jsp 를 찾아감
    }
    
    @RequestMapping("/signup")
    public String signupPage() {
        return "signup";
    }
    
   /*@GetMapping("/buyer")	그냥 buyer 페이지 화면을 보여줄 때
     @PostMapping("/login")	로그인 폼처럼 데이터를 제출,전송할 때*/
    
    @GetMapping("/buyer")
    public String buyerPage() {
        return "buyerpage"; // buyerpage.jsp 를 보여줌
    }

    @GetMapping("/seller")
    public String sellerPage() {
        return "sellerpage"; // sellerpage.jsp 를 보여줌
    }
    
}
