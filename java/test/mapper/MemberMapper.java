package test.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {
    MemberDTO loginCheck(String userId);
    int idCheck(String userId);
}
