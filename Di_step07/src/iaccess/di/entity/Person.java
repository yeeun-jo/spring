package iaccess.di.entity;

public class Person implements Comparable<Person>{
	
	private String name;
	private int age;
	
	public Person(String name,int age) {
		this.setName(name);
		this.setAge(age);
	}
	
	public Person() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public int compareTo(Person o) {
		return this.age - o.getAge();	// 오름차순
		// 나이기준으로 정렬
//		return this.age - o.getAge() * -1;	내림차순
	}
	
	@Override
	public String toString() {
		return "Person [name=" + name +", age = "+ age +"]"; 
	}

	
}
