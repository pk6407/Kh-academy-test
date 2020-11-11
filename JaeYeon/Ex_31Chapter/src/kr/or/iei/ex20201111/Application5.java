package kr.or.iei.ex20201111;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Application5 {

	public static void main(String[] args) {
		final List<String>list = List.of("����","�ٳ���","���","�ƺ�ī��","������");

		final List<String>filteredList =
				list.stream()	// 1. ��Ʈ�� ����
				.filter(s -> s.length() <= 2)	// 2. ���� �ܰ�
				.collect(Collectors.toList());	// 3. ���� �ܰ�

		for(String s : filteredList) {
			System.out.println(s);
		}
	}
}
