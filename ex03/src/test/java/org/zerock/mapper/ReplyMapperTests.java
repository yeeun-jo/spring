package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	// 테스트 전에 해당 번호 게시물 존재하는지 확인
	private Long[] bnoArr = {73981L,73966L,73965L,73964L,73963L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Ignore
	@Test
	public void testRead() {
		Long targetRno = 21L;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}
	
	@Ignore
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			// 게시물 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}
	
	@Ignore
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Ignore
	@Test
	public void testDelete() {
		Long targetRno = 21L;
		mapper.delete(targetRno);
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		Long targetRno = 20L;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo.getReply());
		log.info(vo.getReplyDate());
		
		vo.setReply("수정수정");
		int count = mapper.update(vo);
		log.info("UPDATE COUNT:" + count);
	}

	@Ignore
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[1]);
		replies.forEach(reply -> log.info(reply));
	}
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		
		// 게시글 번호 73964
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 73964L);
		replies.forEach(reply -> log.info(reply));
	}
}
