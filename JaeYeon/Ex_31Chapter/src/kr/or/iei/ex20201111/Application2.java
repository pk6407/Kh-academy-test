package kr.or.iei.ex20201111;

import java.util.ArrayList;
import java.util.List;

public class Application2 {

	public static void main(String[] args) {
		List<String> list = new ArrayList<>();
		list.add("����");
		list.add("����");
		list.add("���");
		
		list.remove("����");
		
		for(String s : list) {
			System.out.println(s);
		}
		System.out.println(list.contains("����"));
	}

}
