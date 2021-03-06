package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.OrderProduct;

public interface CartMapper {
	
	List<Cart> cartListByMember(Member member);
	
	Cart cartByOne(Cart cart);
	
	int insertCart(Cart cart);
	
	int updateCartCount(Cart cart);
	
	int deleteCart(int cartCode);
	
	Cart cartBycartCode(int cartCode);
	void cartCountUp(int cartCode);
	void cartCountDown(int cartCode);

	List<Cart> cartBycartCodes(List<Integer> cartCodes);

	
}
