package org.zerock.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.apache.xerces.util.IntStack;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;
import org.zerock.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class SampleController {
	
	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		log.info("MIME TYPE : " +MediaType.TEXT_PLAIN_VALUE);
		return "안녕하세요~!!";
	}
	
	// GetMapping 이나 RequestMapping 의 produces 속성은 생략 가능
	@GetMapping(value = "/getSample", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	public SampleVO getSample() {
		return new SampleVO(112,"스타","로드");
	}

	@GetMapping(value = "/getList")
	public List<SampleVO> getList(){
		
		// 1~10미만 까지 루프 처리하면서 SampleVO객체 만들고 List<SampleVO)로 만들어내기
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + " First", i + " Last")).collect(Collectors.toList());
	}
	
	@GetMapping(value = "/getMap")
	public Map<String, SampleVO> getMap(){
		Map<String, SampleVO> map = new HashMap<String, SampleVO>();
		map.put("First", new SampleVO(111, "그루트", "주니어"));
		map.put("두번째", new SampleVO(222,"예은","조"));
		return map;
	}
	
	// ResponseEntity는 데이터와 헤더의 상태 메시지 등을 같이 전달하는 용도로 사용
	@GetMapping(value = "/check", params = {"height","weight"})
	public ResponseEntity<SampleVO> check(Double height, Double weight){
		
		SampleVO vo = new SampleVO(0, ""+height,""+weight);
		ResponseEntity<SampleVO> result = null;
		
		if(height < 150) { result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo); }
		else { result = ResponseEntity.status(HttpStatus.OK).body(vo);	}
		return result;
	}
	
	@GetMapping(value = "/product/{cat}/{pid}")
	public String[] getPath(@PathVariable String cat, @PathVariable int pid) {
		return new String[] { "category : " + cat, "productid : " + pid }; 
	}
	
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		log.info("convert ...... ticket" +ticket);
		return ticket;
	}
	
}
