package test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



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
    @PostMapping("/login")
    public String loginProcess(@RequestParam("userId") String userId, 
                               @RequestParam("userPw") String userPw, 
                               Model model) {
    	
    	
    	
    	
		/*
		 * int memCode = memberService.loginCheck(userId, userPw); if (memCode <= 0) {
		 * model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다."); return "login"; //
		 * 로그인 실패 시 다시 로그인 페이지로 }
		 */
    	
    	
    	
		
		  int memCode = 1;
		  boolean isLoginSuccess = true;
		  
		  if (!isLoginSuccess) 
		  {
			  model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다."); 
			  return "login"; // 다시 로그인 페이지로 리턴 
		  }
		
        
	        // MEM_CODE에 따른 페이지 분리
	        if (memCode == 1) {
	            return "redirect:/buyer"; // 구매자 페이지
	        } else if (memCode == 2) {
	            return "redirect:/seller"; // 판매자 페이지
	        } else if (memCode ==3) {
	        	return "관리자페이지";
	        }else {
	            model.addAttribute("errorMsg", "유효하지 않은 회원 등급입니다.");
	            return "login";
	        }
	    	
	    }
 	}
 
