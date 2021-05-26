package com.itbank.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.pos.PosDTO;
import com.itbank.sell.sellDTO;
import com.itbank.service.MemberService;
import com.itbank.service.PosService;
import com.itbank.service.sellService;


@Controller
public class MainController {

	@Autowired private MemberService ms;
	
	@Autowired private PosService ps;
	
	@Autowired private sellService ss;
	
	@Autowired HttpSession session;
	
	private List<PosDTO> basket = new ArrayList<PosDTO>();
	private List<PosDTO> list = null;
	
	@GetMapping("")
	public String index(HttpSession session) {
		session.setAttribute("basket", basket);
		
		if(list == null) {
			list = ps.getMenu();
		}
		session.setAttribute("list", list);
		return "index";
	}
	
	// 결제
	@PostMapping("")
	public String sell(sellDTO dto) {
		int sellRow = ss.insertSell(dto);
		
		PosDTO sell = new PosDTO();
		
		for(PosDTO dto1 : list) {
			if(dto1.getProduct().equals(dto.getProduct())) {
				sell.setSellCount(dto1.getCount() - dto.getSellCount());
				sell.setIdx(dto1.getIdx());
				int update = ps.updatePos(sell);
			}
		}
		
		if(sellRow == 1 ) {
			basket = new ArrayList<PosDTO>();
		}
		return "list";
	}
	
	// 판매된 내역 보여주기
	@RequestMapping("list")
	public String list() {
		List<sellDTO> sellList = ss.getBasket();
		session.setAttribute("sellList", sellList);
		return "list";
	}
	
	@GetMapping("select/{idx}")
	public ModelAndView select(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("redirect:/");
		PosDTO dto = ps.getOne(idx);
		
		if(dto.getCount() < 1 ) {
			mav.setViewName("msg");
			mav.addObject("msg", "수량이 부족합니다");
			return mav;
		}
		else {
			dto.setCount(1);
		}
		
		boolean check = true;
		int total = 0;
		
		for(PosDTO pos:basket) {
			if(pos.getProduct().equals(dto.getProduct())) {
				pos.setCount(pos.getCount() + 1);
				pos.setPrice(pos.getCount() * dto.getPrice());
				check = false;
			}
			total += pos.getPrice();
		}
		
		if(check) {
			basket.add(dto);
			total += dto.getPrice();
		}
		session.setAttribute("total", total);
		return mav;
	}
	
	@GetMapping("init")
	public String init() {
		basket = new ArrayList<PosDTO>();
		return "redirect:/";
	}
	
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(MemberDTO dto) {
		MemberDTO login = ms.getMember(dto);
		session.setAttribute("login", login);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(login != null ? "redirect:/" : "msg");
		if(login == null) {
			mav.addObject("msg", "일치하는 정보가 없습니다");
		}
		return mav;
	}
	
	@GetMapping("logout")
	public String logout() {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	@GetMapping("join")
	public void join() {}
	
	@PostMapping(value="checkId", produces = "application/text;charset=utf8")
	@ResponseBody
	public String checkId(String userid) {
		boolean alreadyExist = ms.checkId(userid);
		return alreadyExist ? "이미 사용중인 ID입니다" : "사용가능한 ID입니다";
	}
	
	@PostMapping("join")
	public String join(MemberDTO user) {
		int row = ms.joinMember(user);
		return (row == 1 ? "redirect:/" : "redirect:/join");
	}
	
	
}
