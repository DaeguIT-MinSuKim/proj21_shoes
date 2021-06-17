package proj21_shoes.mapper;
import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.ReView;
import proj21_shoes.review.ReviewMapper;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class ReviewMapperTest {

	private static final Log log = LogFactory.getLog(ReviewMapperTest.class);

	@Autowired
	ReviewMapper mapper;

	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	

	@Test
	public void test01SelectReviewByMemberId() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ReView> rList = mapper.selectReviewByMemberId("aaa");
		System.out.println("rList>>>" + rList);
		Assert.assertNotNull(rList);
		log.debug(rList.toString());
	}

}
