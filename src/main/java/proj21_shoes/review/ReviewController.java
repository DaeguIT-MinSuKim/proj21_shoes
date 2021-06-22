package proj21_shoes.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@GetMapping("review/{productCode}")
	public ResponseEntity<Object> review(@RequestParam(value = "productCode", required = false) int productCode){
		return ResponseEntity.ok(service.selectReviewByProductCode(productCode));
	}
}