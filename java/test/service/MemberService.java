package test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.mapper.MemberDTO;
import test.mapper.MemberMapper;

@Service
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    /**
     * LHS
     * 로그인 검증 메서드
     * @return 성공 시 MemberDTO (memCode 포함), 실패 시 null
     */
    public MemberDTO authenticate(String memId, String memPw) {
        MemberDTO member = memberMapper.loginCheck(memId);

        // 아이디가 존재하지 않거나 비밀번호가 틀린 경우
        if (member == null || !member.getMemPw().equals(memPw)) {
        	
            return null; 
        }

        return member; // 로그인 성공 시 회원 정보 반환
    }
 // 아이디중복체크
    public int idCheck(String memId) {
        return memberMapper.idCheck(memId);
  }

    //회원가입
    public void signUp(MemberDTO member) {
    	//void = 리턴 타입, 이 메서드는 끝나고 나서 아무 값도 돌려주지 않는다
    	memberMapper.signUp(member); //memberMapper 객체의 signUp이라는 메서드를, member 라는 값을 넣어서 실행해라
    }
}