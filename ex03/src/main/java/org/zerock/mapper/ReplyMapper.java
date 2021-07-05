package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	// 등록
	public int insert(ReplyVO vo);
	
	// 조회
	public ReplyVO read(Long bno);
	
	// 삭제
	public int delete(Long bno);
	
	// 수정
	public int update(ReplyVO vo);
	
	// 댓글 페이징
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno")Long bno);
	
	// 해당 게시글에 달린 댓글 총 수량 파악
	public int getCountByBno(Long bno);
	
}
