package kr.or.iei.ex20201111;

import java.util.HashMap;
import java.util.Map;

public class Application4 {

	public static void main(String[] args) {
		Map<String,String> map= new HashMap<>();
		map.put("one", "�ϳ�");
		map.put("two", "��");
		
		for(Map.Entry<String,String>entry : map.entrySet()) {
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
			System.out.println("---------------------");
		}
	}
}
