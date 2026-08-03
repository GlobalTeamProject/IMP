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
    public MemberDTO authenticate(String userId, String userPws) {
        MemberDTO member = memberMapper.loginCheck(userId);

        // 아이디가 존재하지 않거나 비밀번호가 틀린 경우
        if (member == null || !member.getMemPw().equals(userPws)) {
        	
            return null; 
        }

        return member; // 로그인 성공 시 회원 정보 반환
    }
 // 아이디중복체크
    public int idCheck(String userId) {
        return memberMapper.idCheck(userId);
  }

}