package kr.or.iei.ex20201111;

import java.util.ArrayList;
import java.util.List;

public class Application2 {

	public static void main(String[] args) {
		List<String> list = new ArrayList<>();
		list.add("포도");
		list.add("포도");
		list.add("사과");
		
		list.remove("포도");
		
		for(String s : list) {
			System.out.println(s);
		}
		System.out.println(list.contains("포도"));
	}

}
