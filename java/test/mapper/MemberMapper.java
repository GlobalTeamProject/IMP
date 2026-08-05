package test.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {
    MemberDTO loginCheck(String memId);
    int idCheck(String memId);
    void signUp(MemberDTO member);
    //void->리턴값없고 저장하면 끝
    //MemberDTO member-> 회원정보가 담긴 DTO를 받음
}
