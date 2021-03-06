package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MemberDetailAgesCommend;
import proj21_shoes.dto.MemberDetail;

@Service
public interface GetMemberDetailListService {
	List<MemberDetail> getMemberDetailLists(); // 멤버 전체 검색 (번호,멤버이름)?
	
	public List<MemberDetailAgesCommend> memberListByAges();
	
	public List<MemberDetailAgesCommend> memberListByGender();

}
