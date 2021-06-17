package proj21_shoes.review;

import java.util.ArrayList;

import proj21_shoes.dto.ReView;

public interface ReviewDao {
	int selectListCount();
	ArrayList<ReView> selectArticleList(int page, int limit);
	ReView selectArticle(int board_code);
	int insertArticle(ReView article);
	int insertReplyArticle(ReView article);
	int updateArticle(ReView article);
	int deleteArticle(int board_code);
	int updateReadCount(int board_code);
	boolean isArticleBoardWriter(int board_code, String pass);
	int nextBoardCode();
}
