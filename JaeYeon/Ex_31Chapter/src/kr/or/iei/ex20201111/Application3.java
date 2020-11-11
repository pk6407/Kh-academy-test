package kr.or.iei.ex20201111;

import java.util.HashSet;
import java.util.Set;

public class Application3 {

	public static void main(String[] args) {
		Set<String> set= new HashSet<>();
		set.add("포도");
		set.add("포도");
		set.add("사과");
		
		for(String s : set) {
			System.out.println(s);
		}
		System.out.println(set.contains("포도"));
	}

}
