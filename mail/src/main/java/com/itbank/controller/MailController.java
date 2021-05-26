package com.itbank.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.Hash;
import com.itbank.service.MailService;

@RestController
public class MailController {
	
	@Autowired private MailService ms;
	
	// pathVariable에 특수문자 또는 공백이 들어갈경우 끝에도 / 붙여주기
	@GetMapping(value = "mailto/{mailAddress}/", produces = "application/text;charset=utf8")
	public String mailto(@PathVariable String mailAddress, HttpSession session) throws FileNotFoundException {
		System.out.println("session : " + session);
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/mailAccount.dat");
		File f = new File(filePath);
		if(f.exists() == false) {
			return "메일 전송에 필요한 계정 정보를 찾을 수 없습니다";
		}
		Scanner sc = new Scanner(f);
		String account = null;
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();

		String authNumber = ms.getAuthNumber();			// 6자리 정수 인증번호
		String hashNumber = Hash.getHash(authNumber);	// 인증번호를 해시처리
		session.setAttribute("hashNumber", hashNumber);	// 해시처리 된 인증번호를 세션에 저장

		String result = ms.sendMail(mailAddress,authNumber,account);
		if(result.equals(authNumber)) {	// 메일이 정상적으로 발송되었으면, 인증번호의 hash값을 반환한다
			return hashNumber;
		}
		else {	// 예외가 발생하면 예외 문구를 반환한다
			return result; 
		}
	}
	
	@GetMapping("getAuthResult/{userNumber}")
	public String getAuthResult(@PathVariable String userNumber, HttpSession session) {
		String hashNumber = (String) session.getAttribute("hashNumber");
		boolean flag = hashNumber.equals(Hash.getHash(userNumber));
		return Boolean.toString(flag);
		
	}

}
