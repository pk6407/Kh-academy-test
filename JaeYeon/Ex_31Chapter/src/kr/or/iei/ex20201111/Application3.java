package kr.or.iei.ex20201111;

import java.util.HashSet;
import java.util.Set;

public class Application3 {

	public static void main(String[] args) {
		Set<String> set= new HashSet<>();
		set.add("����");
		set.add("����");
		set.add("���");
		
		for(String s : set) {
			System.out.println(s);
		}
		System.out.println(set.contains("����"));
	}

}
