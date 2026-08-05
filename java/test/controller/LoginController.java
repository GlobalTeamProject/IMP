package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import test.mapper.MemberDTO;
import test.service.MemberService;



@Controller
public class LoginController {

	@Autowired
    private MemberService memberService;
	
	
/* @RequestMapping은 Class와 Method에 붙일 수 있고 @GetMapping, @PostMapping, @PutMapping, @DeleteMapping들은 Method에만 붙일 수 있다.*/
    @RequestMapping("/login")
    public String loginPage() {
        return "login";  // WEB-INF/views/login.jsp 를 찾아감
    }
    
    @RequestMapping("/signup")
    public String signupPage() {
        return "signup";
    }
    /*로그인 체크 */
    @ResponseBody
    @GetMapping("/idCheck.me")
    public String idCheck(String memId){
        int result = memberService.idCheck(memId); // 아이디가 존재한다면 1, 없다면 0
        return result + ""; // 비동기방법으로 보낼때는 항상 문자열 데이터만 전달할 수 있다!!
    }
    
    @PostMapping("/signup")
    public String signup(MemberDTO member) {
    	memberService.signUp(member);
    	
    	int memCode = member.getMemCode();
    	if(memCode == 1 ) {
    		return "redirect:/buyer";
    	}else if(memCode == 2 ) {
    		return "redirect:/seller";
    	}else {
    	    return "redirect:/login";  // 예외 상황 대비
    	}
    	
    	//"redirect:" → Spring한테 주는 신호. 
    	//main → 이동할 주소 (컨트롤러의 /main 매핑)
    	//?signupSuccess=true → URL 뒤에 붙는 파라미터. "회원가입 성공했다"는 신호를 전달하는 용도
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
    @GetMapping("/productRegistration")
    public String productRegistrationPage() {
        return "productRegistration"; // sellerpage.jsp 를 보여줌
    }
    @PostMapping("/login")
    public String loginProcess(@RequestParam("memId") String memId, 
                               @RequestParam("memPw") String memPw, 
                               Model model,
                               HttpServletResponse response) throws IOException {

    	
	    	// Service를 통해 DB 검증 및 회원 정보(memCode 포함) 가져오기
	        MemberDTO member = memberService.authenticate(memId, memPw);
	        
	        if (member == null) {
	        	response.setContentType("text/html; charset=utf-8");
	        	response.setCharacterEncoding("utf-8");

	        	PrintWriter out = response.getWriter();

	        	out.println("<script>alert('Forgot ur id or password 테스트');");
	        	out.println("history.go(-1);</script>");
	        	//model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다."); 
	        	out.close();
	        		
	        	return "login"; // 다시 로그인 페이지로 리턴 
	        }
	        
	        int memCode = member.getMemCode();
    	
		 
		
        
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
 
