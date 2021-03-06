package proj21_shoes.dto;

import java.time.LocalDateTime;
import java.util.List;

public class ReView {					// 상품후기게시판

	private int boardCode; 				// 	게시판코드
	private Order orderCode; 			// 	주문코드
	private int productCode;
	private String title;				// 	제목
	private String content;				// 	내용
	private LocalDateTime registDate;	// 	등록일
	private List<ReviewImage> reviewImages;
	
	
	
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public List<ReviewImage> getReviewImages() {
		return reviewImages;
	}
	public void setReviewImages(List<ReviewImage> reviewImages) {
		this.reviewImages = reviewImages;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public Order getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(Order orderCode) {
		this.orderCode = orderCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getRegistDate() {
		return registDate;
	}
	public void setRegistDate(LocalDateTime registDate) {
		this.registDate = registDate;
	}
	
	public void setMember(Member member) {
		this.setMember(member);
		
	}
	
	@Override
	public String toString() {
		return String.format(
				"ReView [boardCode=%s, orderCode=%s, title=%s, content=%s, registDate=%s, reviewImages=%s]", boardCode,
				orderCode, title, content, registDate, reviewImages);
	}
	

}
