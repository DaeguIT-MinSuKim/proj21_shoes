package proj21_shoes.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.dto.ReView;


public interface ReviewService {

	int getListCount();

	ArrayList<ReView> getArticleList(int page, int limit);
	
	int productReviewInsert(ReView reivew);
	
	int productReviewDelete(int boardCode);
	
	int productReviewUpdate(ReView reivew);
	
	int selectProductReviewCount(int code);

	List<ReView> selectReviewByBoardCode(int boardCode);

	List<ReView> selectReviewByProductCode(int productCode);




	
}
