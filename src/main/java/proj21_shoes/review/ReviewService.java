package proj21_shoes.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.ReView;

@Service
public interface ReviewService {

	List<ReView> selectReviewByMemberId(String memberId);

	int getListCount();

	ArrayList<ReView> getArticleList(int page, int limit);
	
}
