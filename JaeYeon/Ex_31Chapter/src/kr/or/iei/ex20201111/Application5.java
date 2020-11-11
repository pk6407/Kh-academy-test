package kr.or.iei.ex20201111;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Application5 {

	public static void main(String[] args) {
		final List<String>list = List.of("포도","바나나","사과","아보카도","오렌지");

		final List<String>filteredList =
				list.stream()	// 1. 스트림 생성
				.filter(s -> s.length() <= 2)	// 2. 가공 단계
				.collect(Collectors.toList());	// 3. 취합 단계

		for(String s : filteredList) {
			System.out.println(s);
		}
	}
}
