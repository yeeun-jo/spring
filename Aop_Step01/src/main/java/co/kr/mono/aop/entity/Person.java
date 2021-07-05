package co.kr.mono.aop.entity;

import java.util.ArrayList;
import java.util.List;

import co.kr.mono.aop.ui.Printer;

public class Person {
	String name, major;
	List<ExamScore> examList;
	private Printer printer;
	
	public Person() {
	}

	public Person(String name, String major, List<ExamScore> examList, Printer printer) {
		super();
		this.name = name;
		this.major = major;
		this.examList = examList;
		this.printer = printer;
	}

	public Printer getPrinter() {
		return printer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public List<ExamScore> getExamList() {
		return examList;
	}

	public void setExamList(List<ExamScore> examList) {
		this.examList = examList;
	}

	public void setPrinter(Printer printer) {
		this.printer = printer;
	}

	// 핵심로직
	public void print() {
		String str = "Person [name =" + name + ", major = " + major + "]\n"
				+ "ExamList=" + examList+"]";
		printer.print(str);
	}
}
